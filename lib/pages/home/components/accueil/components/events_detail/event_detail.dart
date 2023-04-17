import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:guichetier/pages/home/components/accueil/components/events_detail/detail_sliver.dart';
import 'package:guichetier/pages/home/components/accueil/components/events_detail/payement_ticket.dart';
import 'package:guichetier/providers/payement_ticket_provider.dart';

class EventDetail extends StatefulWidget {
  final String enventUID;
  final String societeUID;
  const EventDetail({
    Key? key,
    required this.enventUID,
    required this.societeUID,
  }) : super(key: key);

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
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
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection("societe")
            .doc(widget.societeUID)
            .collection('events')
            .doc(widget.enventUID)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Une erreur s'est produite");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Pas de detail");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Connexion waiting");
          }
          Map<String, dynamic> eventDetail =
              snapshot.data!.data() as Map<String, dynamic>;
          DateTime date = DateFormat('dd/MM/yyyy').parse(eventDetail["date"]);
          return CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: DetailSliverDelegate(
                  imageurl: eventDetail['afficheUrl'],
                  expandedHeight: MediaQuery.of(context).size.height / 2.5,
                  roundedContainerHeight: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                eventDetail['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(8),
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("societe")
                                    .doc(widget.societeUID)
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text("");
                                  }
                                  return Row(
                                    children: [
                                      ClipOval(
                                        child: CachedNetworkImage(
                                          height: 40,
                                          width: 40,
                                          imageUrl:
                                              snapshot.data.data()["logo-url"],
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          // fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Gap(8),
                                      Text(
                                        snapshot.data.data()["raison_sociale"],
                                        style: const TextStyle(
                                          color: Color(0xFF808080),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF575757),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xffDDDDDD),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 6,
                                bottom: 6,
                                left: 6,
                                right: 6,
                              ),
                              child: Icon(
                                eventDetail["category"] == "Concert"
                                    ? CupertinoIcons.music_albums
                                    : eventDetail["category"] == "Foire"
                                        ? Icons.stadium_outlined
                                        : eventDetail["category"] == "Miss"
                                            ? FontAwesomeIcons.crown
                                            : eventDetail["category"] ==
                                                    "Cinema"
                                                ? Icons.ondemand_video
                                                : eventDetail["category"] ==
                                                        "Sport"
                                                    ? CupertinoIcons
                                                        .sportscourt_fill
                                                    : CupertinoIcons
                                                        .number_square,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(15),
                      const Text(
                        "Description de l'evenement : ",
                        style: TextStyle(
                          color: Color(0xFF808080),
                          fontSize: 18,
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        // textAlign: TextAlign.justify,
                        eventDetail['description'],
                        style: const TextStyle(
                          color: Color(0xFF808080),
                        ),
                      ),
                      const Gap(15),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0x1CDD3705),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0x5ACACACA),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.calendar,
                                        color: Color(0xFF585858),
                                      ),
                                      const Gap(8),
                                      Text(DateFormat('dd MMM yyyy', 'fr_FR')
                                          .format(
                                        date,
                                      )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.clock,
                                        color: Color(0xFF585858),
                                      ),
                                      const Gap(8),
                                      Text(eventDetail["heure"]),
                                    ],
                                  ),
                                ],
                              ),
                              const Gap(30),
                              Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.locationDot,
                                    color: Color(0xFF585858),
                                  ),
                                  const Gap(8),
                                  Text(eventDetail["lieu"]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(20),
                      GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: (1 / .35),
                        padding: const EdgeInsets.only(
                          bottom: 2,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        // gridDelegate:
                        //     const SliverGridDelegateWithFixedCrossAxisCount(
                        //   crossAxisCount: 2,
                        // ),
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PayementTicket(
                                    imageUrl:
                                        "https://www1.chester.ac.uk/sites/default/files/styles/hero/public/Events%20Management%20festival%20image.jpg?itok=eJ3k-5R6",
                                    price: 3000,
                                    typeTicket: "Ticket simple",
                                  ),
                                ),
                              );
                              providePayementTicket.montantTotal = 3000;
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side:
                                    const BorderSide(color: Color(0x52F44336)),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                children: const [
                                  Text("Ticket simple"),
                                  Text("3000 CFA"),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PayementTicket(
                                    imageUrl:
                                        "https://www1.chester.ac.uk/sites/default/files/styles/hero/public/Events%20Management%20festival%20image.jpg?itok=eJ3k-5R6",
                                    price: 5000,
                                    typeTicket: "Ticket VIP",
                                  ),
                                ),
                              );
                              providePayementTicket.montantTotal = 5000;
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side:
                                    const BorderSide(color: Color(0x52F44336)),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                children: const [
                                  Text("Ticket VIP"),
                                  Text("5000 CFA"),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PayementTicket(
                                    imageUrl:
                                        "https://www1.chester.ac.uk/sites/default/files/styles/hero/public/Events%20Management%20festival%20image.jpg?itok=eJ3k-5R6",
                                    price: 10000,
                                    typeTicket: "Réservation",
                                  ),
                                ),
                              );
                              providePayementTicket.montantTotal = 10000;
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side:
                                    const BorderSide(color: Color(0x52F44336)),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                children: const [
                                  Text("Réservation"),
                                  Text("10000 CFA"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Gap(8),
                      const Text(
                        "Localisation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          "assets/images/maps.jpg",
                          height: 100,
                          width: double.infinity,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
