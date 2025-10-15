import 'package:architecture_pattern/features/settings/data/models/user_profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileEvent {}
class LoadProfile extends ProfileEvent {}
class UpdateProfile extends ProfileEvent {
  final UserProfile profile;
  UpdateProfile(this.profile);
}
class UploadProfileImage extends ProfileEvent {
  final String imageUrl;
  UploadProfileImage(this.imageUrl);
}

abstract class ProfileState {}
class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileLoaded extends ProfileState {
  final UserProfile profile;
  ProfileLoaded(this.profile);
}
class ProfileError extends ProfileState {}

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      await Future.delayed(const Duration(seconds: 1)); // Dummy API call
      emit(ProfileLoaded(UserProfile(name: "John Doe", email: "john@example.com", profileImageUrl: "")));
    });
    on<UpdateProfile>((event, emit) async {
      emit(ProfileLoading());
      await Future.delayed(const Duration(seconds: 1)); // Dummy API call
      emit(ProfileLoaded(event.profile));
    });
    on<UploadProfileImage>((event, emit) async {
      if (state is ProfileLoaded) {
        final current = (state as ProfileLoaded).profile;
        final updated = current.copyWith(profileImageUrl: event.imageUrl);
        emit(ProfileLoaded(updated));
      }
    });
  }
}