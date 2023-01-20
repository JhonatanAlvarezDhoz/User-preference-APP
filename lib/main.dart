import 'package:flutter/material.dart';
import 'package:preference/providers/theme_provider.dart';
import 'package:preference/screens/screens.dart';
import 'package:preference/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

//! se hace async para poder llamar la inicializacion de las preferencias (await Preferences.imit())
void main() async {
  //! regresa la instancia dek widgwts Bining
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkMode))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsScreens.nameRoute: (_) => const SettingsScreens(),
      },
      theme: Provider.of<ThemeProvider>(context).curretTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
