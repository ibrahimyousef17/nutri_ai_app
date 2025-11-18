import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/notifications_settings/cubit/notification_settings_state.dart';

class NotificationSettingsViewModel extends Cubit<NotificationSettingsStates> {
  NotificationSettingsViewModel() : super(NotificationSettingsInitialState());

  bool mealReminders = false;

  bool progressSummary = false;

  bool goalMileStoneNotifications = false;

  bool newPlanRecommendations = false;
}
