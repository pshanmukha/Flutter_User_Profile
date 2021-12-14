import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:userprofilescreen/themes.dart';
import 'package:userprofilescreen/utils/user_preference.dart';

AppBar buildAppBar(BuildContext context){
  final user = UserPreferences.getUser();
  final isDarkMode = user.isDarkMode;
  final icon = CupertinoIcons.moon_stars;
  return AppBar(
    leading: BackButton(color: Colors.black,),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) {
          return IconButton(
            icon: Icon(icon,color: Colors.black,),
              onPressed: () {
                final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;

                final switcher = ThemeSwitcher.of(context);
                switcher.changeTheme(theme: theme);

                final newUser = user.copy(isDarkMode: !isDarkMode);
                UserPreferences.setUser(newUser);
              },

          );
        }
      ),
    ],
  );
}