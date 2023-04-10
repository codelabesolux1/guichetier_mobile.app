import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:guichetier/pages/home/components/compte/a_propos/a_propos.dart';
import 'package:guichetier/pages/home/components/compte/comment_marche/comment_marche.dart';
import 'package:guichetier/pages/home/components/compte/components/profil_firt_info.dart';
import 'package:guichetier/pages/home/components/compte/components/version_apk.dart';
import 'package:guichetier/pages/home/components/compte/compte_courant/compte_courant.dart';
import 'package:guichetier/pages/home/components/compte/politique_confidentialite/politique_confidentialite.dart';
import 'package:guichetier/pages/home/components/compte/politique_securite/politique_securite.dart';
import 'package:guichetier/pages/home/components/compte/service_client.dart/service_client.dart';
import 'package:guichetier/pages/home/components/compte/terme_utilisation/terme_utilisation.dart';

class CompteMenu extends StatelessWidget {
  const CompteMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compte"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 225, 222),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                  ),

                  //// PROFIL Tof

                  Positioned(
                    top: MediaQuery.of(context).size.height / 30,
                    left: 15,
                    right: 15,
                    child: const ProfilFirtInfo(),
                    // child: ProfilFirtInfo(users: users, uid: uid),
                  ),
                ],
              ),
            ),

            //COMPTE INFORMATION

            const CompteCourant(),
            const Gap(10),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //INFORMATION Personnel
                      const Gap(15),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDACAC5).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const ClientEditProfileBody(),
                            //   ),
                            // );
                          },
                          child: CostumWidgetProfil(
                            title: "Mes informations",
                            titleIcon: Icons.person,
                          ),
                        ),
                      ),

                      //PARAMETRE  //
                      const Gap(8),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDACAC5).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CommentSaMarche(),
                              ),
                            );
                          },
                          child: CostumWidgetProfil(
                            title: "Comment ça marche",
                            titleIcon: Icons.help_outline,
                          ),
                        ),
                      ),

                      const Gap(8),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDACAC5).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ServiceClient(),
                              ),
                            );
                          },
                          child: CostumWidgetProfil(
                            title: "Service client",
                            titleIcon: Icons.headset_mic_outlined,
                          ),
                        ),
                      ),

                      const Gap(8),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDACAC5).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const APropos(),
                              ),
                            );
                          },
                          child: CostumWidgetProfil(
                            title: "A Propos",
                            titleIcon: Icons.info_outline_rounded,
                          ),
                        ),
                      ),

                      const Gap(8),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDACAC5).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PolitiqueConfidentialite(),
                              ),
                            );
                          },
                          child: CostumWidgetProfil(
                            title: "Politique de confidentialité",
                            titleIcon: Icons.privacy_tip_outlined,
                          ),
                        ),
                      ),
                      const Gap(8),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDACAC5).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PolitiqueSecurite(),
                              ),
                            );
                          },
                          child: CostumWidgetProfil(
                              title: "Politique de Sécurité",
                              titleIcon: Icons.security),
                        ),
                      ),
                      const Gap(8),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDACAC5).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TermeCondition(),
                              ),
                            );
                          },
                          child: CostumWidgetProfil(
                            title: "Conditions d’utilisation",
                            titleIcon: Icons.device_unknown_sharp,
                          ),
                        ),
                      ),
                      const Gap(8),

                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDACAC5).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const VersionApplication(),
                              ),
                            );
                          },
                          child: CostumWidgetProfil(
                              title: "Version de l'application",
                              titleIcon: Icons.get_app_outlined),
                        ),
                      ),

                      const Gap(8),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDACAC5).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          onPressed: () {},
                          child: CostumWidgetProfil(
                            title: "Invité des amis",
                            titleIcon: Icons.share_sharp,
                          ),
                        ),
                      ),
                      const Gap(12),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CostumWidgetProfil extends StatelessWidget {
  String title;
  IconData titleIcon;
  CostumWidgetProfil({
    Key? key,
    required this.title,
    required this.titleIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                titleIcon,
                color: const Color(0xFFBB2C00),
              ),
              const Gap(3),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFFBB2C00),
                ),
              ),
            ],
          ),
          const Icon(
            Icons.navigate_next_rounded,
          ),
        ],
      ),
    );
  }
}
