import 'package:flutter/material.dart';

class VersionApplication extends StatelessWidget {
  const VersionApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 235, 227, 225).withOpacity(0.97),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.height / 2.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 136, 9, 0),
                            width: 3),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white.withOpacity(0.8)),
                    child: const Icon(
                      Icons.close,
                      color: Color.fromARGB(255, 136, 9, 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "Version : 1.0",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Container(
            width: 260,
            height: 160,
            decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF), shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 30, bottom: 30),
              child: Image.asset(
                'assets/logo/icon_guichetier.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Spacer(),
          Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              Text(
                "From KOMAL Technologies",
                style: TextStyle(
                  color: Color(0xFFDD3705),
                ),
              ),
              Text(
                "©Tous droits réservés",
                style: TextStyle(
                  color: Color(0xFFDD3705),
                ),
              ),
              Text(
                "GUICHETIER",
                style: TextStyle(
                  color: Color(0xFFDD3705),
                ),
              ),
              Text(
                "2022",
                style: TextStyle(
                  color: Color(0xFFDD3705),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
