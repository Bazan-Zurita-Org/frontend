import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/auth/presentation/pages/auth_page.dart';
import 'package:app_gym/features/auth/presentation/pages/profile_user_page.dart';
import 'package:app_gym/features/auth/presentation/pages/register_step_1.dart';
import 'package:app_gym/features/auth/presentation/pages/register_step_2.dart';
import 'package:go_router/go_router.dart';

class AuthRoutes {
  static GoRoute authRoutes = GoRoute(
    path: Routes.auth,
    pageBuilder: (context, state) => Routes.materialPage(
      state.pageKey,
      const AuthPage(),
    ),
    routes: [
      GoRoute(
        path: Routes.register,
        name: Routes.register,
        pageBuilder: (context, state) => Routes.materialPage(
          state.pageKey,
          const RegisterStep1(),
        ),
      ),
      GoRoute(
        path: Routes.register2,
        name: Routes.register2,
        pageBuilder: (context, state) => Routes.materialPage(
          state.pageKey,
          const RegisterStep2(),
        ),
      ),
      GoRoute(
        path: Routes.profile,
        name: Routes.profile,
        pageBuilder: (context, state) => Routes.materialPage(
          state.pageKey,
          const ProfileUserPage(),
        ),
      )
    ],
  );
}
