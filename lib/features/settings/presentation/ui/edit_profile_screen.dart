import 'package:architecture_pattern/features/settings/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          name = name ?? state.profile.name;
          email = email ?? state.profile.email;

          return Scaffold(
            appBar: AppBar(title: Text("Edit Profile")),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: name,
                      decoration: InputDecoration(labelText: "Name"),
                      onChanged: (val) => name = val,
                    ),
                    TextFormField(
                      initialValue: email,
                      decoration: InputDecoration(labelText: "Email"),
                      onChanged: (val) => email = val,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text("Save"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final updated = state.profile.copyWith(
                            name: name,
                            email: email,
                          );
                          context.read<ProfileBloc>().add(UpdateProfile(updated));
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}