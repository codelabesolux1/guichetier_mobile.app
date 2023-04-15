// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:guichetier/pages/registration/otp.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberRegistration extends StatefulWidget {
  const PhoneNumberRegistration({super.key});

  @override
  State<PhoneNumberRegistration> createState() =>
      _PhoneNumberRegistrationState();
}

class _PhoneNumberRegistrationState extends State<PhoneNumberRegistration> {
  //
  final TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'TG';
  PhoneNumber numberCode = PhoneNumber(isoCode: 'TG');
  // ignore: prefer_typing_uninitialized_variables
  var phoneNumber;
  // bool _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool _isLoading = false;

  // Future<void> _verifyPhoneNumber() async {
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: _phoneNumber,
  //     timeout: const Duration(seconds: 0),
  //     verificationCompleted: (PhoneAuthCredential credential) {
  //       // Auto-retrieve the SMS verification code and complete sign-in.
  //       _auth.signInWithCredential(credential);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       if (e.code == 'invalid-phone-number') {
  //         print('The provided phone number is not valid.');
  //       }
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       // Save the verification ID and resend token to use later
  //       _verificationCode = verificationId;
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       // Called when the auto-retrieval timer expires.
  //       // Remove any UI that was being displayed to the user.
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("AUTHENTIFICATION"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/design.png"),
                  fit: BoxFit.contain,
                ),
              ),
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/login.png',
                    fit: BoxFit.cover,
                    height: 210,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20,
                    ),
                    child: Text(
                      'Veillez entrer votre numero de téléphone, nous vous enverrons un code pour la vélification',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade700),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black.withOpacity(0.13)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffeeeeee),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            setState(() {
                              phoneNumber = number.phoneNumber;
                            });
                            print("Numero = $phoneNumber");
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          initialValue: numberCode,
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle:
                              const TextStyle(color: Colors.black),
                          textFieldController: phoneController,
                          formatInput: false,
                          maxLength: 12,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          cursorColor: Colors.black,
                          inputDecoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(bottom: 15, left: 0),
                            border: InputBorder.none,
                            hintText: 'Téléphone',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500, fontSize: 16),
                          ),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                        Positioned(
                          left: 90,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            height: 40,
                            width: 1,
                            color: Colors.black.withOpacity(0.13),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(80),
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
                            if (_formKey.currentState!.validate()) {
                              // laoding true
                              setState(() {
                                _isLoading = true;
                              });
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                timeout: const Duration(seconds: 60),
                                phoneNumber: phoneNumber,
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed:
                                    (FirebaseAuthException e) async {
                                  // ignore: deprecated_member_use
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(e.message.toString()),
                                    ),
                                  );
                                },
                                codeSent: (String verificationId,
                                    int? resendToken) async {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OTPPage(
                                        phoneNumber: '$phoneNumber',
                                        verificationId: verificationId,
                                      ),
                                    ),
                                  );
                                  // loading false
                                },
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {},
                              );
                            } else {}

                            // if (_formKey.currentState!.validate()) {
                            //   setState(() {
                            //     _isLoading = true;
                            //   });
                            //   await _auth.verifyPhoneNumber(
                            //     timeout: const Duration(seconds: 5),
                            //     phoneNumber: phoneNumber,
                            //     verificationCompleted:
                            //         (PhoneAuthCredential credential) {
                            //       _auth.signInWithCredential(credential);
                            //     },
                            //     verificationFailed:
                            //         (FirebaseAuthException e) async {
                            //       // ignore: deprecated_member_use
                            //       _scaffoldKey.currentState!.showSnackBar(
                            //         SnackBar(
                            //           duration: const Duration(seconds: 5),
                            //           content: Text(e.message.toString()),
                            //         ),
                            //       );
                            //     },
                            //     codeSent: (String verificationId,
                            //         int? resendToken) async {
                            //       setState(() {
                            //         _isLoading = false;
                            //       });
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => OTPPage(
                            //             phoneNumber: '$phoneNumber',
                            //             verificationId: verificationId,
                            //           ),
                            //         ),
                            //       );

                            //       // loading false
                            //     },
                            //     codeAutoRetrievalTimeout:
                            //         (String verificationId) {},
                            //   );
                            // } else {}
                          },
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            semanticsLabel: "Patienté",
                            backgroundColor: Color.fromARGB(255, 199, 198, 198),
                            color: Colors.black,
                            strokeWidth: 3,
                          )
                        : const Text("S'authentifier"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
