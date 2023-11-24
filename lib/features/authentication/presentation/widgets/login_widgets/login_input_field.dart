import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infi_wheel/core/utils/colors.dart';

Widget loginInputField(BuildContext context,IconData icon, TextInputType inputType,
    TextInputAction inputAction, String hint, bool obscure, void Function(String value)? function)
     {
      Size size = MediaQuery.of(context).size;
      return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: size.height*0.08,
          width: size.width*0.8,
          decoration: BoxDecoration(
            color: AppColors.kPlatinum,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: TextField(
              onChanged: (value)=>function!(value),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(icon, size: 30, color: AppColors.kOxfordBlue,)),
                hintText: hint,
                hintStyle: TextStyle(
                  color: TextColors.kOnBoardText
                )
              ),
              obscureText: obscure,
              keyboardType: inputType,
              textInputAction: inputAction,
            ),
          ),
        ),
      ),
    );
    }
