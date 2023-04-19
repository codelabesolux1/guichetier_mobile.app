import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:guichetier/providers/payement_ticket_provider.dart';
import 'package:provider/provider.dart';

class PayementTicket extends StatefulWidget {
  final String imageUrl;
  final String enventUID;
  final String societeUID;
  final int price;

  const PayementTicket({
    Key? key,
    required this.enventUID,
    required this.societeUID,
    required this.imageUrl,
    required this.price,
  }) : super(key: key);

  @override
  State<PayementTicket> createState() => _PayementTicketState();
}

class _PayementTicketState extends State<PayementTicket> {
  int nbrticket = 1;

  @override
  Widget build(BuildContext context) {
    final providePayementTicket = Provider.of<PayementTicketProvider>(context);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // <-- SEE HERE
        statusBarIconBrightness:
            Brightness.dark, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.dark, //<-- For iOS SEE HERE (dark icons)
      ),
    );
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                // height: MediaQuery.of(context).size.height / 2.3,
                width: double.infinity,
                imageUrl: widget.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                // fit: BoxFit.cover,
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                left: MediaQuery.of(context).padding.left + 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(300),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ticket à scanner sur place",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                    const Divider(),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(96, 221, 55, 5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.tag,
                                  color: Color(0xFFDD3705),
                                ),
                                const Gap(8),
                                Text(
                                  "${widget.price} F",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                border: Border.all(
                                  width: 2,
                                  color: nbrticket == 1
                                      ? Colors.grey
                                      : const Color(0xFFDD3705),
                                ),
                              ),
                              child: IconButton(
                                onPressed: nbrticket == 1
                                    ? null
                                    : () {
                                        setState(() {
                                          nbrticket--;
                                          providePayementTicket.montantTotal =
                                              widget.price * nbrticket;
                                        });
                                      },
                                icon: Icon(
                                  FontAwesomeIcons.minus,
                                  color: nbrticket == 1
                                      ? Colors.grey
                                      : const Color(0xFFDD3705),
                                ),
                              ),
                            ),
                            const Gap(8),
                            Text(
                              "$nbrticket",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const Gap(8),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                border: Border.all(
                                  width: 2,
                                  color: nbrticket == 10
                                      ? Colors.grey
                                      : const Color(0xFFDD3705),
                                ),
                              ),
                              child: IconButton(
                                onPressed: nbrticket == 10
                                    ? null
                                    : () {
                                        setState(() {
                                          nbrticket++;
                                          providePayementTicket.montantTotal =
                                              widget.price * nbrticket;
                                        });
                                      },
                                icon: Icon(
                                  Icons.add,
                                  color: nbrticket == 10
                                      ? Colors.grey
                                      : const Color(0xFFDD3705),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(5),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFDD3705),
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 3.3,
                    right: MediaQuery.of(context).size.width / 3.3,
                  ),
                ),
                onPressed: () async {
                  // print("Validé");
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                      .collection("tickets")
                      .add({
                    "uidEvent": widget.enventUID,
                    "uidSociete": widget.societeUID,
                    "total": providePayementTicket.montantTotal,
                    "quantite": nbrticket,
                    "date": Timestamp.now(),
                  }).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Ticket payer"),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    Navigator.of(context).pop();
                  });
                },
                child: Text(
                  "Payer • ${providePayementTicket.montantTotal} F",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  motantTotal() {}
}
