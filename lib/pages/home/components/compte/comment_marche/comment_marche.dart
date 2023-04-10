import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentSaMarche extends StatelessWidget {
  const CommentSaMarche({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: Color(0xFFDD3705)),
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
                    Gap(MediaQuery.of(context).size.width / 9),
                    Center(
                      child: Text(
                        "Comment ça marche",
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Voici comment ça marche pour les clients de notre plateforme de location de véhicules et de réservation de billets de bus :",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const Gap(10),
                      const CustomExpansionContainer(
                          title: "1. Recherche ",
                          childrenText:
                              "Tout d'abord, vous pouvez rechercher les options de location de véhicules ou de billets de bus disponibles en sélectionnant votre destination, les dates de voyage et le nombre de passagers."),
                      const Gap(4),
                      const CustomExpansionContainer(
                          title: "2. Comparaison ",
                          childrenText:
                              "Vous pouvez ensuite comparer les prix, les caractéristiques et les options de chaque véhicule ou itinéraire de bus disponible pour choisir celui qui convient le mieux à vos besoins"),
                      const Gap(4),
                      const CustomExpansionContainer(
                          title: "3. Réservation ",
                          childrenText:
                              "Une fois que vous avez sélectionné votre véhicule ou votre itinéraire de bus, vous pouvez réserver en ligne en fournissant vos informations de paiement et de contact"),
                      const Gap(4),
                      const CustomExpansionContainer(
                          title: "4. Paiement ",
                          childrenText:
                              "Nous acceptons les paiements par carte de crédit et de débit, y compris Visa, Mastercard et Mobile money"),
                      const Gap(4),
                      const CustomExpansionContainer(
                          title: "5. Confirmation ",
                          childrenText:
                              "Après avoir effectué votre réservation et votre paiement, vous recevrez une confirmation de réservation par e-mail avec tous les détails de votre location de véhicule ou de votre itinéraire de bus."),
                      const Gap(4),
                      const CustomExpansionContainer(
                          title: "6. Récupération ",
                          childrenText:
                              "Pour récupérer votre véhicule de location, vous devrez vous rendre à l'emplacement de location indiqué dans votre confirmation de réservation et fournir une pièce d'identité en cours de validité, un permis de conduire valide et une carte de crédit pour les frais de location. Pour prendre votre bus, vous devez vous rendre à l'arrêt de bus indiqué dans votre confirmation de réservation à l'heure prévue."),
                      const Gap(4),
                      const CustomExpansionContainer(
                          title: "7. Voyage ",
                          childrenText:
                              "Une fois que vous avez récupéré votre véhicule de location ou pris votre bus, vous pouvez profiter de votre voyage en toute tranquillité."),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Nous nous engageons à fournir une expérience de voyage pratique et sans tracas pour nos clients. Si vous avez des questions ou des préoccupations, n'hésitez pas à contacter notre équipe de support client.",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
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
          color: Color(0xFFBB2C00),
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
