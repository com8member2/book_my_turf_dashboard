import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Constants{
  static SupabaseClient supabase = Supabase.instance.client;
  static List<String> workoutLevels = ["Beginner", "Intermediate", "Advanced"];
}


class SupaTables {

  static String user_profile = 'user_profile';
  static String venue_list = 'venue_list';
  static String turf_list = 'turf_list';
  static String owner_profile = 'owner_profile';
  static String city = 'city';
  static String convenience_fee = 'convenience_fee';
  static String owner_role = "owner_role";
}

class SupaStorage {

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
enum VenueStatus {
  rejected("REJECTED"),
  pending("PENDING"),
  inActive("INACTIVE"),
  approved("APPROVED");

  const VenueStatus(this.value);

  final String value;
}