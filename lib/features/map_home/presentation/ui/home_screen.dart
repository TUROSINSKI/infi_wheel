import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/core/utils/constants.dart';
import 'package:infi_wheel/features/map_home/data/models/car_model.dart';
import 'package:infi_wheel/features/map_home/domain/entities/car.dart';
import 'package:infi_wheel/features/map_home/presentation/blocs/cars/cars_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CarsBloc>().add(FetchCarsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildDrawerHeader(context),
                buildDrawerMenu(context),
              ],
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: Location.pPolitechnikaBialostocka,
                zoom: 17,
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.2.h,
              minChildSize: 0.05.h,
              maxChildSize: 0.6.h,
              builder: (context, controller) => Material(
                elevation: 16,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Column(children: [
                  SizedBox(
                    height: 16.0.h,
                  ),
                  Container(
                    width: 40.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(2.5)),
                    ),
                  ),
                  Expanded(child: BlocBuilder<CarsBloc, CarsState>(
                    builder: (context, state) {
                      if (state is CarsLoading) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: AppColors.kBlack,
                        ));
                      } else if (state is CarsLoaded) {
                        return GridView.builder(
                          controller: controller,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                          itemCount: state.cars.length,
                          padding: EdgeInsets.all(16),
                          itemBuilder: (context, index) {
                            Car car = state.cars[index];
                            return Container(
                              decoration: BoxDecoration(
                                  color: AppColors.kSnowyGrey,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        offset: Offset(0, 1),
                                        spreadRadius: -2,
                                        blurRadius: 10)
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: GestureDetector(
                                          onTap: () =>
                                              showItemDetails(context, car),
                                          child: Image.network(
                                            '${car.url}',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        '${car.manufacturer} ${car.model}',
                                        style: TextStyle(
                                            color: AppColors.kBlack,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else if (state is CarsError) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Text('Error',
                              style: TextStyle(color: AppColors.kBlack)),
                        );
                      }
                      return Center(
                          child: Text(
                        'No cars found',
                        style: TextStyle(color: AppColors.kBlack),
                      ));
                    },
                  )),
                ]),
              ),
            ),
          ],
        ));
  }

  Widget buildList(int index) => ListTile(
        title: Text(
          index.toString(),
          style: TextStyle(fontSize: 24, color: AppColors.kBlack),
        ),
      );

  void showItemDetails(BuildContext context, Car car) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          double dialogHeight = MediaQuery.of(context).size.height * 0.6;
          double dialogWidth = MediaQuery.of(context).size.width * 0.8;
          return AlertDialog(
            title: Center(
                child: Text(car.manufacturer,
                    style: TextStyle(color: AppColors.kBlack, fontWeight: FontWeight.bold))),
            content: SizedBox(
              height: dialogHeight,
              width: dialogWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          '${car.url}',
                        ),
                      ),
                    ),
                  ),
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
            ),
            actions: <Widget>[
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.kSnowyGrey
                  ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child:
                        Text('Close', style: TextStyle(color: AppColors.kBlack))),
              )
            ],
          );
        });
  }
  
  Widget buildDrawerHeader(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
      gradient: LinearGradient(
                  colors: [AppColors.kPlatinum, AppColors.kOrangeWeb],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)
    ),
    height: MediaQuery.of(context).size.height * 0.15,
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Center(child: Text('InfiWheel', style: TextStyle(color: AppColors.kOxfordBlue, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1))),
  );
  
  Widget buildDrawerMenu(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.redAccent,),
          title: const Text('Logout', style: TextStyle(color: AppColors.kBlack, fontWeight: FontWeight.bold),),
          onTap: () => GoRouter.of(context).go('/'),
        )
      ],
    ),
  );
}