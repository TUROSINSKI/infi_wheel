import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key});

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => GoRouter.of(context).go("/profile"),
            icon: Icon(
              CupertinoIcons.chevron_back,
              color: AppColors.kOxfordBlue,
            )),
        title: Text(
          "Change your email",
          style: TextStyle(color: AppColors.kOxfordBlue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.kPlatinum, width: 2.0),
                    borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(decoration: InputDecoration(hintText: "Current email"),),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.kPlatinum, width: 2.0),
                    borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(decoration: InputDecoration(hintText: "New email"),),
                    )),
              ),
            ),
            Spacer(),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                child: Container(
                    width: double.maxFinite,
                    height: 52,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 101, 217, 109),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                        child: Text(
                      "Confirm",
                      style:
                          TextStyle(color: AppColors.kOxfordBlue, fontSize: 16, fontWeight: FontWeight.bold),
                    ))),
              ),
          ],
        ),
      ),
    );
  }
}
