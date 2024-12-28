import 'package:flutter/material.dart';

import '../on_boarding_page/on_boarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<String> images = [
    'assets/paypal_ui/images/splashpageblue.png',
    'assets/paypal_ui/images/splashpage_lightblue.png',
    'assets/paypal_ui/images/splashpage_darkblue.png',
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7), () {
      // Navigator.pushNamed(context, '/login_page');
      Navigator.of(context).pushReplacement(
        // ignore: inference_failure_on_instance_creation
        MaterialPageRoute(
          builder: (context) => const OnBoardingPage(),
        ),
      );
      // MaterialPageRoute(builder: (context) => const OnBoardingPage()),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Adjust sizes based on screen width and height
            double imageSize = constraints.maxWidth < 600 ? 50 : 100;
            double textSize = constraints.maxWidth < 600 ? 54 : 72;
            double subTextSize = constraints.maxWidth < 600 ? 20 : 28;
            double spacing = constraints.maxHeight < 800 ? 10 : 20;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Row for images
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < images.length; i++)
                      Align(
                        widthFactor: 0.5,
                        child: CircleAvatar(
                          radius: imageSize,
                          backgroundImage: AssetImage(
                            images[i],
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: spacing),
                // Row for 'Transfer Me' text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Transfer Me',
                      style: TextStyle(
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'semibold',
                        color: const Color(0xFF5063BF),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                // Row for 'Your best money transfer partner' text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Your best money transfer partner',
                      style: TextStyle(
                        fontSize: subTextSize,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'regular',
                        color: const Color(0xFF5063BF),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
