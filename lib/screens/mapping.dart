import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Mapping extends StatelessWidget {
  const Mapping({super.key});

  static final Uri _googleMapsUri = Uri.parse(
    'https://www.google.com/maps/place/2%C2%B059\'58.6%22N+101%C2%B042\'37.3%22E/@2.9995099,101.7102949,16.25z/data=!4m4!3m3!8m2!3d2.999613!4d101.7103529?entry=ttu&g_ep=EgoyMDI2MDYyOC4wIKXMDSoASAFQAw%3D%3D',
  );

  Future<void> _openMap(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final canLaunch = await canLaunchUrl(_googleMapsUri);
    if (canLaunch) {
      await launchUrl(_googleMapsUri, mode: LaunchMode.externalApplication);
      return;
    }

    messenger.showSnackBar(
      const SnackBar(content: Text('Unable to open Google Maps.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 248, 236),
      appBar: AppBar(
        title: const Text('FSKTM Campus Guide'),
        backgroundColor: const Color.fromARGB(255, 66, 192, 70),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'Assets/FSKTM-Campus-Guide_North.jpg.jpeg',
                  fit: BoxFit.cover,
                  height: 360,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(20, 0, 0, 0),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Text(
                  'Navigate to FSKTM Campus using Google Maps. Tap the button below to open the map with a pinned campus location.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => _openMap(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 66, 192, 70),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: const Icon(Icons.map, size: 24),
                label: const Text(
                  'Open Google Map',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'FSKTM Campus Guide North shows the full campus layout and is the only image used on this page.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
