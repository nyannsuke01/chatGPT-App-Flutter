import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class DetailPage extends StatelessWidget {
  final String imageUrl;

  const DetailPage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Image.network(imageUrl),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // シェアボタンの処理
                    Share.share(imageUrl);
                  },
                  child: const Icon(Icons.share, size: 35),
                ),
                InkWell(
                  onTap: () {
                    // クリップボードコピーの処理
                    Clipboard.setData(ClipboardData(text: imageUrl));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Copied to clipboard')),
                    );
                  },
                  child: const Icon(Icons.copy, size: 35),
                ),
                InkWell(
                  onTap: () {
                    // ダウンロードの処理
                    // TODO: ダウンロードの処理を実装する
                  },
                  child: const Icon(Icons.download, size: 35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
