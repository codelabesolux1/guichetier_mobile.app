import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guichetier/pages/home/components/compte/compte_courant/components/recharge_page/carte_bancaire.dart';
import 'package:guichetier/pages/home/components/compte/compte_courant/components/recharge_page/mobile_money.dart';

class RecharchePage extends StatefulWidget {
  const RecharchePage({super.key});

  @override
  State<RecharchePage> createState() => _RecharchePageState();
}

class _RecharchePageState extends State<RecharchePage> {
  int selectedIndex = 0;
  List<String> categories = [
    "Mobile money",
    "Carte bancaire",
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    List homeBody = const [
      MobileMoney(),
      CarteBancaire(),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: const Color(0xFFDD3705),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Recharger",
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 15,
              bottom: 10,
              right: MediaQuery.of(context).size.height / 18,
              left: MediaQuery.of(context).size.height / 18,
            ),
            child: Container(
              // width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: const Color.fromARGB(255, 207, 207, 207),
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
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
                            ? const Color(0xFFDD3705)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              fontSize: 15,
                              color: current == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          //BODY
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  homeBody[current],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
