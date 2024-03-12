import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('01097936736'),
            ),
            const ListTile(
              leading: Icon(Icons.location_on),
              title: Text('5 Boulevard, Al Mandara'),
            ),
            const SizedBox(height: 100),
            FilledButton(
                onPressed: () {
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: '19666',
                  );
                  launchUrl(launchUri);
                },
                style: FilledButton.styleFrom(minimumSize: const Size(200, 50)),
                child: const Text('Call Us')),
            const Spacer(),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    endIndent: 20,
                  ),
                ),
                Text('Follow us'),
                Expanded(
                    child: Divider(
                  indent: 20,
                )),
              ],
            ),
            SizedBox(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/facebook.jpg', height: 40),
                  Image.asset(
                    'assets/images/gmail.jpg',
                    height: 30,
                  ),
                  Image.asset('assets/images/instagram.jpg', height: 40),
                  Image.asset('assets/images/twitter.jpg', height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
