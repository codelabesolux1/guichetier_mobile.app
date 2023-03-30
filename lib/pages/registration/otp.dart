// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:guichetier/pages/registration/validation.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  //
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                const Text(
                  "Veuillez saisir le code que nous venons de vous envoyer sur le numéro",
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
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ValidationPage(),
                      ),
                      (r) => false,
                    );
                  },
                  child: const Text("Vérifier"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
