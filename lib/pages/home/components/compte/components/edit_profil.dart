// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guichetier/controllers/model_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientEditProfileBody extends StatefulWidget {
  const ClientEditProfileBody({
    Key? key,
  }) : super(key: key);
  @override
  State<ClientEditProfileBody> createState() => _ClientEditProfileBodyState();
}

class _ClientEditProfileBodyState extends State<ClientEditProfileBody> {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final _usernameController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _professionController = TextEditingController();

  String? username, telephone, profession;
  // ignore: prefer_typing_uninitialized_variables
  var id;
  String initialCountry = 'TG';
  PhoneNumber numberCode = PhoneNumber(isoCode: 'TG');
  // ignore: prefer_typing_uninitialized_variables
  var phoneNumber;

  // String phoneNumber = auth.currentUser!.phoneNumber.toString();

  @override
  void initState() {
    getUserAuthData();
    super.initState();
  }

  UserDatabaseService userDatabaseService = UserDatabaseService();
  Future getUserAuthData() async {
    _spinne = false;
    dynamic userAuthData = await userDatabaseService.getCurrentUserData();
    _usernameController.text = userAuthData[0];
    _telephoneController.text = userAuthData[1];
    _professionController.text = userAuthData[2];
    setState(() {
      btnStatus == false;
      _tofspinne = false;
      downloadURL = userAuthData[3];
    });
  }

  String? telephone1 = FirebaseAuth.instance.currentUser!.phoneNumber;
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();

  bool btnStatus = false;
  bool _tofselectspinne = false;
  bool _spinne = true;
  bool _tofspinne = true;

  // File? image;
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadURL;

  Future getImage() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pick != null) {
        _image = File(pick.path);
        _tofselectspinne = false;
        btnStatus = true;
      } else {
        btnStatus = false;
        // showSnackBar("Pas d'image séletionner", Duration(milliseconds: 400));
      }
    });
  }

  Future _saveImageUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("downloadURL", downloadURL!);
  }

  Future uploadImage() async {
    final postID = DateTime.now().microsecondsSinceEpoch.toString();
    FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;
    final CollectionReference users = firebasefirestore.collection("users");
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("usersImages/$uid")
        .child("post_$postID");
    //
    await ref.putFile(_image!);
    downloadURL = await ref.getDownloadURL();
    await users.doc(uid).update({'imageUrl': downloadURL});
    _saveImageUrl();
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return _spinne
        ? const Spinner()
        : Scaffold(
            appBar: AppBar(
              elevation: 1,
              foregroundColor: Colors.white,
              centerTitle: true,
              title: const Text(
                "Profil",
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                btnStatus = false;
                await getUserAuthData();
              },
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: _tofselectspinne
                        ? const SizedBox(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(
                              semanticsLabel: "Patienté",
                              backgroundColor:
                                  Color.fromARGB(255, 199, 198, 198),
                              color: Colors.black,
                              strokeWidth: 3,
                            ),
                          )
                        : userData(),
                  ),
                ),
              ),
            ),
          );
  }

  ListView userData() {
    return ListView(
      children: [
        const SizedBox(
          height: 15,
        ),
        Center(
          child: _tofspinne
              ? const SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    semanticsLabel: "Patienté",
                    backgroundColor: Color.fromARGB(255, 199, 198, 198),
                    color: Colors.black,
                    strokeWidth: 3,
                  ),
                )
              : Stack(
                  children: [
                    _image != null
                        ? ClipOval(
                            child: Image.file(
                              _image!,
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.network(
                                downloadURL!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                    //////////////////////////////////////////

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: const Color.fromARGB(255, 206, 207, 206),
                        ),
                        child: InkWell(
                          onTap: () {
                            _tofselectspinne = true;
                            getImage();
                            // getImage(ImageSource.gallery);
                          },
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Color.fromARGB(255, 19, 18, 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        const SizedBox(
          height: 35,
        ),
        customTextField(_usernameController, "Nom d'utilisateur"),
        costumSizeddBox(),
        customTextField(_telephoneController, "Téléphone*"),
        costumSizeddBox(),
        customTextField(_professionController, "Profession"),

        ///

        const SizedBox(
          height: 25,
        ),
        RaisedButton(
          onPressed: btnStatus == false
              ? null
              : () async {
                  setState(() {
                    btnStatus = false;
                  });
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(uid)
                      .update({
                    // "uid": uid,
                    "username": _usernameController.value.text,
                    "telephone": _telephoneController.value.text,
                    "profession": _professionController.value.text,
                    // "imageUrl": downloadURL,
                  }).whenComplete(
                    () => showSnackBar(
                      'Modification éffectuer',
                      const Duration(seconds: 3),
                    ),
                  );
                  if (_image != null) {
                    uploadImage();
                  } else {}
                },
          color: const Color(0xFFDD3705),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "ENREGISTRER",
            style:
                TextStyle(fontSize: 14, letterSpacing: 2, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  SizedBox costumSizeddBox() {
    return const SizedBox(
      height: 15,
    );
  }

  TextField customTextField(
      TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        setState(() {
          btnStatus = true;
        });
      },
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
        color: Colors.black.withOpacity(0.9),
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        floatingLabelStyle: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
          color: const Color(0xFFDD3705),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFDD3705), width: 2),
        ),
        contentPadding: const EdgeInsets.only(bottom: 3, left: 18),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: '',
        hintStyle: GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}

class Spinner extends StatelessWidget {
  const Spinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(""),
          Column(
            children: const [
              SizedBox(
                width: 55,
                height: 55,
                child: CircularProgressIndicator(
                  semanticsLabel: "Patienté",
                  backgroundColor: Color.fromARGB(255, 199, 198, 198),
                  color: Colors.black,
                  strokeWidth: 3,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Chargement ..."),
            ],
          ),
          const Text(""),
        ],
      ),
    );
  }
}
