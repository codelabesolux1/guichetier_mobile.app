import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:guichetier/pages/home/components/accueil/components/events_detail/detail_sliver.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailSliverDelegate(
              imageurl:
                  "https://www1.chester.ac.uk/sites/default/files/styles/hero/public/Events%20Management%20festival%20image.jpg?itok=eJ3k-5R6",
              expandedHeight: MediaQuery.of(context).size.height / 3,
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
                          const Text(
                            "Loren Ispun ispun loren to go title",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(8),
                          Row(
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  height: 40,
                                  width: 40,
                                  imageUrl:
                                      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              const Gap(8),
                              const Text(
                                "Jeffa Event",
                                style: TextStyle(
                                  color: Color(0xFF808080),
                                ),
                              )
                            ],
                          )
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
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 6,
                            bottom: 6,
                            left: 6,
                            right: 6,
                          ),
                          child: Icon(
                            CupertinoIcons.music_albums,
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
                    textAlign: TextAlign.justify,
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Bibendum non ultricies elit, onsectetur adipiscing elit. ",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    FontAwesomeIcons.calendar,
                                    color: Color(0xFF585858),
                                  ),
                                  Gap(8),
                                  Text("30 avr 2023"),
                                ],
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    FontAwesomeIcons.clock,
                                    color: Color(0xFF585858),
                                  ),
                                  Gap(8),
                                  Text("15h30"),
                                ],
                              ),
                            ],
                          ),
                          const Gap(30),
                          Row(
                            children: const [
                              Icon(
                                FontAwesomeIcons.locationDot,
                                color: Color(0xFF585858),
                              ),
                              Gap(8),
                              Text("Lieu où se fera l'evenenment"),
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(color: Color(0x52F44336)),
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(color: Color(0x52F44336)),
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(color: Color(0x52F44336)),
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
      ),
    );
  }
}
