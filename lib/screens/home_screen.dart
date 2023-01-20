import 'package:flutter/material.dart';
import 'package:preference/share_preferences/preferences.dart';
import 'package:preference/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isDarkMode: ${Preferences.isDarkMode}'),
            const Divider(),
            if (Preferences.gender == 1) const Text('Gender: Male'),
            if (Preferences.gender == 2) const Text('Gender: Female'),
            const Divider(),
            Text('User Name: ${Preferences.name}'),
            const Divider(),
          ],
        ));
  }
}
