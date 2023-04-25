import 'package:flutter/material.dart';
import 'package:guichetier/providers/payement_ticket_provider.dart';
import 'package:provider/provider.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provideChoix = Provider.of<PayementTicketProvider>(context);
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: SizedBox(
        height: 230.0,
        width: 320.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Sélectionnez le destinataire',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      provideChoix.nouveauChoix = 1;
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 6,
                        right: MediaQuery.of(context).size.width / 6,
                      ),
                      primary: Colors.green,
                      onPrimary: Colors.white,
                    ),
                    child: const Text('Pour moi-même'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provideChoix.nouveauChoix = 2;
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 12,
                        right: MediaQuery.of(context).size.width / 12,
                      ),
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                    ),
                    child: const Text('Pour une autre personne'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fermer'),
            ),
          ],
        ),
      ),
    );
  }
}
