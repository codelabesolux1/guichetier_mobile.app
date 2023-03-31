import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guichetier/pages/home/components/accueil/accueil.dart';
import 'package:guichetier/pages/home/components/compte/compte_menu.dart';
import 'package:guichetier/pages/home/components/events/events_menu.dart';
import 'package:guichetier/pages/home/components/tickets/ticket_menu.dart';
import 'package:guichetier/providers/nav_bar_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> menu = const [
    Accueil(),
    EventMenu(),
    TicketMenu(),
    CompteMenu(),
  ];

  @override
  Widget build(BuildContext context) {
    final providerNavBar = Provider.of<NavBarProvider>(context);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFDD3705), // <-- SEE HERE
        statusBarIconBrightness:
            Brightness.light, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.light, //<-- For iOS SEE HERE (dark icons)
        systemNavigationBarColor: Color(0xFFDD3705),
        systemNavigationBarIconBrightness: Brightness.light,
        // systemNavigationBarDividerColor: Color(0xFF03BE0C),
      ),
    );
    return Scaffold(
      // AppBar(
      //   elevation: 2,
      //   backgroundColor: const Color(0xFFDD3705),
      //   leading: Container(
      //     width: 37,
      //     height: 37,
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       shape: BoxShape.circle,
      //       border: Border.all(color: Colors.grey, width: 0.8),
      //     ),
      //     child: ClipOval(
      //       child: Image.asset(
      //         "assets/logo/icon_guichetier.png",
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //   ),
      //   title: SizedBox(
      //     height: 40,
      //     child: TextField(
      //       onTap: () {
      //         // Navigator.push(
      //         //   context,
      //         //   MaterialPageRoute(
      //         //     builder: (context) => const SearchPage(),
      //         //   ),
      //         // );
      //       },
      //       readOnly: true,
      //       decoration: InputDecoration(
      //         filled: true,
      //         contentPadding: const EdgeInsets.all(2),
      //         border: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //         hintText: "Rechercher",
      //         hintStyle: TextStyle(
      //           color: Colors.grey.withOpacity(0.5),
      //         ),
      //         prefixIcon: const Icon(Icons.search),
      //         prefixIconColor: Colors.grey,
      //         enabledBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: Color.fromARGB(0, 244, 67, 54),
      //             width: 0,
      //           ),
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //         focusedBorder: OutlineInputBorder(
      //           borderSide: const BorderSide(
      //             color: Color.fromARGB(0, 244, 67, 54),
      //             width: 0,
      //           ),
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.notifications_active,
      //         color: Colors.white,
      //       ),
      //     )
      //   ],
      // ),
      backgroundColor: const Color(0xFFE9E9E9),
      //BODY //
      body: menu[providerNavBar.currentIndex],

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          currentIndex: providerNavBar.currentIndex,
          backgroundColor: const Color(0xFFDD3705),
          unselectedItemColor: Colors.black54,
          elevation: 4,
          onTap: (value) {
            providerNavBar.currentIndex = value;
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color(0xFFDD3705),
              label: "Accueil",
              icon: Icon(
                CupertinoIcons.home,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFFDD3705),
              label: "Event",
              icon: Icon(
                CupertinoIcons.calendar,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFFDD3705),
              label: "Ticket",
              icon: Icon(
                CupertinoIcons.tickets,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFFDD3705),
              label: "Compte",
              icon: Icon(
                CupertinoIcons.person_fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
