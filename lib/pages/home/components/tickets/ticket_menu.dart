import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:guichetier/pages/home/components/tickets/my_ticket_detail.dart';

class TicketMenu extends StatelessWidget {
  const TicketMenu({super.key});

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
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                .collection("tickets")
                .snapshots(),
            builder: ((BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot1) {
              if (snapshot1.connectionState == ConnectionState.waiting) {
                return const Text("");
              }
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: snapshot1.data!.docs.map((DocumentSnapshot document) {
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
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                                uidSociete:  ticketData["uidSociete"],),
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
                                  height: 60,
                                  imageUrl: data["afficheUrl"],
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data["title"],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Gap(8),
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
        ),
      ),
    );
  }
}
