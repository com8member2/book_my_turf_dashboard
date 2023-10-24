import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Constants {
  static String supabaseUrl = "https://oxdzwjjnphwpmmcsvzqc.supabase.co";
  static SupabaseClient supabase = Supabase.instance.client;
  static String redirectUrl = 'http://localhost:8888/#/Login';
  // static String redirectUrl = 'https://admin.lifestenhealth.com/#/Login';
  static List<String> workoutLevels = ["Beginner", "Intermediate", "Advanced"];
  static List<String> redeemedRewardsStatus = ["pending", "expired", "redeemed"];
  static List<String> pointsDuration = ["Last Week", "Last Month", "Last Year", "All"];

  static FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
}

enum PointsType {
  physicalWorkout("workout"),
  mentalHealth("mentalHealth"),
  articles("articles"),
  other("other");

  const PointsType(this.value);

  final String value;
}

class SupaTables {
  static String userProfile = "user_profile";
  static String adminProfiles = "admin_users";
  static String booking = "booking";
  static String posts = "post";
  static String likes = "likes";
  static String comments = "comment";
  static String points = "points";
  static String consultationCategory = "consultation_category";
  static String consultationSubCategory = "consultation_sub_categories";
  static String userExperience = "consultant_experience";
  static String consultantAvailability = "consultant_availability";
  static String consultantAvailabilityOverride = "consultant_availability_overridden";
  static String mentalHealthTest = "mental_health_test";
  static String bloodPressure = "blood_pressure_test";
  static String bloodSugar = "blood_sugar_test";
  static String bmiCalculate = "bmi_test";
  static String community = "community";
  static String communityMembers = "community_members";
  static String communityChat = "community_messages";
  static String journal = "journal";
  static String workout_trainer = "workout_trainer";
  static String workout_routine = "workout_routine";
  static String workout_videos = "workout_videos";
  static String partners = "partners";
  static String partnersRewards = "partners_rewards";
  static String partnersRewardsStatus = "partner_reward_status";
  static String nutritionCategory = "nutrition_category";
  static String nutritionArticles = "nutrition_articles";
  static String nutritionVideos = "nutrition_videos";
  static String nutrition_provider = "personalised_nutrition_for_ you";
  static String mental_health_provider = "mental_health_nutritionists";
  static String meditation_articles = "meditation_articles";
  static String meditation_category = "meditation_category";
  static String meditation_videos = "meditation_videos";
  static String notification = "notifications";
  static String workplace = "workplace";
  static String mental_health_provider_view_count = "mental_health_provider_view_count";
  static String automated_test_result = "automated_test_result";
  static String nutrition_provider_view_count = "nutrition_provider_view_count";
}

class SupaStorage {
  static String nutrition = 'nutrition_articles';
  static String meditation = 'meditation_articles';
  static String workout = 'workout_programmes';
  static String workout_trainer = 'workout_trainer';
  static String mental_health_provider = 'mental_health_provider';
  static String nutrition_health_provider = 'nutrition_health_provider';
  static String partners = 'partners';
  static String reward = 'reward';
  static String workplace = 'workplace';
}

class PrefKeys{
  static String isDarkTheme = 'isDarkTheme';
}

enum AdminRole {
  superAdmin("SuperAdmin"),
  partner("partner"),
  workplace("Workplace");

  const AdminRole(this.value);

  final String value;
}
