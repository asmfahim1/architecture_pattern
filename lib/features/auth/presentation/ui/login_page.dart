import 'package:architecture_pattern/core/utils/app_localization.dart';
import 'package:architecture_pattern/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:architecture_pattern/features/auth/presentation/bloc/auth_event.dart';
import 'package:architecture_pattern/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  void _login() {
    context.read<AuthBloc>().add(LoginRequested(email: _email.text.trim(), password: _password.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(t.get('login'))),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (ctx, state) {
          if (state is AuthAuthenticated) {
            Navigator.of(context).pushReplacementNamed('/dashboard');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(controller: _email, decoration: InputDecoration(labelText: t.get('email'))),
              TextField(controller: _password, decoration: InputDecoration(labelText: t.get('password')), obscureText: true),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _login, child: Text(t.get('login'))),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (ctx, state) {
                  if (state is AuthLoading) return const CircularProgressIndicator();
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

