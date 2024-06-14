import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class RentScreen extends StatefulWidget {
  const RentScreen({super.key});

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
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
          "Rent",
          style: TextStyle(color: AppColors.kOxfordBlue),
        ),
      ),
    );
  }
}