import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/authentication/domain/entities/user.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/get_user/get_user_bloc.dart';
import 'package:lottie/lottie.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  // Controllers for the text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      } else {
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Fetch user data when the widget is first created
    BlocProvider.of<GetUserBloc>(context).add(GetUser());
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
          ),
        ),
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
                border: Border.all(color: Color.fromARGB(255, 101, 217, 109), width: 2.0),
              ),
              child: Icon(CupertinoIcons.check_mark, color: Colors.white),
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetUserBloc, GetUserState>(
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: _buildProfileForm(state),
                ),
              ),
              if (state is GetUserLoading)
                _buildBlurredBackground(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBlurredBackground() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        child: Center(
          child: Lottie.asset('assets/animations/CarAnimation.json'),
        ),
      ),
    );
  }

  Widget _buildProfileForm(GetUserState state) {
    if (state is GetUserSuccess) {
      // Populate text fields with user data
      User user = state.user;
      _firstNameController.text = user.firstName ?? '';
      _surnameController.text = user.surname ?? '';
      _usernameController.text = user.username ?? '';
      _ageController.text = user.age?.toString() ?? '';
    }

    return Column(
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
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("First name", style: TextStyle(color: AppColors.kOxfordBlue),),
            ProfileDataField(controller: _firstNameController),
            Text("Surname", style: TextStyle(color: AppColors.kOxfordBlue),),
            ProfileDataField(controller: _surnameController),
            Text("Username", style: TextStyle(color: AppColors.kOxfordBlue),),
            ProfileDataField(controller: _usernameController),
            Text("Age", style: TextStyle(color: AppColors.kOxfordBlue),),
            ProfileDataField(controller: _ageController, keyboardType: TextInputType.number),
          ],
        ),
        GestureDetector(
          onTap: () => GoRouter.of(context).go('/email'),
          child: ChangeButton(text: "Change your email"),
        ),
        ChangeButton(text: "Change your password"),
      ],
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
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: AppColors.kOxfordBlue, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class ProfileDataField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;

  const ProfileDataField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPlatinum, width: 2.0),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              style: TextStyle(color: AppColors.kOxfordBlue),
              decoration: InputDecoration(border: InputBorder.none, hintStyle: TextStyle(color: AppColors.kOxfordBlue)),
            ),
          ),
        ),
      ),
    );
  }
}
