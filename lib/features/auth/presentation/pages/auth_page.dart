import 'package:app_gym/core/routes/bloc/routes_bloc.dart';
import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_gym/features/auth/presentation/widgets/button_custom_auth.dart';
import 'package:app_gym/features/auth/presentation/widgets/input_custom_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final authbloc = context.read<AuthBloc>();
    final routebloc = context.read<RoutesBloc>();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.loginStatus == LoginStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Container(
                  child: const Column(
                    children: [
                      Text("Exito"),
                      Text("Inicio Session Existosamente"),
                    ],
                  ),
                ),
              ),
            );
          routebloc.add(RoutesEvent.onGetAuthStatus());
        }
        if (state.loginStatus == LoginStatus.failed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Container(
                  child: Column(
                    children: [
                      Text("No funciono"),
                      Text("intentalo de nuevo"),
                    ],
                  ),
                ),
              ),
            );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(),
          child: Form(
            key: authbloc.loginkeyform,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20, top: 50),
                  child: FlutterLogo(
                    size: 120,
                  ),
                ),
                InputCustomAuth(
                  controller: authbloc.email,
                  label: 'Email',
                ),
                InputCustomAuth(
                  controller: authbloc.password,
                  ispassword: true,
                  label: 'Password',
                ),
                ButtonCustomAuth(
                  onPressed: () {
                    // if (authbloc.keyform.currentState!.validate()) {

                    // }
                    authbloc.add(AuthEvent.onLoginWithEmail());
                  },
                  label: "Login",
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.goNamed(Routes.register);
                  },
                  child: Text("Not Registe yet?, Register here"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
