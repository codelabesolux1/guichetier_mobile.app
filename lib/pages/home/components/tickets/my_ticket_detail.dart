import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class MyTicketDetail extends StatelessWidget {
  const MyTicketDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFDD3705),
              Color(0xFFDD3705),
              Color(0xFF661901),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          child: Stack(
            children: [
              ClipPath(
                clipper: TicketClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(300),
                                  border: Border.all(
                                    color: Colors.black54,
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.arrow_back),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(300),
                                  border: Border.all(
                                    color: Colors.black54,
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.file_download_outlined),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Text(
                                  "Scanner ce code QR",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(14),
                                const Icon(
                                  Icons.qr_code_2_sharp,
                                  size: 300,
                                  color: Color(0xDD161616),
                                ),
                                Gap(MediaQuery.of(context).size.height / 6),
                                const Text(
                                  "Loren Ispun ispun loren to go title",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(15),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0x1CDD3705),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0x5ACACACA),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(
                                                  FontAwesomeIcons.calendar,
                                                  color: Color(0xFF585858),
                                                ),
                                                Gap(8),
                                                Text("30 avr 2023"),
                                              ],
                                            ),
                                            Row(
                                              children: const [
                                                Icon(
                                                  FontAwesomeIcons.clock,
                                                  color: Color(0xFF585858),
                                                ),
                                                Gap(8),
                                                Text("15h30"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Gap(30),
                                        Row(
                                          children: const [
                                            Icon(
                                              FontAwesomeIcons.locationDot,
                                              color: Color(0xFF585858),
                                            ),
                                            Gap(8),
                                            Text(
                                                "Lieu où se fera l'evenenment"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.61,
                left: 0,
                right: 0,
                // bottom: 0,
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
      Rect.fromCircle(center: Offset(0.0, size.height / 1.5), radius: 15.0),
    );
    path.addOval(
      Rect.fromCircle(
          center: Offset(size.width, size.height / 1.5), radius: 15.0),
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
