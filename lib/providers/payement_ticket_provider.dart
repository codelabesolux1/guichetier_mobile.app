import 'package:flutter/material.dart';

class PayementTicketProvider extends ChangeNotifier {
  int _montantTotal = 0;
  int _choix = 0;

  int get montantTotal => _montantTotal;
  int get nouveauChoix => _choix;

  set montantTotal(int newMontantTotal) {
    _montantTotal = newMontantTotal;
    notifyListeners();
  }

  set nouveauChoix(int newchoix) {
    _choix = newchoix;
    notifyListeners();
  }
}
