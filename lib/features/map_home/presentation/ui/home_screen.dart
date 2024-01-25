import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/core/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
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
          initialChildSize: 0.05.h,
          minChildSize: 0.05.h,
          maxChildSize: 0.6.h,
          builder: (context, controller) => Material(
            elevation: 16,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16)
            ),
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
              Expanded(
                child: GridView.builder(
                  controller: controller,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: 10,
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.kOxfordBlue, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(16))
                      ),
                    );
                  },
                )
              ),
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
}
