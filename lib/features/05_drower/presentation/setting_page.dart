import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingsList(
      platform: DevicePlatform.iOS,
      sections: [
        SettingsSection(
          title: const Text('サポート'),
          tiles: <SettingsTile>[
            SettingsTile(
              leading: const Icon(Icons.mail),
              title: const Text('お問い合わせ'),
              value: const Text('mail'),
              onPressed: (context) => _launchMailer(),
            ),
            SettingsTile(
              leading: const Icon(Icons.language),
              title: const Text('言語選択'),
              value: const Text('jp'),
            ),
            SettingsTile.switchTile(
              leading: const Icon(Icons.nightlight_round),
              title: const Text('ダークモード'),
              initialValue: true,
              onToggle: (value) {},
            ),
            SettingsTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('このアプリについて'),
              onPressed: (context) => _showAboutDialog(context),
            ),
          ],
        ),
      ],
    );
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> _launchMailer() async {
    const address = 'メールアドレス';
    final Uri uri = Uri(
      scheme: 'mailto',
      path: address,
      query: _encodeQueryParameters(<String, String>{
        'subject': 'メールの件名',
      }),
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // エラー処理
    }
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('このアプリについて'),
          content: const Text('Flutterで作られたアプリです。'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
