import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guichetier/pages/home/components/accueil/accueil.dart';
import 'package:guichetier/pages/home/components/compte/compte_menu.dart';
import 'package:guichetier/pages/home/components/tickets/ticket_menu.dart';
import 'package:guichetier/pages/home/components/vedette/vedette_menu.dart';
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
    VedetteMenu(),
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
      backgroundColor: const Color(0xFFE9E9E9),
      //BODY //
      body: menu[providerNavBar.currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          // type: BottomNavigationBarType.fixed,
          currentIndex: providerNavBar.currentIndex,
          // backgroundColor: const Color(0xFFDD3705),
          selectedItemColor: const Color(0xFFDD3705),
          unselectedItemColor: Colors.black26,
          elevation: 4,
          onTap: (value) {
            providerNavBar.currentIndex = value;
          },
          items: const [
            BottomNavigationBarItem(
              // backgroundColor: Color(0xFFDD3705),
              label: "Accueil",
              icon: Icon(
                CupertinoIcons.home,
              ),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Color(0xFFDD3705),
              label: "Vedette",
              icon: Icon(
                CupertinoIcons.bookmark_fill,
              ),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Color(0xFFDD3705),
              label: "Ticket",
              icon: Icon(
                CupertinoIcons.tickets,
              ),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Color(0xFFDD3705),
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
