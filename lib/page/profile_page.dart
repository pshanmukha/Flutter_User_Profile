import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:userprofilescreen/model/user.dart';
import 'package:userprofilescreen/page/edit_profile_page.dart';
import 'package:userprofilescreen/utils/user_preference.dart';
import 'package:userprofilescreen/widget/appbar_widget.dart';
import 'package:userprofilescreen/widget/button_widget.dart';
import 'package:userprofilescreen/widget/numbers_widget.dart';
import 'package:userprofilescreen/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
              imagePath: user.imagePath,
                  onClicked: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage(),)
                );
                setState(() {

                });
                  },
            ),
                const SizedBox(height: 24,),
                buildName(user),
                const SizedBox(height: 24,),
                Center(child: buildUpgradeButton()),
                const SizedBox(height: 24,),
                NumbersWidget(),
                const SizedBox(height: 48,),
                buildAbout(user),
              ],
            ),
          );
        }
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize:24),
      ),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );

  Widget buildUpgradeButton() =>ButtonWidget(
    text: 'Upgrade To Pro',
    onClicked: () {},
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 16,),
        Text(
          user.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        )
      ],
    ),
  );
}
