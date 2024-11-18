class AppConstants {
  static const appName = "App Gym";
  static const token = "app_token";
  static const id = "app_id";
  static const authstatus = "app_authstatus";

  //urls
  static const baseUrl =
      "https://3e72-2800-200-e380-1ec1-d005-4e28-7253-f130.ngrok-free.app/";
  static const login = "api/login";
  static const register = "api/trainees";
  static String userforId(String id) => "api/trainees/$id";
  static String routineforUse(String id) => "api/trainees/$id/routine";
  static const assignChallengeToUse = "api/challenges/assign";
  static const challengesComplete = "api/challenges/complete";
  static const rankings = "api/rankings";
  static String challengesforUser(String id) => "api/trainees/$id/challenges";
  static const assignDuelsToUser = "api/duels/";
  static const duelsaccept = "api/duels/accept";
  static String getDuelsPropuest(String id) => "api/trainees/$id/duels";
}
