// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceClient extends StatelessWidget {
  const ServiceClient({Key? key}) : super(key: key);

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
                    Gap(MediaQuery.of(context).size.width / 5),
                    Center(
                      child: Text(
                        "Service client",
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(10),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFCCA89D),
                        shape: BoxShape.circle,
                      ),
                      child: const ClipOval(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.headset_mic_outlined,
                            size: 120,
                          ),
                        ),
                      ),
                    ),
                    const Gap(30),
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFFCCA89D).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          final Uri url = Uri.parse('tel://+22893471703');
                          await launchUrl(url);
                        },
                        child: CostumWidgetProfil(
                          title: "Nous contacter par appel",
                          titleIcon: Icons.phone,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                          color: const Color(0xFFCCA89D).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        onPressed: () {
                          _sendSms();
                        },
                        child: CostumWidgetProfil(
                          title: "Nous contacter par sms",
                          titleIcon: Icons.sms_rounded,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                          color: const Color(0xFFCCA89D).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        onPressed: () {
                          _sendWhatsapp();
                        },
                        child: CostumWidgetProfil(
                          title: "Nous contacter par WhatSapp",
                          titleIcon: Icons.whatsapp,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                          color: const Color(0xFFCCA89D).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        onPressed: () {
                          _sendEmail();
                        },
                        child: CostumWidgetProfil(
                          title: "Nous contacter par mail",
                          titleIcon: Icons.mail,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _sendEmail() {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'komlagotlieb@gmail.com',
    queryParameters: {
      'subject': 'CallOut user Profile',
      'body': Uri.encodeComponent('hupe'),
      // 'body': widget.userModel?.username ?? ''
    },
  );
  launchUrl(emailLaunchUri);
}

String _sendWhatsapp() {
  if (Platform.isAndroid) {
    // add the [https]
    return "https://wa.me/+22893471703/?text=Bonjour%20Hupe}"; // new line
    // return "https://wa.me/+22893471703/?text=${Uri.parse(message)}"; // new line
  } else {
    // add the [https]
    return "https://api.whatsapp.com/send?phone=+22893471703=Bonjour%20Hupe}"; // new line
  }
}

void _sendSms() {
  final Uri smsLaunchUri = Uri(
    scheme: 'sms',
    path: '+22893471703',
    queryParameters: <String, String>{
      'body': Uri.encodeComponent('hupe'),
    },
  );
  launchUrl(smsLaunchUri);
}

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
          Text(
            title,
            style: GoogleFonts.poppins(
              color: const Color(0xFFDD3705),
            ),
          ),
          Icon(
            titleIcon,
            color: const Color(0xFFDD3705),
          ),
        ],
      ),
    );
  }
}
