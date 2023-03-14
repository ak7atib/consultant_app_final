import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../Model/AttachmentApi.dart';
import '../model_view/AuthApi.dart';
import '../model_view/CategoriesApi.dart';
import '../model_view/MailsApi.dart';
import '../model_view/SenderApi.dart';
import '../model_view/StatusApi.dart';
import '../model_view/TagsApi.dart';

class test extends StatefulWidget {
  test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  Auth auth = Auth();

  ImagePicker picker = ImagePicker();

  MailsApi mail = MailsApi();

  TagsApi tags = TagsApi();

  CategoriesApi cate = CategoriesApi();

  StatusApi status = StatusApi();

  SenderApi sender = SenderApi();

  AttachmentModel attch = AttachmentModel();

  late File imageFile;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  auth.login('o@o.com', '123456').then(
                    (value) async {
                      cate.getSingleCategores(auth.token!.token, 1);
                      // cate.getSingleCategores(auth.token!.token, 2);
                      // cate.getSingleCategores(auth.token!.token, 3);
                      // imageFile = await picker
                      //     .pickMultiImage()
                      //     .then((value) {
                      //   attch
                      //       .uploadImage(value, 263, auth.token!.token)
                      //       .then((value) {
                      //     setState(() {
                      //       loading = true;
                      //     });
                      //   });
                      // });
                    },
                  );
                },
                child: Text('test test')),
            SizedBox(
              height: 100,
            ),
            loading ? Image.file(imageFile) : SizedBox(),
          ],
        ),
      ),
    );
  }
}
