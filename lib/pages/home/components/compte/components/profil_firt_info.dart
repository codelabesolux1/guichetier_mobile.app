import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilFirtInfo extends StatelessWidget {
  const ProfilFirtInfo({
    Key? key,
    // required this.users,
    // required this.uid,
  }) : super(key: key);

  // final CollectionReference<Object?> users;
  // final String uid;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(3.0, 3.0),
          ),
        ],
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: 70,
                  height: 70,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(4),
            Text(
              "Gotflo",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "Developpeur",
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),

        // StreamBuilder(
        //     stream: users.doc(uid).snapshots(),
        //     builder: (BuildContext context, AsyncSnapshot snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Row(
        //           children: const [
        //             SizedBox(
        //               width: 70,
        //               height: 70,
        //             ),
        //           ],
        //         );
        //       }
        //       return Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           Container(
        //             width: 70,
        //             height: 70,
        //             decoration: const BoxDecoration(
        //               shape: BoxShape.circle,
        //             ),
        //             child: ClipOval(
        //               child: CachedNetworkImage(
        //                 imageUrl: snapshot.data.data()["imageUrl"],
        //                 fit: BoxFit.cover,
        //                 placeholder: (context, url) => const Center(
        //                   child: CircularProgressIndicator(),
        //                 ),
        //                 errorWidget: (context, url, error) =>
        //                     const Icon(Icons.error),
        //                 width: 70,
        //                 height: 70,
        //                 // fit: BoxFit.cover,
        //               ),
        //             ),
        //           ),
        //           const Gap(4),
        //           Text(
        //             snapshot.data.data()["username"]!.isEmpty
        //                 ? snapshot.data.data()["telephone"]
        //                 : snapshot.data.data()["username"],
        //             style: GoogleFonts.poppins(
        //               fontSize: 18,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 3,
        //           ),
        //           Text(
        //             snapshot.data.data()["profession"]!.isEmpty
        //                 ? 'Complétez votre profession'
        //                 : snapshot.data.data()["profession"],
        //             style: GoogleFonts.poppins(
        //               fontSize: 11,
        //               fontWeight: FontWeight.w300,
        //             ),
        //           ),
        //         ],
        //       );
        //     }),
      ),
    );
  }
}
