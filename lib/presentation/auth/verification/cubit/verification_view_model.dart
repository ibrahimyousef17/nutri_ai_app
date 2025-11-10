import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/verification/cubit/verification_states.dart';

class VerificationViewModel extends Cubit<VerificationStates>{
  VerificationViewModel():super(VerificationInitialState());
  TextEditingController pinController = TextEditingController();
}