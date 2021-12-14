import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:userprofilescreen/page/profile_page.dart';
import 'package:userprofilescreen/themes.dart';
import 'package:userprofilescreen/utils/user_preference.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final String title = 'User Profile';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return ThemeProvider(
      initTheme: user.isDarkMode ?  MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          title: title,
          home:  ProfilePage(),
        ),
      ),
    );
  }
}

