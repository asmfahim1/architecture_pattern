import 'package:architecture_pattern/features/settings/presentation/bloc/logout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Logged out!")));
        }
      },
      builder: (context, state) {
        return ElevatedButton.icon(
          icon: const Icon(Icons.logout),
          label: const Text("Logout"),
          onPressed: state is LogoutLoading
              ? null
              : () => context.read<LogoutBloc>().add(PerformLogout()),
        );
      },
    );
  }
}