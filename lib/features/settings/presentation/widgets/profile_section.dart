import 'package:architecture_pattern/features/settings/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_picture_uploader.dart';

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileLoaded) {
          final profile = state.profile;
          return Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ProfilePictureUploader(imageUrl: profile.profileImageUrl),
                  const SizedBox(height: 8),
                  Text(profile.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(profile.email, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit Profile"),
                    onPressed: () {
                      // Navigate to edit profile screen
                      Navigator.pushNamed(context, '/edit_profile');
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}