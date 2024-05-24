import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const <Widget>[
            ListTile(
              title: Text(
                'How to Order Spare Parts?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'To order spare parts, go to the Spare Parts section in the app. Browse through the available parts, select the ones you need, and proceed to checkout to complete your order.',
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Contact Support',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'If you have any further questions or need assistance, feel free to contact our support team at support@example.com.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
