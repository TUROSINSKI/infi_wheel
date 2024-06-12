import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({super.key});

  @override
  State<MyCarsScreen> createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen> {
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
          "My cars",
          style: TextStyle(color: AppColors.kOxfordBlue),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0, right: 40.0, top: 20.0),
            child: FloatingActionButton(
              onPressed: () => GoRouter.of(context).go('/addcar'),
              backgroundColor: AppColors.kOxfordBlue,
              foregroundColor: AppColors.kPlatinum,
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}