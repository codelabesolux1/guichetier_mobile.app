// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import 'package:guichetier/controllers/local_storage.dart';
import 'package:guichetier/pages/registration/validation.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({
    Key? key,
    required this.phoneNumber,
    required this.verificationId,
  }) : super(key: key);
  final String phoneNumber;
  final String verificationId;

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  bool _isLoading = false;
  //
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LocalStorage localStorage = LocalStorage();
    var hSize = MediaQuery.of(context).size.height;

    final defaultPinTheme = PinTheme(
      width: 50,
      height: 49,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 62, 158, 94).withOpacity(0.3)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("OTP Vérification"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/design.png"),
            fit: BoxFit.contain,
          ),
        ),
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(50),
                Image.asset(
                  'assets/images/otp.png',
                  fit: BoxFit.cover,
                  width: 260,
                ),
                SizedBox(height: hSize * 0.025),
                Text(
                  "Veuillez saisir le code que nous venons de vous envoyer sur le numéro : ${widget.phoneNumber} ",
                  textAlign: TextAlign.center,
                ),
                const Gap(
                  30,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    controller: pinController,
                    focusNode: focusNode,
                    pinAnimationType: PinAnimationType.fade,
                    animationDuration: const Duration(milliseconds: 200),
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsRetrieverApi,
                    showCursor: true,
                    onCompleted: (pin) => print(pin),
                  ),
                ),
                const Gap(40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 3.5,
                      right: MediaQuery.of(context).size.width / 3.5,
                    ),
                  ),
                  onPressed: _isLoading
                      ? null
                      : () async {
                          setState(() {
                            _isLoading = true;
                          });

                          try {
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: widget.verificationId,
                                    smsCode: pinController.value.text);
                            await FirebaseAuth.instance
                                .signInWithCredential(credential);
                            CollectionReference snapShot =
                                FirebaseFirestore.instance.collection('users');
                            var doc = await snapShot
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .get();
                            if (!doc.exists) {
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .set({
                                "uid": FirebaseAuth.instance.currentUser!.uid
                                    .toString(),
                                "username": '',
                                "telephone": FirebaseAuth
                                    .instance.currentUser!.phoneNumber,
                                "profession": '',
                                "imageUrl":
                                    'https://www.nicepng.com/png/detail/128-1280406_view-user-icon-png-user-circle-icon-png.png',
                                "joinedAt": DateTime.now().toString(),
                                "createdAt": Timestamp.now(),
                              }).then(
                                (value) async {
                                  _isLoading = false;
                                  await localStorage
                                      .saveBoolConnexion()
                                      .then((value) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ValidationPage(),
                                      ),
                                      (r) => false,
                                    );
                                  });
                                },
                              );
                            } else {
                              _isLoading = false;
                              await localStorage
                                  .saveBoolConnexion()
                                  .then((value) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ValidationPage(),
                                  ),
                                  (r) => false,
                                );
                              });
                            }
                          } on FirebaseAuthException catch (e) {
                            setState(() {
                              _isLoading = false;
                              print("Code invalide");
                            });
                            // ignore: deprecated_member_use
                            _scaffoldKey.currentState!.showSnackBar(
                              SnackBar(
                                backgroundColor:
                                    const Color.fromARGB(255, 165, 1, 1),
                                content: Text(e.message.toString()),
                                // content: Text("Code invalide"),
                              ),
                            );
                          }

                          //////
                        },
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          semanticsLabel: "Patienté",
                          backgroundColor: Color.fromARGB(255, 199, 198, 198),
                          color: Colors.black,
                          strokeWidth: 3,
                        )
                      : const Text("Vérifier"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
