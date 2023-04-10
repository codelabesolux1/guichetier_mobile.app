import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class APropos extends StatelessWidget {
  const APropos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFDD3705),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 30),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        Gap(MediaQuery.of(context).size.width / 4),
                        Center(
                          child: Text(
                            "A propos",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(MediaQuery.of(context).padding.top + 130),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Bienvenue sur notre plateforme « GUICHETIER »  de réservation d'évenement"
                        "! Nous sommes une entreprise dédiée à offrir à nos clients une expérience dans l'evenementiel."
                        "\n\n"
                        "Notre plateforme de location de véhicules vous permet de louer une voiture, un van ou un SUV pour votre voyage."
                        ". Nous avons une large sélection de véhicules proposés par nos partenaires pour répondre à tous les besoins de voyage, que ce soit pour un voyage d'affaires ou"
                        "pour des vacances en famille. Vous pouvez facilement rechercher et comparer les prix des différentes options de location disponibles"
                        ", ainsi que les caractéristiques de chaque véhicule pour choisir celui qui convient le mieux à vos besoins."
                        "\n\n"
                        "En outre, notre plateforme propose également la réservation de billets de bus, avec un choix de destinations à travers le pays"
                        ". Vous pouvez facilement trouver des horaires de départ et d'arrivée, des itinéraires"
                        ", des tarifs et des options de siège disponibles pour chaque trajet. Vous pouvez également réserver des billets aller-retour pour les voyages de courte ou de longue distance."
                        "\n\n"
                        "Nous travaillons avec les meilleurs fournisseurs de services de location de véhicules et de transport par bus pour vous offrir une expérience de voyage fiable et sûre"
                        ". Notre plateforme est facile à utiliser et notre équipe de support client est disponible pour répondre à toutes vos questions et préoccupations."
                        "\n\n"
                        "Nous sommes fiers d'offrir une expérience de voyage de haute qualité à nos clients et nous nous engageons à améliorer constamment nos services pour répondre à leurs besoins"
                        ". Nous espérons que vous apprécierez l'utilisation de notre plateforme pour organiser votre prochain voyage.",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 40,
              left: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/best_about_us_pages.png",
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
