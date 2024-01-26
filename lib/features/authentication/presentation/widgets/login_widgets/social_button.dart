import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.icon,
    required this.press,
    super.key,
  });

  final String icon;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSocialLogin(context),
      child: SizedBox(
        height: 50,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(2),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SvgPicture.asset(
            icon,
          ),
        ),
      ),
    );
  }

  void showSocialLogin(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          double dialogHeight = MediaQuery.of(context).size.height * 0.1;
          double dialogWidth = MediaQuery.of(context).size.width * 0.5;
          return AlertDialog(
            content: SizedBox(
              height: dialogHeight,
              width: dialogWidth,
                child: Center(
                    child: Text("Coming soon...",
                        style: TextStyle(
                          color: AppColors.kOxfordBlue,
                          fontSize: 28
                        )))),
            actions: <Widget>[
              Center(
                child: SizedBox(
                  width: 100,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.kSnowyGrey),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close',
                          style: TextStyle(color: AppColors.kOxfordBlue))),
                ),
              )
            ],
          );
        });
  }
}
