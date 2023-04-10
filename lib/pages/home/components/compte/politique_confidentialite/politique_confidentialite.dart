import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PolitiqueConfidentialite extends StatelessWidget {
  const PolitiqueConfidentialite({Key? key}) : super(key: key);

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
                    Gap(MediaQuery.of(context).size.width / 16),
                    Center(
                      child: Text(
                        "Politique de confidentialité",
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
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomPolitiqueContainer(
                        title: "Politique de confidentialités",
                        column: Column(
                          children: [
                            Text(
                              "Hupe, dans un souci de transparence et de respect de la protection de vos données personnelles, "
                              "vous présente la façon dont nous collectons et traitons les données personnelles que vous pouvez être amenés à nous fournir."
                              " Le terme « données personnelles » désigne les informations relatives à une personne physique identifiée ou qui peut être identifiée.",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      CustomPolitiqueContainer(
                        title: "Données personnelles collectées",
                        column: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hupe veille à ne collecter et à ne traiter que les données strictement nécessaires au bon fonctionnement de nos services. "
                              "La nature des données collectées varie en fonction de la relation que vous établissez avec Redoffres,"
                              " selon que vous soyez visiteur d’un de nos sites, un client, "
                              " ou un partenaire. Lorsque que vous utilisez nos services, une ou plusieurs données personnelles peuvent être collectées : ",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "• adresse IP",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• données de connexion et de navigation",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• email",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• civilité",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• prénom",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• nom",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• pays",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• numéro d’immatriculation",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• n° de téléphone",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• photographie",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• adresse postale",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• numéro de téléphone",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• liens vers des pages de réseaux sociaux, historiques de commandes, réclamations, incidents, informations relatives aux abonnements et correspondances sur notre site.",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Certaines données sont collectées automatiquement du fait de vos actions sur le site (voir le paragraphe relatif aux données de navigation « cookies »).",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                            Text(
                              "En utilisant nos services payants, vous êtes considéré comme un « professionnel » au sens de la législation.",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      CustomPolitiqueContainer(
                        title:
                            "Données collectées lors de vos visites sur les sites",
                        column: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dans le cadre de votre navigation sur notre plateforme, nous pouvons être amenés à collecter vos données personnelles vous concernant :",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "• Votre adresse IP",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• le navigateur utilisé, une partie des paramètres navigateurs (langue, résolution d’écran…)",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• les pages consultées et date de consultation",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• votre adresse email si vous nous contactez",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• prénom",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      CustomPolitiqueContainer(
                        title:
                            "Données collectées sur les clients, partenaires, revendeurs ",
                        column: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dans le cadre de l’usage de nos services, Redoffres est amené à collecter des données personnelles pour leur bon fonctionnement.",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "• Données concernant votre identité : nom, prénom, adresse postale, téléphone, etc., nécessaires à l’identification d’un client et à la facturation des services",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• Adresse email : clients et/ou partenaires et leurs collaborateurs",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                  Text(
                                    "• Informations de paiement : suivi du règlement de vos commandes",
                                    style:
                                        GoogleFonts.poppins(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      CustomPolitiqueContainer(
                        title: "Données sur les moyens de paiement",
                        column: Column(
                          children: [
                            Text(
                              "Les informations relatives aux moyens de paiement sont gérées par des établissements"
                              " financiers partenaires. Les numéros de cartes bancaires pourront être conservés en « archivage intermédiaire »"
                              " en cas d’éventuelle contestation de la transaction pour une durée de 13 mois conformément à la loi en vigueur.",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
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

class CustomPolitiqueContainer extends StatelessWidget {
  final String title;
  final Column column;
  const CustomPolitiqueContainer({
    Key? key,
    required this.title,
    required this.column,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFDD3705),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const Gap(8),
        column,
      ],
    );
  }
}
