import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/map_home/domain/entities/car.dart';

class CarDetails extends StatelessWidget {

  final Car car;

  const CarDetails({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: 'signuplogo-tag',
                child: Image.asset(
                  "${car.url}",
                  height: 80.h,
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Text('Model: ${car.model}',
                      style: TextStyle(color: AppColors.kBlack, fontSize: 16)),
                  Text('Type: ${car.type}',
                      style: TextStyle(color: AppColors.kBlack, fontSize: 16)),
                  Text('Subtype: ${car.subtype}',
                      style: TextStyle(color: AppColors.kBlack, fontSize: 16)),
                  Text('Year of production: ${car.yearOfProduction}',
                      style: TextStyle(color: AppColors.kBlack, fontSize: 16)),
                  Text('Engine capacity: ${car.engineCapacity}',
                      style: TextStyle(color: AppColors.kBlack, fontSize: 16)),
                  Text('Power: ${car.power}',
                      style: TextStyle(color: AppColors.kBlack, fontSize: 16)),
                  Text('Fuel type: ${car.fuelType}',
                      style: TextStyle(color: AppColors.kBlack, fontSize: 16)),
                  Text('Transmission: ${car.transmission}',
                      style: TextStyle(color: AppColors.kBlack, fontSize: 16)),
                  Text('Number of doors: ${car.numberOfDoors}',
                      style: TextStyle(color: AppColors.kBlack, fontSize: 16)),
                  Text('Number of seats: ${car.numberOfSeats}',
                      style: TextStyle(color: AppColors.kBlack, fontSize: 16)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
