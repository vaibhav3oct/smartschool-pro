import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/data/models/app_user.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/school_admin/presentation/screens/school_admin_dashboard.dart';
import '../../features/super_admin/presentation/screens/super_admin_dashboard.dart';

class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const superAdminDashboard = '/super-admin';
  static const schoolAdminDashboard = '/school-admin';
}

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: AppRoutes.login,
    redirect: (context, state) {
      final isAuthRoute =
          state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.register;

      final user = authState.user;

      if (user == null && !isAuthRoute) {
        return AppRoutes.login;
      }

      if (user != null && isAuthRoute) {
        switch (user.role) {
          case AppUserRole.superAdmin:
            return AppRoutes.superAdminDashboard;
          case AppUserRole.schoolAdmin:
          case AppUserRole.principal:
            return AppRoutes.schoolAdminDashboard;
          default:
            return AppRoutes.login;
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.superAdminDashboard,
        name: 'super-admin-dashboard',
        builder: (context, state) => const SuperAdminDashboard(),
      ),
      GoRoute(
        path: AppRoutes.schoolAdminDashboard,
        name: 'school-admin-dashboard',
        builder: (context, state) => const SchoolAdminDashboard(),
      ),
    ],
  );
});
