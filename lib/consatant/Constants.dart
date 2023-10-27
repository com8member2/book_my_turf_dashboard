import 'package:supabase/supabase.dart';

class Constants{
  static String supabaseUrl = "https://vknomtfmqlwordnhnsjm.supabase.co";

  static SupabaseClient supabase = SupabaseClient(
    supabaseUrl,
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrbm9tdGZtcWx3b3Jkbmhuc2ptIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk3NzEyNjUsImV4cCI6MjAwNTM0NzI2NX0.0S3Ct4aWX7ZuNU_KLIgOMmeSYzbNeNF1gfsXf1mNsVM",
    authFlowType: AuthFlowType.pkce
  );
}


class SupaTables {

  static String user_profile = 'user_profile';
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
