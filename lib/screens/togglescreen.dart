import 'package:flutter/material.dart';
import 'package:grundfos/home_page.dart';
import 'package:grundfos/screens/welcome.dart';

class Togglescreen extends StatefulWidget {
  const Togglescreen({super.key});

  @override
  State<Togglescreen> createState() {
    return _TogglescreenState();
  }
}

class _TogglescreenState extends State<Togglescreen> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start_screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'welcome_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget;

    if (activeScreen == 'welcome_screen') {
      screenWidget = const WelcomeScreen();
    } else {
      screenWidget = HomePage(switchScreen);
    }

    return MaterialApp(
      title: 'Chiller Stats',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://i.ibb.co/kJX5C6b/duotone.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
