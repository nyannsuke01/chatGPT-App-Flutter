import 'package:chat_gpt/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

import '../../core/utils/assets_manager.dart';
import '../../core/utils/routes_manager.dart';
import '../../core/utils/strings_manager.dart';
import '../05_drower/presentation/setting_page.dart';
import 'widgets/home_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Container(
        width: 200,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              accountName: Text("Nilesh Rathod"),
              accountEmail: Text("nilesh@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("Nilu"),
              ),
            ),
            ListTile(
              title: Text("Profile"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushNamed(context, Routes.profileRoute);
              },
            ),
            const ListTile(
              title: Text("nottification"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("Setting"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushNamed(context, Routes.settingRoute);
              },
            ),
            ListTile(
              title: Text("ライセンス"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("logout"),
              trailing: Icon(Icons.arrow_forward),
            )
            // ListTile(
            //   title: Text(
            //     AppLocalizations.of(context)!.hello("kazutxt"),
            //   ),
            //   trailing: Icon(Icons.arrow_forward),
            // ),
            // ListTile(
            //   title: Text(
            //     AppLocalizations.of(context)!.allow,
            //   ),
            //   trailing: Icon(Icons.arrow_forward),
            // ),
            // ListTile(
            //   title: Text(
            //     AppLocalizations.of(context)!.deny,
            //   ),
            //   trailing: Icon(Icons.arrow_forward),
            // ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: AppSize.s60,
                ),
                Image.asset(ImageAssets.appLogo),
              ],
            ),
            Column(
              children: [
                HomeButtonWidget(
                  textData: AppStrings.imageGeneration,
                  iconData: Icons.image_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.imageRoute);
                  },
                ),
                const SizedBox(
                  height: AppSize.s30,
                ),
                HomeButtonWidget(
                  textData: AppStrings.textCompletion,
                  iconData: Icons.text_fields_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.textRoute);
                  },
                ),
                const SizedBox(
                  height: AppSize.s30,
                ),
                HomeButtonWidget(
                  textData: "Chat ",
                  iconData: Icons.chat_bubble_rounded,
                  onTap: () {
                    _launchURL('https://chat.openai.com/');
                  },
                ),
              ],
            ),
            const Text(
              "Powered by ChatGPT DeepL",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
