import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_cubit_state.dart';

class ProfileCubitCubit extends Cubit<ProfileCubitState> {
  ProfileCubitCubit() : super(ProfileCubitInitial());
}
