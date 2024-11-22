import 'dart:ui';

import 'package:hexcolor/hexcolor.dart';

class AppConstants {
  static const appName = "App Gym";
  static const token = "app_token";
  static const id = "app_id";
  static const authstatus = "app_authstatus";

  //urls
  static const baseUrl =
      "https://dada-2800-200-e380-1ec1-45db-37a8-356-bf0.ngrok-free.app/";
  static const login = "api/login";
  static const register = "api/trainees";
  static String userforId(String id) => "api/trainees/$id";
  static String routineforUse(String id) => "api/trainees/$id/routine";
  static const assignChallengeToUse = "api/challenges/assign";
  static const challengesComplete = "api/challenges/complete";
  static const rankings = "api/rankings";
  static String challengesforUser(String id) => "api/trainees/$id/challenges";
  static String dietForId(String id) => "api/trainees/$id/diets";

  static const assignDuelsToUser = "api/duels/";
  static const duelsaccept = "api/duels/accept";
  static String getDuelsPropuest(String id) => "api/trainees/$id/duels";
  static Color primaryColor = HexColor("#267157");
  static Color primaryLightColor = HexColor("#6AB29C");
  static Color surfaceColor = HexColor("#F2C84C");
}
