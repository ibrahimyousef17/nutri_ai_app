import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/favorite/cubit/favorite_states.dart';

class FavoriteViewModel extends Cubit<FavoriteStates> {
  FavoriteViewModel() : super(FavoriteInitialState());
  List favoriteList = [];
}
