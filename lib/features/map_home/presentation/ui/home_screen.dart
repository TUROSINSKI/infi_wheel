// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:infi_wheel/core/utils/colors.dart';
// import 'package:infi_wheel/core/utils/constants.dart';
// import 'package:infi_wheel/features/cars/domain/entities/car.dart';
// import 'package:infi_wheel/features/map_home/presentation/blocs/cars/cars_bloc.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     context.read<CarsBloc>().add(FetchCarsEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: _scaffoldKey,
//         drawer: Drawer(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 buildDrawerHeader(context),
//                 buildDrawerMenu(context),
//               ],
//             ),
//           ),
//         ),
//         body: Stack(
//           children: <Widget>[
//             BlocBuilder<CarsBloc, CarsState>(
//               builder: (context, state) {
//                 if (state is CarsLoaded){
//                   return GoogleMap(
//                   zoomControlsEnabled: false,
//                   initialCameraPosition: CameraPosition(
//                     target: Location.pPolitechnikaBialostocka,
//                     zoom: 17,
//                   ),
//                   markers: _createMarkers(state.cars),
//                 );
//                 } else {
//                   return Text('Unknown state');
//                 }
//               },
//             ),
//             Positioned(
//               top: 40.h,
//               left: 20,
//               child: FloatingActionButton(
//                 elevation: 2.0,
//                 shape: const CircleBorder(),
//                 onPressed: () => _scaffoldKey.currentState?.openDrawer(),
//                 child: const Icon(
//                   Icons.menu,
//                   color: AppColors.kOxfordBlue,
//                 ),
//               ),
//             ),
//             DraggableScrollableSheet(
//               initialChildSize: 0.25.h,
//               minChildSize: 0.1.h,
//               maxChildSize: 0.6.h,
//               builder: (context, controller) => Material(
//                 elevation: 16,
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16)),
//                 child: Column(children: [
//                   SizedBox(
//                     height: 16.0.h,
//                   ),
//                   Container(
//                     width: 40.0,
//                     height: 5.0,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius:
//                           const BorderRadius.all(Radius.circular(2.5)),
//                     ),
//                   ),
//                   Expanded(child: BlocBuilder<CarsBloc, CarsState>(
//                     builder: (context, state) {
//                       if (state is CarsLoading) {
//                         return const Center(
//                             child: CircularProgressIndicator(
//                           color: AppColors.kOrangeWeb,
//                         ));
//                       } else if (state is CarsLoaded) {
//                         return Padding(
//                           padding: const EdgeInsets.only(top: 16.0),
//                           child: GridView.builder(
//                             controller: controller,
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               mainAxisSpacing: 16,
//                               crossAxisSpacing: 16,
//                             ),
//                             itemCount: state.cars.length,
//                             padding: const EdgeInsets.all(16),
//                             itemBuilder: (context, index) {
//                               Car car = state.cars[index];
//                               return Container(
//                                 decoration: BoxDecoration(
//                                     color: AppColors.kSnowyGrey,
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.black.withOpacity(0.2),
//                                           offset: const Offset(0, 1),
//                                           spreadRadius: -2,
//                                           blurRadius: 10)
//                                     ],
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(16))),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Column(
//                                     children: [
//                                       Expanded(
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                           child: Container(
//                                             height: double.maxFinite,
//                                             width: double.maxFinite,
//                                             child: GestureDetector(
//                                               onTap: () =>
//                                                   showItemDetails(context, car),
//                                               child: Image.network(
//                                                 '${car.url}',
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(top: 8.0),
//                                         child: Text(
//                                           '${car.manufacturer} ${car.model}',
//                                           style: const TextStyle(
//                                               color: AppColors.kBlack,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//                       } else if (state is CarsError) {
//                         return const Padding(
//                           padding: EdgeInsets.only(top: 100.0),
//                           child: Text('Error',
//                               style: TextStyle(color: AppColors.kBlack)),
//                         );
//                       }
//                       return const Center(
//                           child: Text(
//                         'No cars found',
//                         style: TextStyle(color: AppColors.kBlack),
//                       ));
//                     },
//                   )),
//                 ]),
//               ),
//             ),
//           ],
//         ));
//   }

//   void showItemDetails(BuildContext context, Car car) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           double dialogHeight = MediaQuery.of(context).size.height * 0.6;
//           double dialogWidth = MediaQuery.of(context).size.width * 0.8;
//           return AlertDialog(
//             title: Center(
//                 child: Text(car.manufacturer + " " + car.model,
//                     style: const TextStyle(
//                         color: AppColors.kBlack, fontWeight: FontWeight.bold))),
//             content: SizedBox(
//               height: dialogHeight,
//               width: dialogWidth,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 20.0),
//                       child: Center(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.network(
//                             '${car.url}',
//                           ),
//                         ),
//                       ),
//                     ),
//                     Text('Type: ${car.type}',
//                         style: const TextStyle(
//                             color: AppColors.kBlack, fontSize: 16)),
//                     Text('Subtype: ${car.subtype}',
//                         style: const TextStyle(
//                             color: AppColors.kBlack, fontSize: 16)),
//                     Text('Year of production: ${car.yearOfProduction}',
//                         style: const TextStyle(
//                             color: AppColors.kBlack, fontSize: 16)),
//                     Text('Engine capacity: ${car.engineCapacity}',
//                         style: const TextStyle(
//                             color: AppColors.kBlack, fontSize: 16)),
//                     Text('Power: ${car.power}',
//                         style: const TextStyle(
//                             color: AppColors.kBlack, fontSize: 16)),
//                     Text('Fuel type: ${car.fuelType}',
//                         style: const TextStyle(
//                             color: AppColors.kBlack, fontSize: 16)),
//                     Text('Transmission: ${car.transmission}',
//                         style: const TextStyle(
//                             color: AppColors.kBlack, fontSize: 16)),
//                     Text('Number of doors: ${car.numberOfDoors}',
//                         style: const TextStyle(
//                             color: AppColors.kBlack, fontSize: 16)),
//                     Text('Number of seats: ${car.numberOfSeats}',
//                         style: const TextStyle(
//                             color: AppColors.kBlack, fontSize: 16)),
//                   ],
//                 ),
//               ),
//             ),
//             actions: <Widget>[
//               Center(
//                 child: TextButton(
//                     style: TextButton.styleFrom(
//                         backgroundColor: AppColors.kSnowyGrey),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text('Close',
//                         style: TextStyle(color: AppColors.kBlack))),
//               )
//             ],
//           );
//         });
//   }

//   Widget buildDrawerHeader(BuildContext context) => Container(
//         decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(8),
//                 bottomRight: Radius.circular(8)),
//             gradient: LinearGradient(
//                 colors: [AppColors.kPlatinum, AppColors.kOrangeWeb],
//                 begin: Alignment.bottomLeft,
//                 end: Alignment.topRight)),
//         height: MediaQuery.of(context).size.height * 0.15,
//         padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//         child: const Center(
//             child: Text('InfiWheel',
//                 style: TextStyle(
//                     color: AppColors.kOxfordBlue,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24,
//                     letterSpacing: 1))),
//       );

//   Widget buildDrawerMenu(BuildContext context) => Container(
//         padding: const EdgeInsets.all(20),
//         child: Wrap(
//           runSpacing: 16,
//           children: [
//             ListTile(
//               leading: const Icon(Icons.person, color: AppColors.kOxfordBlue),
//               title: const Text('Profile',
//                   style: TextStyle(
//                       color: AppColors.kBlack, fontWeight: FontWeight.bold)),
//               onTap: () => GoRouter.of(context).go('/profile'),
//             ),
//             ListTile(
//               leading: const Icon(Icons.import_contacts,
//                   color: AppColors.kOxfordBlue),
//               title: const Text('My Bookings',
//                   style: TextStyle(
//                       color: AppColors.kBlack, fontWeight: FontWeight.bold)),
//               onTap: () => GoRouter.of(context).go('/bookings'),
//             ),
//             ListTile(
//               leading: const Icon(Icons.car_rental, color: AppColors.kOxfordBlue,),
//               title: const Text('My cars',
//               style: TextStyle(color: AppColors.kBlack, fontWeight: FontWeight.bold),),
//               onTap: () => GoRouter.of(context).go('/mycars'),
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings, color: AppColors.kOxfordBlue),
//               title: const Text('Settings',
//                   style: TextStyle(
//                       color: AppColors.kBlack, fontWeight: FontWeight.bold)),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.redAccent),
//               title: const Text('Logout',
//                   style: TextStyle(
//                       color: AppColors.kBlack, fontWeight: FontWeight.bold)),
//               onTap: () => GoRouter.of(context).go('/'),
//             ),
//           ],
//         ),
//       );

//   Set<Marker> _createMarkers(List<Car> cars) {
//     return cars.map((car) {
//       return Marker(
//         markerId: MarkerId(car.id.toString()),
//         position: LatLng(car.xLocation, car.yLocation),
//         // position: Location.pPolitechnikaBialostocka,
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
//         infoWindow: InfoWindow(
//           title: car.model,
//           snippet: car.manufacturer,
//         ),
//       );
//     }).toSet();
//   }

// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/core/utils/constants.dart';
import 'package:infi_wheel/features/cars/domain/entities/car.dart';
import 'package:infi_wheel/features/map_home/presentation/blocs/cars/cars_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    context.read<CarsBloc>().add(FetchCarsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildDrawerHeader(context),
              FutureBuilder<String?>(
                future: storage.read(key: 'role_name'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Error loading role'));
                  }

                  final role = snapshot.data;
                  return buildDrawerMenu(context, role);
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<String?>(
        future: storage.read(key: 'role_name'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('Error loading role'));
          }

          final role = snapshot.data;

          if (role == 'user') {
            // Show map and scrollable sheet if user has role 'user'
            return Stack(
              children: <Widget>[
                BlocBuilder<CarsBloc, CarsState>(
                  builder: (context, state) {
                    if (state is CarsLoaded) {
                      return GoogleMap(
                        zoomControlsEnabled: false,
                        initialCameraPosition: const CameraPosition(
                          target: Location.pPolitechnikaBialostocka,
                          zoom: 17,
                        ),
                        markers: _createMarkers(state.cars),
                      );
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.kOrangeWeb,
                      ));
                    }
                  },
                ),
                Positioned(
                  top: 40.h,
                  left: 20,
                  child: FloatingActionButton(
                    elevation: 2.0,
                    shape: const CircleBorder(),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    child: const Icon(
                      Icons.menu,
                      color: AppColors.kOxfordBlue,
                    ),
                  ),
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.25.h,
                  minChildSize: 0.1.h,
                  maxChildSize: 0.6.h,
                  builder: (context, controller) => Material(
                    elevation: 16,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    child: Column(
                      children: [
                        SizedBox(height: 16.0.h),
                        Container(
                          width: 40.0,
                          height: 5.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2.5)),
                          ),
                        ),
                        Expanded(
                          child: BlocBuilder<CarsBloc, CarsState>(
                            builder: (context, state) {
                              if (state is CarsLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.kOrangeWeb,
                                  ),
                                );
                              } else if (state is CarsLoaded) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: GridView.builder(
                                    controller: controller,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16,
                                    ),
                                    itemCount: state.cars.length,
                                    padding: const EdgeInsets.all(16),
                                    itemBuilder: (context, index) {
                                      Car car = state.cars[index];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.kSnowyGrey,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              offset: const Offset(0, 1),
                                              spreadRadius: -2,
                                              blurRadius: 10,
                                            ),
                                          ],
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(16),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: GestureDetector(
                                                    onTap: () =>
                                                        showItemDetails(
                                                            context, car),
                                                    child: Image.network(
                                                      car.url,
                                                      fit: BoxFit.cover,
                                                      width: double.maxFinite,
                                                      height: double.maxFinite,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Text(
                                                  '${car.manufacturer} ${car.model}',
                                                  style: const TextStyle(
                                                    color: AppColors.kBlack,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              } else if (state is CarsError) {
                                return const Padding(
                                  padding: EdgeInsets.only(top: 100.0),
                                  child: Text(
                                    'Error',
                                    style: TextStyle(color: AppColors.kBlack),
                                  ),
                                );
                              }
                              return const Center(
                                child: Text(
                                  'No cars found',
                                  style: TextStyle(color: AppColors.kBlack),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Show different screen if user does not have role 'user'
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [AppColors.kPlatinum, AppColors.kOrangeWeb],
                          begin: Alignment.centerLeft,
                          end: Alignment.topRight)),
                ),
                Positioned(
                  top: 40.h,
                  left: 20,
                  child: FloatingActionButton(
                    elevation: 1.0,
                    backgroundColor: AppColors.kOxfordBlue,
                    shape: const CircleBorder(),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    child: const Icon(
                      Icons.menu,
                      color: AppColors.kWhite,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text(
                        'Welcome to',
                        style: TextStyle(
                            fontSize: 28, color: AppColors.kOxfordBlue),
                      ),
                      Text('InfiWheel',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      Text('for Hosts',
                          style: TextStyle(
                              fontSize: 28, color: AppColors.kOxfordBlue)),
                      Spacer(),
                      Image.asset(
                        "assets/images/logo_przezroczyste_granat.png",
                        height: 84.h,
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }

  void showItemDetails(BuildContext context, Car car) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double dialogHeight = MediaQuery.of(context).size.height * 0.6;
        double dialogWidth = MediaQuery.of(context).size.width * 0.8;
        return AlertDialog(
          title: Center(
            child: Text(
              car.manufacturer + " " + car.model,
              style: const TextStyle(
                color: AppColors.kBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: SizedBox(
            height: dialogHeight,
            width: dialogWidth,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(car.url),
                      ),
                    ),
                  ),
                  Text(
                    'Type: ${car.type}',
                    style: const TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Subtype: ${car.subtype}',
                    style: const TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Year of production: ${car.yearOfProduction}',
                    style: const TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Engine capacity: ${car.engineCapacity}',
                    style: const TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Power: ${car.power}',
                    style: const TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Fuel type: ${car.fuelType}',
                    style: const TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Transmission: ${car.transmission}',
                    style: const TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Number of doors: ${car.numberOfDoors}',
                    style: const TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Number of seats: ${car.numberOfSeats}',
                    style: const TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: 140,
                    child: TextButton(
                        onPressed: () => GoRouter.of(context).go('/rent', extra: car),
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.kOxfordBlue),
                        child: const Text(
                          'Rent',
                          style: TextStyle(color: AppColors.kWhite),
                        ))),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.kSnowyGrey,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Close',
                  style: TextStyle(color: AppColors.kBlack),
                ),
              ),
            ]),
          ],
        );
      },
    );
  }

  Widget buildDrawerHeader(BuildContext context) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          gradient: LinearGradient(
            colors: [AppColors.kPlatinum, AppColors.kOrangeWeb],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.15,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: const Center(
          child: Text(
            'InfiWheel',
            style: TextStyle(
              color: AppColors.kOxfordBlue,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 1,
            ),
          ),
        ),
      );

  Widget buildDrawerMenu(BuildContext context, String? role) => Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.person, color: AppColors.kOxfordBlue),
              title: const Text(
                'Profile',
                style: TextStyle(
                  color: AppColors.kBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => GoRouter.of(context).go('/profile'),
            ),
            if (role != 'seller') // Only show for users who are not sellers
              ListTile(
                leading: const Icon(Icons.import_contacts,
                    color: AppColors.kOxfordBlue),
                title: const Text(
                  'My Bookings',
                  style: TextStyle(
                    color: AppColors.kBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => GoRouter.of(context).go('/bookings'),
              ),
            if (role != 'user') // Only show for users who are not regular users
              ListTile(
                leading:
                    const Icon(Icons.car_rental, color: AppColors.kOxfordBlue),
                title: const Text(
                  'My Cars',
                  style: TextStyle(
                    color: AppColors.kBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => GoRouter.of(context).go('/mycars'),
              ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.kOxfordBlue),
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: AppColors.kBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: AppColors.kBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => GoRouter.of(context).go('/'),
            ),
          ],
        ),
      );

  Set<Marker> _createMarkers(List<Car> cars) {
    return cars.map((car) {
      return Marker(
        markerId: MarkerId(car.id.toString()),
        position: LatLng(car.xLocation, car.yLocation),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(
          title: car.model,
          snippet: car.manufacturer,
        ),
      );
    }).toSet();
  }
}
