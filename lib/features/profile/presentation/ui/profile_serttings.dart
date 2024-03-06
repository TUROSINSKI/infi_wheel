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
    // Pick an image from the gallery or take a picture with the camera
    // This example uses the gallery
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

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
        leading: IconButton(onPressed: ()=> GoRouter.of(context).go("/home"), icon: Icon(CupertinoIcons.chevron_back, color: AppColors.kOxfordBlue,)),
        title: Text("Profile", style: TextStyle(color: AppColors.kOxfordBlue),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.gear, color: AppColors.kOxfordBlue,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        // child: Image.asset("assets/images/toyota_rav_4.jpg", fit: BoxFit.cover,)),
                        child: _image == null ? Image.asset("assets/images/toyota_rav_4.jpg", fit: BoxFit.cover,) : Image.file(File(_image!.path), fit: BoxFit.cover,),),
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
                        child: IconButton(onPressed: _pickImage ,icon: Icon(CupertinoIcons.photo, color: AppColors.kOxfordBlue,)),
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
          ],
        ),
      ),
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
          borderRadius: BorderRadius.circular(16)
        ),
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