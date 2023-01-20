import 'package:flutter/material.dart';
import 'package:preference/providers/theme_provider.dart';
import 'package:preference/share_preferences/preferences.dart';
import 'package:preference/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class SettingsScreens extends StatefulWidget {
  static const String nameRoute = 'settings';
  const SettingsScreens({super.key});

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  // bool isDarkMode = false;
  // int gender = 0;
  // String name = 'Name';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.w400),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                value: Preferences.isDarkMode,
                title: const Text('Dark mode'),
                onChanged: (value) {
                  Preferences.isDarkMode = value;

                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);

                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile(
                value: 1,
                groupValue: Preferences.gender,
                title: const Text('Male'),
                onChanged: (value) {
                  Preferences.gender = value!;
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile(
                value: 2,
                groupValue: Preferences.gender,
                title: const Text('Female'),
                onChanged: (value) {
                  Preferences.gender = value!;
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    helperText: 'User Name',
                    hintText: 'Write your name',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
