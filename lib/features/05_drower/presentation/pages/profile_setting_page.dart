import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class User {
  String? userName;
  String? email;
  String? detail;
  String? imageUrl;

  User({this.userName, this.email, this.detail, this.imageUrl});
}

class ProfileSettingPage extends StatefulWidget {
  final User user;

  const ProfileSettingPage({required Key key, required this.user})
      : super(key: key);

  get profileData => null;

  @override
  _ProfileSettingPageState createState() => _ProfileSettingPageState();
}

class ProfileSettingPage extends StatefulWidget {
  final ProfileData profileData;

  const ProfileSettingPage({Key? key, required this.profileData})
      : super(key: key);

  @override
  _ProfileSettingPageState createState() => _ProfileSettingPageState();
}

class _ProfileSettingPageState extends State<ProfileSettingPage> {
  final _formKey = GlobalKey<FormState>();
  late ProfileData _editedProfileData;

  @override
  void initState() {
    super.initState();
    _editedProfileData = widget.profileData;
  }

  void _submitForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      Navigator.pop(context, _editedProfileData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('プロフィール設定')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _editedProfileData.userName,
                decoration: const InputDecoration(labelText: 'ユーザー名'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ユーザー名を入力してください';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProfileData = _editedProfileData.copyWith(
                    userName: value!,
                  );
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _editedProfileData.email,
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'メールアドレスを入力してください';
                  }
                  if (!EmailValidator.validate(value)) {
                    return '正しいメールアドレスを入力してください';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProfileData = _editedProfileData.copyWith(
                    email: value!,
                  );
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _editedProfileData.detail,
                decoration: const InputDecoration(labelText: '詳細'),
                maxLines: 5,
                onSaved: (value) {
                  _editedProfileData = _editedProfileData.copyWith(
                    detail: value!,
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('保存する'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailValidator {}
