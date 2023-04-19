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

  uploadTicket(String logoUrl, String raisonSocial) async {
    // ignore: avoid_print
    print(" \n Lancement \n");
    await FirebaseFirestore.instance.collection("users").doc("").collection("tickets").add({
      "uidEvent": raisonSocial,
      "uidTicket": "",
      "quantite": logoUrl,
      "date": Timestamp.now(),
    }).then((value) {
      // ignore: avoid_print
      print("valider");
    });
  }

  uploadEvent(
    String enventUID,
    String title,
    String description,
    String lieu,
    String latitude,
    String longitude,
    String date,
    String heure,
    String afficheUrl,
    String category,
    String societeUID,
    Map<String, dynamic> price,
  ) async {
    await FirebaseFirestore.instance
        .collection("societe")
        .doc(societeUID)
        .collection("events")
        .add({
      "enventUID": enventUID,
      "title": title,
      "description": description,
      "lieu": lieu,
      "latitude": latitude,
      "longitude": longitude,
      "date": date,
      "heure": heure,
      "afficheUrl": afficheUrl,
      "category": category,
      "societeUID": societeUID,
      "price": price,
    });
  }
// [
//             {"name": "Laptop", "price": 899.99},
//             {"name": "Tablet", "price": 1099.99},
//           ],

//           List<Object> price,
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        uploadEvent(
          "",
          "L'étrnger Galilé",
          "Un concert de haut niveau parraîné par le saint esprit",
          "Palais de congrais",
          "12.2",
          "14.4",
          "00/00/23",
          "19h00",
          "https://firebasestorage.googleapis.com/v0/b/guichetier-224b2.appspot.com/o/events%2Faff-1.png?alt=media&token=5eee6b7e-d25c-4ce0-86d2-1a699b7b29e3",
          "Concert",
          "VmfEPErR0EVH4lnufI7E",
          {
            "price1": 1000,
            "price2": 3000,
            "price3": 5000,
          },
        );
        uploadEvent(
          "",
          "Tournoi de l'amitier",
          "Un tournoi organiser pour une organisation dans le but de s'entraidé et de mieux se connâitre",
          "Stade Omnisport",
          "12.2",
          "14.4",
          "30/07/23",
          "15h00",
          "https://firebasestorage.googleapis.com/v0/b/guichetier-224b2.appspot.com/o/events%2Faff-2.jpg?alt=media&token=5c2f7dc9-b229-4cab-86ca-a34a5b348ecb",
          "Sport",
          "VmfEPErR0EVH4lnufI7E",
          {
            "price1": 1000,
            "price2": 3000,
            "price3": 0,
          },
        );
        uploadEvent(
          "",
          "L'ombre de la nuit",
          "Projection d'un filme",
          "EDA OBA",
          "12.2",
          "14.4",
          "25/06/23",
          "20h30",
          "https://firebasestorage.googleapis.com/v0/b/guichetier-224b2.appspot.com/o/events%2Faff-3.png?alt=media&token=a6751b6a-5cca-4c4c-bd4d-6af8c0c6aab7",
          "Cinema",
          "aCE5JtofMq4THmOpau4t",
          {
            "price1": 5000,
            "price2": 0,
            "price3": 0,
          },
        );
        uploadEvent(
          "",
          "Miss première Edition",
          "Miss de sélection de la beauté togolaise",
          "SARAKAWA",
          "12.2",
          "14.4",
          "26/11/23",
          "21h30",
          "https://firebasestorage.googleapis.com/v0/b/guichetier-224b2.appspot.com/o/events%2Faff-3.png?alt=media&token=a6751b6a-5cca-4c4c-bd4d-6af8c0c6aab7",
          "Miss",
          "hINqIgPJmvKpTohHYzjX",
          {
            "price1": 2000,
            "price2": 5000,
            "price3": 15000,
          },
        );

        // uploadSociete(
        //   "https://ween.tn/uploads/image/24869/24867/avatar/avatar.jpg",
        //   "ASK'EVENT",
        // );
        // uploadSociete(
        //   "https://hoodspot.fr/uploads/797/807/79780748400028/logo.jpg",
        //   "MARK'EVENT",
        // );
        // uploadSociete(
        //   "https://www.nocturnologie.com/medias/images/noc-event-logo.jpg?fx=c_1200_675",
        //   "NOC EVENT",
        // );
        // uploadSociete(
        //   "https://scontent.flfw2-1.fna.fbcdn.net/v/t1.6435-9/84595674_108775770692897_4708311237715296256_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=z9yPeM9-kggAX_QiAA7&_nc_ht=scontent.flfw2-1.fna&oh=00_AfBvGT5OiCEyJe4TgT5qGVl9G1lC6B9jNjq5NTegZJIfzA&oe=64608821",
        //   "Société KBK évents audiovisuel",
        // );
      },
      child: const Text("Upload"),
    );
  }
}
