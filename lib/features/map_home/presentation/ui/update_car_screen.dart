import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/cars/domain/entities/car.dart';
import 'package:infi_wheel/features/map_home/presentation/blocs/cars/cars_bloc.dart';
import 'package:infi_wheel/shared/widgets/toast.dart';

class UpdateCarScreen extends StatefulWidget {
  final Car car;

  const UpdateCarScreen({super.key, required this.car});

  @override
  State<UpdateCarScreen> createState() => _UpdateCarScreenState();
}

class _UpdateCarScreenState extends State<UpdateCarScreen> {
  late TextEditingController photoUrlController;
  late TextEditingController brandController;
  late TextEditingController modelController;
  late TextEditingController typeController;
  late TextEditingController subtypeController;
  late TextEditingController yearOfProductionController;
  late TextEditingController vinNumberController;
  late TextEditingController engineCapacityController;
  late TextEditingController powerController;
  late TextEditingController fuelTypeController;
  late TextEditingController transmissionController;
  late TextEditingController numberOfDoorsController;
  late TextEditingController numberOfSeatsController;
  late TextEditingController registrationPlateController;
  late TextEditingController registrationNumberController;
  late TextEditingController acController;
  late TextEditingController xLocationController;
  late TextEditingController yLocationController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    photoUrlController = TextEditingController(text: widget.car.url);
    brandController = TextEditingController(text: widget.car.manufacturer);
    modelController = TextEditingController(text: widget.car.model);
    typeController = TextEditingController(text: widget.car.type);
    subtypeController = TextEditingController(text: widget.car.subtype);
    yearOfProductionController = TextEditingController(text: widget.car.yearOfProduction);
    vinNumberController = TextEditingController(text: widget.car.vinNumber);
    engineCapacityController = TextEditingController(text: widget.car.engineCapacity.toString());
    powerController = TextEditingController(text: widget.car.power.toString());
    fuelTypeController = TextEditingController(text: widget.car.fuelType);
    transmissionController = TextEditingController(text: widget.car.transmission);
    numberOfDoorsController = TextEditingController(text: widget.car.numberOfDoors.toString());
    numberOfSeatsController = TextEditingController(text: widget.car.numberOfSeats.toString());
    registrationPlateController = TextEditingController(text: widget.car.registrationPlate);
    registrationNumberController = TextEditingController(text: widget.car.registrationNumber);
    acController = TextEditingController(text: widget.car.ac);
    xLocationController = TextEditingController(text: widget.car.xLocation.toString());
    yLocationController = TextEditingController(text: widget.car.yLocation.toString());
    priceController = TextEditingController(text: widget.car.price.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CarsBloc>(context), // Use the existing CarsBloc instance
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => GoRouter.of(context).go("/admincars"),
            icon: Icon(
              CupertinoIcons.chevron_back,
              color: AppColors.kOxfordBlue,
            ),
          ),
          title: Text(
            "Update car",
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
            child: BlocConsumer<CarsBloc, CarsState>(
              listener: (context, state) {
                if (state is CarsLoaded) {
                  GoRouter.of(context).go('/admincars'); 
                } else if (state is CarsError) {
                  toastInfo(message: 'Failed to update car');
                }
              },
              builder: (context, state) {
                if (state is CarUpdating) {
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
                    _updateCar(context);
                  },
                  child: Text('Update', style: TextStyle(fontSize: 16)),
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

  void _updateCar(BuildContext context) {
    final updatedCar = Car(
      id: widget.car.id, // Keep the original ID for the update
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

    context.read<CarsBloc>().add(UpdateCarEvent(updatedCar));
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
    priceController.dispose();
    super.dispose();
  }
}
