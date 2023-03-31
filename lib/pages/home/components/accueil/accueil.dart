import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  List<String> categories = [
    "Tous",
    "Concert",
    "Foire",
    "Miss",
    "Cinema",
    "Sport",
  ];

  List homeBody = const [
    /// TOUS //////////////////////////////////////
    Text("Tous"),
    ///////////////////////////////////////////////////////////
    /// CONCERT //////////////////////////////////////
    Text("Concert"),

    /// FOIRE //////////////////////////////////////
    Text("Foire"),

    /// MISS //////////////////////////////////////
    Text("Miss"),

    /// CINEMA //////////////////////////////////////
    Text("Cinema"),

    /// SPORT //////////////////////////////////////
    Text("Sport"),

    ///
  ];

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          decoration: const BoxDecoration(
            color: Color(0xFFDD3705),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                right: 45,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Positioned(
                top: 25,
                right: 60,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA002A0).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).padding.left + 5,
                        ),
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 0.8),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/logo/icon_guichetier.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Gotflo",
                        style: TextStyle(
                          color: Color(0xFFE0E0E0),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_active,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const Gap(5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const SearchPage(),
                          //   ),
                          // );
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          fillColor: const Color(0xFF575757).withOpacity(0.5),
                          filled: true,
                          contentPadding: const EdgeInsets.all(2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Rechercher",
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          prefixIconColor: Colors.grey,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(0, 244, 67, 54),
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(0, 244, 67, 54),
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Catégorie",
                      style: TextStyle(
                        color: Color(0xFFE0E0E0),
                      ),
                    ),
                  ),
                  const Gap(5),
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 22,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: current == index
                                  ? const Color(0xFF575757)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(3),
                                bottomLeft: Radius.circular(
                                  current == 0 ? 10 : 3,
                                ),
                                topRight: const Radius.circular(3),
                                bottomRight:
                                    Radius.circular(current == 5 ? 10 : 3),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                  color: current == index
                                      ? const Color(0xFFE0E0E0)
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              homeBody[current],
            ],
          ),
        )
      ],
    );
  }
}
