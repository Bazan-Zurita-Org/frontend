import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/core/routes/bloc/routes_bloc.dart';
import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_gym/features/auth/presentation/widgets/button_custom_auth.dart';
import 'package:app_gym/features/auth/presentation/widgets/input_custom_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

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
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                HexColor("#65AED8"),
                HexColor("#8897DA"),
                HexColor("#8F88E9"),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(child: Image.asset(AppImages.logo)),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Form(
                    key: authbloc.loginkeyform,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Login",
                          style: robotoMedium(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
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
                          color: Colors.blue,
                          onPressed: () {
                            // if (authbloc.keyform.currentState!.validate()) {

                            // }
                            authbloc.add(AuthEvent.onLoginWithEmail());
                          },
                          label: "Login",
                        ),
                        GestureDetector(
                          onTap: () {
                            context.goNamed(Routes.register);
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "Dont Have an account?, "),
                                TextSpan(
                                  text: "Sign-up",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.goNamed(Routes.register);
                                    },
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
