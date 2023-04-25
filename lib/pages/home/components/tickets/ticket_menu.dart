import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guichetier/pages/home/components/tickets/my_ticket_detail.dart';

class TicketMenu extends StatefulWidget {
  const TicketMenu({super.key});

  @override
  State<TicketMenu> createState() => _TicketMenuState();
}

class _TicketMenuState extends State<TicketMenu> {
  final referenceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tickets"),
      ),
      backgroundColor: const Color(0xFFE9E9E9),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: customTextField(
                        referenceController, "Code de l'évenement"),
                  ),
                  const Gap(8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFDD3705),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('tickets')
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text("Waiting");
                                  }
                                  var tickets = snapshot.data!.docs
                                      .where((DocumentSnapshot document) {
                                    Map<String, dynamic> documentSnapshot =
                                        document.data()!
                                            as Map<String, dynamic>;
                                    return documentSnapshot['ticketGenerate'] ==
                                        referenceController.value.text;
                                  }).toList();
                                  return ListView(
                                      padding: const EdgeInsets.only(
                                        top: 0,
                                        bottom: 10,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: tickets
                                          .map((DocumentSnapshot document2) {
                                        Map<String, dynamic> documentSnapshot2 =
                                            document2.data()!
                                                as Map<String, dynamic>;
                                        return documentSnapshot2["uidUser"] ==
                                                ""
                                            ? Column(
                                                children: [
                                                  Text(
                                                      "Code: ${referenceController.value.text}"),
                                                  const Gap(8),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection("tickets")
                                                          .doc(document2.id)
                                                          .update({
                                                        "uidUser": FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid
                                                            .toString(),
                                                        "date": Timestamp.now(),
                                                      });
                                                      setState(() {
                                                        referenceController
                                                            .clear();
                                                      });
                                                      // ignore: use_build_context_synchronously
                                                      Navigator.pop(context);
                                                    },
                                                    child:
                                                        const Text('Valider'),
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                children: [
                                                  Text(
                                                      "Le code : ${referenceController.value.text} est déjà utiliser"),
                                                ],
                                              );
                                      }).toList());
                                });
                          });
                      // Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("tickets")
                    .where(
                      "uidUser",
                      isEqualTo:
                          FirebaseAuth.instance.currentUser!.uid.toString(),
                    )
                    .snapshots(),
                builder: ((BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot1) {
                  if (snapshot1.connectionState == ConnectionState.waiting) {
                    return const Text("");
                  }
                  return ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children:
                        snapshot1.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> ticketData =
                          document.data()! as Map<String, dynamic>;
                      return FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection("societe")
                            .doc(ticketData["uidSociete"])
                            .collection("events")
                            .doc(ticketData["uidEvent"])
                            .get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text("Une erreur s'est produite");
                          }

                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return const Center(child: Text("Pas de Tickets"));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text("Connexion waiting");
                          }
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyTicketDetail(
                                    uidEvent: ticketData["uidEvent"],
                                    uidSociete: ticketData["uidSociete"],
                                    montantTicket: ticketData["montantTicket"],
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    child: CachedNetworkImage(
                                      width: 70,
                                      height: 65,
                                      imageUrl: data["afficheUrl"],
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
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data["title"],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Gap(1),
                                        Row(
                                          children: [
                                            const Text(
                                              "Ticket : ",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              "${ticketData["montantTicket"]} CFA",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFFDD3705),
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Gap(1),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_sharp,
                                              color: Colors.grey,
                                              size: 15,
                                            ),
                                            Text(
                                              data["lieu"],
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField customTextField(
      TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        // setState(() {
        //   btnStatus = true;
        // });
      },
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
        color: Colors.black.withOpacity(0.9),
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        floatingLabelStyle: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
          color: const Color(0xFFDD3705),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFDD3705), width: 2),
        ),
        contentPadding: const EdgeInsets.only(bottom: 3, left: 18),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: '',
        hintStyle: GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}
