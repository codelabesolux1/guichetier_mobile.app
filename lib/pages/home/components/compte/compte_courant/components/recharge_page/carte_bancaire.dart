import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CarteBancaire extends StatefulWidget {
  const CarteBancaire({super.key});

  @override
  State<CarteBancaire> createState() => _CarteBancaireState();
}

class _CarteBancaireState extends State<CarteBancaire> {
  TextEditingController montentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          TextFormField(
            controller: montentController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Montant à recharger (FCFA)",
              contentPadding: const EdgeInsets.only(
                top: 8,
                left: 18,
              ),

              suffixIcon: montentController.text.isEmpty
                  ? Container(
                      width: 0,
                    )
                  : IconTheme(
                      data: const IconThemeData(
                        color: Color(0xFFDD3705),
                      ),
                      child: IconButton(
                        onPressed: () => montentController.clear(),
                        icon: const Icon(Icons.close),
                      ),
                    ),
              hintText: "Montant à recharger (FCFA)",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // suffixIcon: CustomSurffixIcon(svgIcon: ''),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFDD3705),
              ),
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 216, 213, 213),
                fontStyle: FontStyle.italic,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFEBEBEB),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFDD3705),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const Gap(30),
          Container(
            decoration: BoxDecoration(
              color: const Color(0x52EBEBEB),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color(0xFFEBEBEB),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
                left: 8,
                right: 8,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Frais"),
                          Text(" (4%)"),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "0",
                            style: TextStyle(
                              color: Color(0xFFDD3705),
                              fontSize: 18,
                            ),
                          ),
                          Text(" FCFA"),
                        ],
                      ),
                    ],
                  ),
                  const Gap(14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Montant Total"),
                      Text(
                        "0",
                        style: TextStyle(
                          color: Color(0xFFDD3705),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Gap(45),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFDD3705),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "RECHARGER",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(15),
                Text(
                  "0 FCFA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
