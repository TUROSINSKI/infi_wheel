import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';
import 'package:infi_wheel/features/authentication/presentation/blocs/get_users/get_users_bloc.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  void initState() {
    super.initState();
    context.read<GetUsersBloc>().add(GetUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () => GoRouter.of(context).go("/"),
            icon: Icon(
              Icons.logout,
              color: Colors.redAccent,
            ),
          ),
          title: Text(
            "Admin dashboard",
            style: TextStyle(color: AppColors.kOxfordBlue),
          ),
        ),
        body: BlocBuilder<GetUsersBloc, GetUsersState>(
        builder: (context, state) {
          if (state is GetUsersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetUsersSuccess) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.kPlatinum, width: 1.0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      title: Text(user.username.toString(), style: TextStyle(color: AppColors.kOxfordBlue, fontWeight: FontWeight.bold),),
                      subtitle: Text(user.userId.toString(), style: TextStyle(color: AppColors.kOxfordBlue),),
                      trailing: Container(
                        width: 72,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Icon(Icons.delete)),
                    ),
                  ),
                );
              },
            );
          } else if (state is GetUsersFailure) {
            return Center(child: Text('Failed to load users: ${state.error}'));
          } else {
            return const Center(child: Text('No users available.'));
          }
        },
      ),
    );
  }
}