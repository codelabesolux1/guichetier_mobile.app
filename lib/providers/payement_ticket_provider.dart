import 'package:flutter/material.dart';

class PayementTicketProvider extends ChangeNotifier {
  int _montantTotal = 0;

  int get montantTotal => _montantTotal;

  set montantTotal(int newMontantTotal) {
    _montantTotal = newMontantTotal;
    notifyListeners();
  }
}
