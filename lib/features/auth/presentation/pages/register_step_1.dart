import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_gym/features/auth/presentation/widgets/button_custom_auth.dart';
import 'package:app_gym/features/auth/presentation/widgets/input_custom_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterStep1 extends StatefulWidget {
  const RegisterStep1({super.key});

  @override
  State<RegisterStep1> createState() => _RegisterStep1State();
}

class _RegisterStep1State extends State<RegisterStep1> {
  @override
  Widget build(BuildContext context) {
    final authbloc = context.read<AuthBloc>();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Form(
            key: authbloc.registerkeyform,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 80, bottom: 20),
                  child: FlutterLogo(
                    size: 120,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputCustomAuth(
                        controller: authbloc.name,
                        label: 'Name',
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InputCustomAuth(
                        controller: authbloc.lastname,
                        label: 'LastName',
                      ),
                    ),
                  ],
                ),
                InputCustomAuth(
                  controller: authbloc.phone,
                  label: 'Phone',
                  keyboardType: TextInputType.phone,
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
                    context.pushNamed(Routes.register2);
                  },
                  label: "Next",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
