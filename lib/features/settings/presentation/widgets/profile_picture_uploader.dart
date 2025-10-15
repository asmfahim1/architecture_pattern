import 'package:architecture_pattern/features/settings/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePictureUploader extends StatelessWidget {
  final String imageUrl;
  const ProfilePictureUploader({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: imageUrl.isNotEmpty
              ? NetworkImage(imageUrl)
              : const AssetImage('assets/default_avatar.png') as ImageProvider,
          child: imageUrl.isEmpty ? const Icon(Icons.person, size: 40) : null,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () async {
              final picker = ImagePicker();
              final picked = await picker.pickImage(source: ImageSource.gallery);
              if (picked != null) {
                // Dummy: Simulate upload, get URL
                final dummyUrl = "https://dummyimage.com/100x100/000/fff"; // Replace with real upload logic
                context.read<ProfileBloc>().add(UploadProfileImage(dummyUrl));
              }
            },
          ),
        ),
      ],
    );
  }
}