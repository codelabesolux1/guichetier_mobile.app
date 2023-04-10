// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:guichetier/providers/recharche_money.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class MobileMoney extends StatefulWidget {
  const MobileMoney({super.key});

  @override
  State<MobileMoney> createState() => _MobileMoneyState();
}

class _MobileMoneyState extends State<MobileMoney> {
  TextEditingController moyenPayentController = TextEditingController();
  TextEditingController montentController = TextEditingController();
  String initialCountry = 'TG';
  PhoneNumber numberCode = PhoneNumber(isoCode: 'TG');
  var phoneNumber;
  // bool _isLoading = false;
  final TextEditingController phoneController = TextEditingController();

  final List<String> _suggestions = [
    "Tmoney",
    "Flooz",
  ];

  @override
  Widget build(BuildContext context) {
    final recharcgeMoney = Provider.of<RechargeMoney>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          DropdownSearch<String>(
            items: _suggestions,
            dropdownSearchDecoration: const InputDecoration(
              contentPadding: EdgeInsets.all(12),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFEBEBEB),
                  width: 1.0,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFEBEBEB),
                  width: 1.0,
                ),
              ),
              labelText: "Sélectionner le service",
              hintText: "Service",
            ),
            // popupItemDisabled: isItemDisabled,
            popupProps: PopupPropsMultiSelection.menu(
              searchFieldProps: const TextFieldProps(
                cursorColor: Color.fromARGB(255, 7, 77, 1),
              ),
              showSearchBox: false,
              showSelectedItems: true,
              disabledItemFn: isItemDisabled,
            ),
            onChanged: itemSelectionChanged,
          ),
          const Gap(24),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0x52EBEBEB),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xFFEBEBEB)),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(31, 238, 238, 238),
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
                  selectorTextStyle: const TextStyle(color: Colors.black),
                  textFieldController: phoneController,
                  formatInput: false,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  cursorColor: Colors.black,
                  inputDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 15, left: 0),
                    border: InputBorder.none,
                    hintText: 'Téléphone',
                    hintStyle:
                        TextStyle(color: Colors.grey.shade500, fontSize: 16),
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
          const Gap(24),
          TextFormField(
            controller: montentController,
            onChanged: (value) {
              // setState(() {
              // });
              recharcgeMoney.montant = int.parse(montentController.text);
            },
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
                        children: [
                          const Text("Frais"),
                          Text(" ${recharcgeMoney.frais}%"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "${recharcgeMoney.montant == 0 ? 0 : recharcgeMoney.fraistotal}",
                            style: const TextStyle(
                              color: Color(0xFF006B29),
                              fontSize: 18,
                            ),
                          ),
                          const Text(" FCFA"),
                        ],
                      ),
                    ],
                  ),
                  const Gap(14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Montant Total"),
                      Text(
                        "${recharcgeMoney.montanttotal}",
                        style: const TextStyle(
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
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
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
                children: [
                  const Text(
                    "RECHARGER",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Gap(15),
                  Text(
                    "${recharcgeMoney.montanttotal} FCFA",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isItemDisabled(String s) {
    //return s.startsWith('I');

    if (s.startsWith('I')) {
      return true;
    } else {
      return false;
    }
  }

  void itemSelectionChanged(String? s) {
    setState(() {
      moyenPayentController.text = s!;
    });
    // print(serviceController.value.text);
  }
}
