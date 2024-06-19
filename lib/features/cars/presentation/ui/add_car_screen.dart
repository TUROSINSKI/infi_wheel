// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:infi_wheel/core/utils/colors.dart';

// class AddCarScreen extends StatefulWidget {
//   const AddCarScreen({super.key});

//   @override
//   State<AddCarScreen> createState() => _AddCarScreenState();
// }

// class _AddCarScreenState extends State<AddCarScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () => GoRouter.of(context).go("/mycars"),
//           icon: Icon(
//             CupertinoIcons.chevron_back,
//             color: AppColors.kOxfordBlue,
//           ),
//         ),
//         title: Text(
//           "Add car",
//           style: TextStyle(color: AppColors.kOxfordBlue),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               infoInputField('Photo URL'),
//               infoInputField('Brand'),
//               infoInputField('Model'),
//               infoInputField('Type'),
//               infoInputField('Subtype'),
//               infoInputField('Year of production'),
//               infoInputField('VIN number'),
//               infoInputField('Engine capacity'),
//               infoInputField('Power'),
//               infoInputField('Fuel type'),
//               infoInputField('Transmission'),
//               infoInputField('Number of doors'),
//               infoInputField('Number of seats'),
//               infoInputField('Registration plate'),
//               infoInputField('Registration number'),
//               infoInputField('AC'),
//               SizedBox(
//                 height: MediaQuery.sizeOf(context).height*0.15,
//               )
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 80.0),
//         child: SizedBox(
//           width: double.maxFinite,
//           child: FloatingActionButton(
//             elevation: 2,
//             backgroundColor: AppColors.kOxfordBlue,
//             onPressed: () {
//               // Action when the FAB is pressed
//             },
//             child: Text('Done!', style: TextStyle(fontSize: 16),),
//           ),
//         ),
//       ),
      
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }

// Widget infoInputField(String hint) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 12.0),
//     child: Material(
//       elevation: 0.5,
//       borderRadius: BorderRadius.circular(16),
//       child: Container(
//         height: 48,
//         width: double.maxFinite,
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.kPlatinum, width: 1.5),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 12.0, left: 8.0),
//             child: TextField(
//               style: const TextStyle(color: AppColors.kBlack),
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: hint,
//                   hintStyle: const TextStyle(color: TextColors.kOnBoardText)),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/cars/domain/entities/car.dart';
import 'package:infi_wheel/features/cars/domain/usecases/add_car_usecase.dart';
import 'package:infi_wheel/features/cars/data/services/car_service.dart';
import 'package:infi_wheel/features/cars/data/repositories/car_repository_impl.dart';
import 'package:infi_wheel/features/cars/presentation/blocs/add_car/add_car_bloc.dart';
import 'package:infi_wheel/shared/widgets/toast.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final TextEditingController photoUrlController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController subtypeController = TextEditingController();
  final TextEditingController yearOfProductionController = TextEditingController();
  final TextEditingController vinNumberController = TextEditingController();
  final TextEditingController engineCapacityController = TextEditingController();
  final TextEditingController powerController = TextEditingController();
  final TextEditingController fuelTypeController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();
  final TextEditingController numberOfDoorsController = TextEditingController();
  final TextEditingController numberOfSeatsController = TextEditingController();
  final TextEditingController registrationPlateController = TextEditingController();
  final TextEditingController registrationNumberController = TextEditingController();
  final TextEditingController acController = TextEditingController();
  final TextEditingController xLocationController = TextEditingController();
  final TextEditingController yLocationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddCarBloc(
        addCarUseCase: AddCarUseCase(
          CarRepositoryImpl(
            CarService(),
          ),
        ),
      ),
      child: Scaffold(
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
                infoInputField('Photo URL', photoUrlController),
                infoInputField('Brand', brandController),
                infoInputField('Model', modelController),
                infoInputField('Type', typeController),
                infoInputField('Subtype', subtypeController),
                infoInputField('Year of production', yearOfProductionController),
                infoInputField('VIN number', vinNumberController),
                infoInputField('Engine capacity', engineCapacityController),
                infoInputField('Power', powerController),
                infoInputField('Fuel type', fuelTypeController),
                infoInputField('Transmission', transmissionController),
                infoInputField('Number of doors', numberOfDoorsController),
                infoInputField('Number of seats', numberOfSeatsController),
                infoInputField('Registration plate', registrationPlateController),
                infoInputField('Registration number', registrationNumberController),
                infoInputField('AC', acController),
                infoInputField('X Location', xLocationController),
                infoInputField('Y Location', yLocationController),
                infoInputField('Price', priceController),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.15,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: SizedBox(
            width: double.maxFinite,
            child: BlocConsumer<AddCarBloc, AddCarState>(
              listener: (context, state) {
                if (state is AddCarSuccess) {
                  GoRouter.of(context).go('/mycars'); // Navigate back or to the desired route
                } else if (state is AddCarFailure) {
                  toastInfo(message: 'Fail');
                }
              },
              builder: (context, state) {
                if (state is AddCarLoading) {
                  return FloatingActionButton(
                    elevation: 2,
                    backgroundColor: AppColors.kOxfordBlue,
                    onPressed: null, // Disable button during loading
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }

                return FloatingActionButton(
                  elevation: 2,
                  backgroundColor: AppColors.kOxfordBlue,
                  onPressed: () {
                    _addCar(context);
                  },
                  child: Text('Done!', style: TextStyle(fontSize: 16)),
                );
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget infoInputField(String hint, TextEditingController controller) {
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
                controller: controller,
                style: const TextStyle(color: AppColors.kBlack),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: const TextStyle(color: TextColors.kOnBoardText)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addCar(BuildContext context) {
    final car = Car(
      id: 0, // Assuming you will handle ID generation on the server
      manufacturer: brandController.text,
      model: modelController.text,
      type: typeController.text,
      subtype: subtypeController.text,
      yearOfProduction: yearOfProductionController.text,
      vinNumber: vinNumberController.text,
      engineCapacity: int.tryParse(engineCapacityController.text) ?? 0,
      power: int.tryParse(powerController.text) ?? 0,
      fuelType: fuelTypeController.text,
      transmission: transmissionController.text,
      numberOfDoors: int.tryParse(numberOfDoorsController.text) ?? 0,
      numberOfSeats: int.tryParse(numberOfSeatsController.text) ?? 0,
      registrationPlate: registrationPlateController.text,
      registrationNumber: registrationNumberController.text,
      ac: acController.text,
      url: photoUrlController.text,
      xLocation: double.tryParse(xLocationController.text) ?? 0.0,
      yLocation: double.tryParse(yLocationController.text) ?? 0.0,
      price: double.tryParse(priceController.text) ?? 0.0,
    );

    context.read<AddCarBloc>().add(AddCar(car));
  }

  @override
  void dispose() {
    photoUrlController.dispose();
    brandController.dispose();
    modelController.dispose();
    typeController.dispose();
    subtypeController.dispose();
    yearOfProductionController.dispose();
    vinNumberController.dispose();
    engineCapacityController.dispose();
    powerController.dispose();
    fuelTypeController.dispose();
    transmissionController.dispose();
    numberOfDoorsController.dispose();
    numberOfSeatsController.dispose();
    registrationPlateController.dispose();
    registrationNumberController.dispose();
    acController.dispose();
    xLocationController.dispose();
    yLocationController.dispose();
    super.dispose();
  }
}
