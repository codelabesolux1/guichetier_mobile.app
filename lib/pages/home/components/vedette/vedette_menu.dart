import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:guichetier/pages/home/components/accueil/components/events_detail/event_detail.dart';

class VedetteMenu extends StatelessWidget {
  const VedetteMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vedette"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
            padding: const EdgeInsets.only(
              top: 0,
              bottom: 10,
            ),
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const EventDetail(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffDDDDDD),
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "https://www1.chester.ac.uk/sites/default/files/styles/hero/public/Events%20Management%20festival%20image.jpg?itok=eJ3k-5R6",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                // fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Container(
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
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                      top: 6,
                                      bottom: 6,
                                      left: 6,
                                      right: 6,
                                    ),
                                    child: Icon(
                                      CupertinoIcons.music_albums,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
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
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                      top: 6,
                                      bottom: 6,
                                      left: 6,
                                      right: 6,
                                    ),
                                    child: Icon(
                                      CupertinoIcons.bookmark_fill,
                                      color: Color.fromARGB(255, 0, 151, 20),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
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
                                      top: 1,
                                      bottom: 1,
                                      left: 6,
                                      right: 6,
                                    ),
                                    child: Column(
                                      children: const [
                                        Text(
                                          "24",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Ven"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Text(
                                  "Loren Ispun ispun loren to go title",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Description de l'evenement",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(8),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
