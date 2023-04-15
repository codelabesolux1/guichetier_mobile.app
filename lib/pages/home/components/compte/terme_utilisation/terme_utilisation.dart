import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class TermeCondition extends StatelessWidget {
  const TermeCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFDD3705),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 20),
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
                    // Gap(MediaQuery.of(context).size.width / 8),
                    Center(
                      child: Text(
                        "Termes et conditions d’utilisation",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Bienvenue sur notre application de location de véhicules et de réservation de tickets de bus. Avant d'utiliser nos services, veuillez lire attentivement les termes et conditions suivants :",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const Gap(10),
                      const CustomExpansionContainer(
                          title: "1. Utilisation de l’application",
                          childrenText:
                              "En utilisant notre application, vous acceptez d'être lié par les termes et conditions énoncés ci-dessous. Si vous n'acceptez pas ces termes et conditions, veuillez ne pas utiliser notre application."),
                      const Gap(4),
                      const CustomExpansionContainer(
                          title:
                              "2. Réservation de location de véhicules et de tickets de bus",
                          childrenText:
                              "L'application vous permet de réserver des véhicules et des tickets de bus à l'avance. Vous devez fournir des informations exactes et complètes lors de la réservation."),
                      const Gap(4),
                      const CustomExpansionContainer(
                          title: "3. Conditions de paiement",
                          childrenText:
                              "Le paiement doit être effectué à l'avance pour confirmer votre réservation. Les tarifs de location de véhicules et de tickets de bus peuvent varier en fonction de la période de réservation et de la disponibilité."),
                      const Gap(4),
                      const CustomExpansionContainer(
                          title: "4. Annulation et remboursement ",
                          childrenText:
                              "Toute annulation de réservation doit être effectuée au moins 24 heures avant la date de la réservation. Les remboursements seront effectués conformément à la politique de remboursement de la compagnie."),
                      const Gap(4),
                      const CustomExpansionContainer(
                          title: "5. Responsabilité",
                          childrenText:
                              "Vous êtes responsable de tout dommage causé au véhicule pendant la période de location. Si vous ne respectez pas les conditions de location de la compagnie choisie, la compagnie de location se réserve le droit de résilier le contrat de location et de récupérer le véhicule."),
                      const Gap(4),
                      const CustomExpansionContainer(
                          title: "6. Confidentialité",
                          childrenText:
                              "Nous respectons votre vie privée et ne divulguerons pas vos informations personnelles à des tiers, sauf dans les cas prévus par la loi."),
                      const Gap(4),
                      const CustomExpansionContainer(
                          title: "7. Modification des termes et conditions",
                          childrenText:
                              "Nous nous réservons le droit de modifier ces termes et conditions à tout moment sans préavis. Il vous incombe de vérifier régulièrement les modifications."),
                      const Gap(4),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomExpansionContainer extends StatelessWidget {
  const CustomExpansionContainer({
    Key? key,
    required this.title,
    required this.childrenText,
  }) : super(key: key);
  final String title;
  final String childrenText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 228, 228, 228),
      child: ExpansionTile(
        backgroundColor: const Color.fromARGB(255, 209, 209, 209),
        title: Text(title),
        leading: const Icon(
          Icons.add_circle_outline,
          color: Color(0xFFDD3705),
        ),
        children: [
          Text(
            childrenText,
            style: GoogleFonts.poppins(
              color: Colors.black,
            ),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
