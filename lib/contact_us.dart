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
                    path: '01097936736',
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
                  GestureDetector(
                      onTap: () {
                        _launchSocial(
                            'https://www.facebook.com/profile.php?id=61557081369133&mibextid=ZbWKwL');
                      },
                      child: Image.asset('assets/images/facebook.jpg',
                          height: 40)),
                  GestureDetector(
                    onTap: () {
                      try {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'belliacar000@gmail.com',
                        );
                        launchUrl(emailLaunchUri);
                      } catch (e) {
                        //Handle error
                      }
                    },
                    child: Image.asset(
                      'assets/images/gmail.jpg',
                      height: 40,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        _launchSocial(
                            'https://www.instagram.com/belliacarservice?igsh=MTB3ZGk3bWM1aXkwaA==');
                      },
                      child:
                          Image.asset('assets/images/insta.jpg', height: 40)),
                  GestureDetector(
                      onTap: () {
                        _launchSocial(
                            'https://x.com/BelliaS40801?t=b5upZztBi33rSw8QX76uQA&s=09');
                      },
                      child: Image.asset('assets/images/x.png', height: 40)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchSocial(String url, {String? fallbackUrl}) async {
  try {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  } catch (e) {
    final Uri fallbackUri = Uri.parse(fallbackUrl ?? '');
    await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
  }
}
