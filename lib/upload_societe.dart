import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UplodSociete extends StatelessWidget {
  const UplodSociete({super.key});

  uploadSociete(String logoUrl, String raisonSocial) async {
    // ignore: avoid_print
    print(" \n Lancement \n");
    await FirebaseFirestore.instance.collection("societe").add({
      "raison_sociale": raisonSocial,
      "uid": "",
      "logo-url": logoUrl,
      "joinedAt": DateTime.now().toString(),
      "createdAt": Timestamp.now(),
    }).then((value) {
      // ignore: avoid_print
      print("valider");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // uploadSociete(
        //   "https://ween.tn/uploads/image/24869/24867/avatar/avatar.jpg",
        //   "ASK'EVENT",
        // );
        uploadSociete(
          "https://hoodspot.fr/uploads/797/807/79780748400028/logo.jpg",
          "MARK'EVENT",
        );
        uploadSociete(
          "https://www.nocturnologie.com/medias/images/noc-event-logo.jpg?fx=c_1200_675",
          "NOC EVENT",
        );
        uploadSociete(
          "https://scontent.flfw2-1.fna.fbcdn.net/v/t1.6435-9/84595674_108775770692897_4708311237715296256_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=z9yPeM9-kggAX_QiAA7&_nc_ht=scontent.flfw2-1.fna&oh=00_AfBvGT5OiCEyJe4TgT5qGVl9G1lC6B9jNjq5NTegZJIfzA&oe=64608821",
          "Société KBK évents audiovisuel",
        );
      },
      child: const Text("Upload"),
    );
  }
}
