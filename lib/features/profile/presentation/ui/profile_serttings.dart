import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => GoRouter.of(context).go("/home"),
            icon: Icon(
              CupertinoIcons.chevron_back,
              color: AppColors.kOxfordBlue,
            )),
        title: Text(
          "Profile",
          style: TextStyle(color: AppColors.kOxfordBlue),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              width: 68,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 101, 217, 109),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color.fromARGB(255, 101, 217, 109), width: 2.0)
              ),
              child: Icon(CupertinoIcons.check_mark, color: Colors.white,),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.kPlatinum, width: 3.0),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.grey.withOpacity(0.5),
                        spreadRadius:
                            1,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: _image == null
                              ? Image.asset(
                                  "assets/images/blank_profile_picture.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(_image!.path),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 8.0,
                        right: 8.0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.kWhite,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                              onPressed: _pickImage,
                              icon: Icon(
                                CupertinoIcons.photo,
                                color: AppColors.kOxfordBlue,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("First name"),
                  ProfileDataField(),
                  Text("Surname"),
                  ProfileDataField(),
                  Text("Username"),
                  ProfileDataField(),
                  Text("Age"),
                  ProfileDataField(),
                ],
              ),
              GestureDetector(
                onTap: () => GoRouter.of(context).go('/email'),
                child: ChangeButton(text: "Change your email")),
              ChangeButton(text: "Change your password"),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeButton extends StatelessWidget {
  final String text;
  const ChangeButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
          width: double.maxFinite,
          height: 52,
          decoration: BoxDecoration(
              color: AppColors.kPlatinum,
              borderRadius: BorderRadius.circular(16)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: AppColors.kOxfordBlue, fontSize: 16),
          ))),
    );
  }
}

class ProfileDataField extends StatelessWidget {
  const ProfileDataField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kPlatinum, width: 2.0),
            borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(),
            )),
      ),
    );
  }
}
