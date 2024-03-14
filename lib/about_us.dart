import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    const String mission =
        'Bellia car care center has a clear mission for Providing  exceptional automotive care and customer service.We deliver exceptional services that go beyond customers’ expectations while providing safety on the road.';
    const String vision =
        'Bellia car care center aims to be a premier destination for automotive care. We strive to be recognized as  the go-to car care center that customers trust and rely on.'
        'We aim to be a trusted leader in automotive care, embracing innovation and making a positive difference in our community.';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Mission',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const Text(mission),
            const SizedBox(height: 20),
            const Text(
              'Our Vision',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const Text(vision),
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
                    child:
                        Image.asset('assets/images/facebook.jpg', height: 40),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchSocial(
                          'https://www.instagram.com/belliacarservice?igsh=MTB3ZGk3bWM1aXkwaA==');
                    },
                    child: Image.asset('assets/images/insta.jpg', height: 40),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchSocial(
                          'https://x.com/BelliaS40801?t=b5upZztBi33rSw8QX76uQA&s=09');
                    },
                    child: Image.asset('assets/images/x.png', height: 40),
                  ),
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
