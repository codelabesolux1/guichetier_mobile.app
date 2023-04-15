// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';

class RechargeMoney extends ChangeNotifier {
  int _montant = 0;
  int _montanttotal = 0;
  int frais = 4;
  int _fraistotal = 0;

  int get montant => _montant;
  double get fraistotal => ((_montant * frais) / 100);
  double get montanttotal => (_montant + fraistotal);

  set montant(int newmontant) {
    _montant = newmontant;
    notifyListeners();
  }
}
