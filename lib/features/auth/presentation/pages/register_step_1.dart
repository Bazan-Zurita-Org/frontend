import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_gym/features/auth/presentation/widgets/button_custom_auth.dart';
import 'package:app_gym/features/auth/presentation/widgets/input_custom_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

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
          child: Form(
            key: authbloc.registerkeyform,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.logo),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Sign Up",
                        style: robotoMedium(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
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
                        color: Colors.blue,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
