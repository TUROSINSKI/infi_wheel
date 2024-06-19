// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:infi_wheel/core/utils/colors.dart';
// import 'package:infi_wheel/features/map_home/presentation/blocs/cars/cars_bloc.dart';

// class AdminCarListPage extends StatefulWidget {
//   const AdminCarListPage({super.key});

//   @override
//   State<AdminCarListPage> createState() => _AdminCarListPageState();
// }

// class _AdminCarListPageState extends State<AdminCarListPage> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<CarsBloc>().add(FetchCarsEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () => GoRouter.of(context).go("/admindashboard"),
//           icon: Icon(
//             CupertinoIcons.chevron_back,
//             color: AppColors.kOxfordBlue,
//           ),
//         ),
//         title: Text(
//           "All cars",
//           style: TextStyle(color: AppColors.kOxfordBlue),
//         ),
//       ),
//       body: BlocBuilder<CarsBloc, CarsState>(
//         builder: (context, state) {
//           if (state is CarsLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is CarsLoaded) {
//             return ListView.builder(
//               itemCount: state.cars.length,
//               itemBuilder: (context, index) {
//                 final car = state.cars[index];
//                 return Container(
//                   decoration: BoxDecoration(
//                       border: BorderDirectional(
//                           bottom: BorderSide(
//                               color: AppColors.kPlatinum, width: 2.0))),
//                   child: ListTile(
//                     title: Text(
//                       car.model,
//                       style: TextStyle(color: AppColors.kOxfordBlue),
//                     ),
//                     subtitle: Text(
//                       car.model,
//                       style: TextStyle(color: AppColors.kOxfordBlue),
//                     ),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.delete, color: Colors.redAccent),
//                           onPressed: () {
//                             // Handle delete action
//                           },
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.edit, color: AppColors.kOxfordBlue),
//                           onPressed: () {
//                             // Handle edit action
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else if (state is CarsError) {
//             return Center(child: Text('Error: ${state.message}'));
//           } else {
//             return Center(child: Text('No cars available.'));
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/map_home/presentation/blocs/cars/cars_bloc.dart';

class AdminCarListPage extends StatefulWidget {
  const AdminCarListPage({super.key});

  @override
  State<AdminCarListPage> createState() => _AdminCarListPageState();
}

class _AdminCarListPageState extends State<AdminCarListPage> {
  @override
  void initState() {
    super.initState();
    context.read<CarsBloc>().add(FetchCarsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).go("/admindashboard"),
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: AppColors.kOxfordBlue,
          ),
        ),
        title: Text(
          "All cars",
          style: TextStyle(color: AppColors.kOxfordBlue),
        ),
      ),
      body: BlocBuilder<CarsBloc, CarsState>(
        builder: (context, state) {
          if (state is CarsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                final car = state.cars[index];
                return Container(
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      bottom: BorderSide(color: AppColors.kPlatinum, width: 2.0),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      car.model,
                      style: TextStyle(color: AppColors.kOxfordBlue),
                    ),
                    subtitle: Text(
                      car.id.toString(),
                      style: TextStyle(color: AppColors.kOxfordBlue),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () => _showDeleteConfirmationDialog(context, car.id),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, color: AppColors.kOxfordBlue),
                          onPressed: () => GoRouter.of(context).go('/editcar', extra: car),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is CarsError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No cars available.'));
          }
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int carId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Car"),
          content: Text("Are you sure you want to delete this car?"),
          actions: [
            TextButton(
              child: Text("Cancel", style: TextStyle(color: AppColors.kOxfordBlue),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Delete", style: TextStyle(color: AppColors.kOxfordBlue)),
              onPressed: () {
                Navigator.of(context).pop();
                context.read<CarsBloc>().add(DeleteCarEvent(carId));
              },
            ),
          ],
        );
      },
    );
  }
}
