class AppConstants {
  static const appName = "App Gym";
  static const token = "app_token";
  static const id = "app_id";
  static const authstatus = "app_authstatus";

  //urls
  static const baseUrl =
      "https://e418-2800-200-e380-1ec1-dd16-645e-ad73-99ae.ngrok-free.app/";
  static const login = "api/login";
  static const register = "api/trainees";
  static String userforId(String id) => "api/trainees/$id";
  static String routineforUse(String id) => "api/trainees/$id/routine";
  static const assignChallengeToUse = "api/challenges/assign";
  static const rankings = "api/challenges/rankings";
  static String challengesforUser(String id) => "api/trainees/$id/challenges";
  static const assignDuelsToUser = "api/duels/";
}
