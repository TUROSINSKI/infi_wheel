import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/map_home/presentation/widgets/temp_cars_list.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.kPlatinum, AppColors.kOrangeWeb],
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight)),
          ),
          // Padding(
          //   padding: EdgeInsets.only(bottom: 24, left: 24, right: 24, top: 80),
          //   child: Material(
          //     elevation: 4,
          //     borderRadius: BorderRadius.circular(16),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         color: AppColors.kWhite.withOpacity(0.8),
          //         borderRadius: BorderRadius.circular(16)
          //       ),
          //     ),
          //   ),
          // )
          Column(
          children: <Widget>[
            // Upper Section (Image and Texts)
            Expanded(
              child: Center(
                child: Hero(
                  tag: 'signuplogo-tag',
                  child: Image.asset(
                    "assets/images/logo_przezroczyste_granat.png",
                    height: 46.h,
                  ),
                ),
              ),
            ),
            Material(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              elevation: 8,
              child: Hero(
                tag: 'signup-tag',
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.kWhite,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40),
                          child: ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.asset('assets/images/toyota_rav_4.jpg', )),
                        ),
                        Text('Brand', style: TextStyle(color: AppColors.kPlatinum, fontSize: 28, fontWeight: FontWeight.bold)),
                        Text(cars[0].brand, style: TextStyle(color: AppColors.kBlack),),
                        Text('Model', style: TextStyle(color: AppColors.kPlatinum, fontSize: 28, fontWeight: FontWeight.bold)),
                        Text(cars[0].model, style: TextStyle(color: AppColors.kBlack),),
                        Text('Production date', style: TextStyle(color: AppColors.kPlatinum, fontSize: 28, fontWeight: FontWeight.bold)),
                        Text(cars[0].productionDate, style: TextStyle(color: AppColors.kBlack),),
                        Text('Power', style: TextStyle(color: AppColors.kPlatinum, fontSize: 28, fontWeight: FontWeight.bold)),
                        Text(cars[0].power, style: TextStyle(color: AppColors.kBlack),),
                        Text('Type', style: TextStyle(color: AppColors.kPlatinum, fontSize: 28, fontWeight: FontWeight.bold)),
                        Text(cars[0].type, style: TextStyle(color: AppColors.kBlack),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }
}
