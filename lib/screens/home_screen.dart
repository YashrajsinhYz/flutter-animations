import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/download_animation.dart';
import 'package:flutter_animations/screens/list_animation.dart';
import 'package:flutter_animations/screens/onboard_screen.dart';

import 'animated_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  // Map of the button Label & Screen to navigate
  Map<String, dynamic> btnMap = {
    "List": const ListAnimation(),
    "Button": const ButtonAnimation(),
    "On-board screen": const OnboardScreen(),
    "Download Button": const DownloadAnimation(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Animation Home Screen"),
      ),
      body: ListView.builder(
          itemCount: btnMap.length,
          itemBuilder: (context, index) {
            String widgetName = btnMap.keys.elementAt(index);
            Widget widgetClass = btnMap[widgetName]!;

            return ElevatedButton(
              child: Text(widgetName),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => widgetClass));
              },
            );
          }),
    );
  }

  // Custom button widget
  Widget buttonWidget(String btnText, Widget screen) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen));
        },
        child: Text(btnText));
  }
}
