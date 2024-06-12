import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).go("/mycars"),
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: AppColors.kOxfordBlue,
          ),
        ),
        title: Text(
          "Add car",
          style: TextStyle(color: AppColors.kOxfordBlue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              infoInputField('Photo URL'),
              infoInputField('Brand'),
              infoInputField('Model'),
              infoInputField('Type'),
              infoInputField('Subtype'),
              infoInputField('Year of production'),
              infoInputField('VIN number'),
              infoInputField('Engine capacity'),
              infoInputField('Power'),
              infoInputField('Fuel type'),
              infoInputField('Transmission'),
              infoInputField('Number of doors'),
              infoInputField('Number of seats'),
              infoInputField('Registration plate'),
              infoInputField('Registration number'),
              infoInputField('AC'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget infoInputField(String hint)
     {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Material(
          elevation: 0.5,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 48,
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.kPlatinum, width: 1.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 8.0),
                child: TextField(
                  style: const TextStyle(color: AppColors.kBlack),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: const TextStyle(
                      color: TextColors.kOnBoardText
                    )
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
