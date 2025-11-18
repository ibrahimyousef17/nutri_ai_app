import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/profile/cubit/profile_states.dart';

class ProfileViewModel extends Cubit<ProfileStates> {
  ProfileViewModel() : super(ProfileInitialState());
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String dob = '';

  String gender = '';
  String height = '';
  String weight = '';
}
