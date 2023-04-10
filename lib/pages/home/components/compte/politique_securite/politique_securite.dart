import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PolitiqueSecurite extends StatelessWidget {
  const PolitiqueSecurite({Key? key}) : super(key: key);

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
                        "Politique de Sécurité",
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
                        title: "Sécurité des données",
                        column: Column(
                          children: [
                            Text(
                              "Nous protégeons les données des utilisateurs contre tout accès, modification ou divulgation non autorisés. "
                              "Nous utilisons des protocoles de cryptage avancés pour stocker les informations de compte et de "
                              "paiement des utilisateurs et nous surveillons en permanence notre infrastructure pour détecter toute activité suspecte.",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      CustomPolitiqueContainer(
                        title: "Sécurité des données",
                        column: Column(
                          children: [
                            Text(
                              "Nous utilisons des méthodes d'authentification à plusieurs facteurs pour empêcher l'accès non autorisé aux comptes des utilisateurs. "
                              "Les utilisateurs doivent fournir une combinaison de codes d'authentification pour accéder à leur compte.",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      CustomPolitiqueContainer(
                        title: "Paiement en ligne sécurisé",
                        column: Column(
                          children: [
                            Text(
                              "Nous utilisons des protocoles de sécurité de paiement en ligne reconnus pour protéger les informations de paiement des utilisateurs, "
                              "tels que le cryptage SSL et la vérification 3D Secure. "
                              "Les informations de paiement sont stockées de manière sécurisée et ne sont accessibles que par les personnes autorisées.",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      CustomPolitiqueContainer(
                        title:
                            "Protection contre les virus et les logiciels malveillants",
                        column: Column(
                          children: [
                            Text(
                              "Nous utilisons des logiciels antivirus et des pares-feux pour protéger notre infrastructure contre les virus et les logiciels malveillants. "
                              "Nous mettons à jour régulièrement nos systèmes pour garantir une protection maximale.",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      CustomPolitiqueContainer(
                        title: "Sensibilisation à la sécurité",
                        column: Column(
                          children: [
                            Text(
                              "Nous formons régulièrement nos employés et nos fournisseurs de services tiers à la sécurité et à la protection des données. "
                              "Nous informons également les utilisateurs des risques de sécurité potentiels et des meilleures pratiques en matière de sécurité.",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      CustomPolitiqueContainer(
                        title: "Gestion de crise",
                        column: Column(
                          children: [
                            Text(
                              "Nous avons mis en place un plan de gestion de crise pour répondre rapidement et efficacement aux incidents de sécurité potentiels ou avérés. "
                              "Nous travaillons en étroite collaboration avec les autorités compétentes pour signaler les incidents et minimiser les perturbations pour les utilisateurs.",
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      CustomPolitiqueContainer(
                        title: "Respect des normes de l'industrie",
                        column: Column(
                          children: [
                            Text(
                              "Nous respectons les normes de sécurité de l'industrie, telles que la norme PCI-DSS pour les paiements en ligne et les réglementations en matière de protection des données.",
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
