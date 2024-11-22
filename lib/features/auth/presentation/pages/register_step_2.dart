import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/core/routes/auth/auth_routes.dart';
import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_gym/features/auth/presentation/widgets/button_custom_auth.dart';
import 'package:app_gym/features/auth/presentation/widgets/input_custom_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterStep2 extends StatefulWidget {
  const RegisterStep2({super.key});

  @override
  State<RegisterStep2> createState() => _RegisterStep2State();
}

class _RegisterStep2State extends State<RegisterStep2> {
  final menuitems = [
    "Aumentar masa muscular",
    "Bajar nivel de grasa",
    "Mejorar la resistencia física"
  ];
  final menuitemsgenre = [
    "male",
    "female",
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authbloc = context.read<AuthBloc>();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.registerStatus == RegisterStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Container(
                  child: const Column(
                    children: [
                      Text("Exito"),
                      Text("Se creo su cuenta satisfactoriamente"),
                    ],
                  ),
                ),
              ),
            );
          context.go(Routes.auth);
        }
        if (state.registerStatus == RegisterStatus.failed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Container(
                  child: const Column(
                    children: [
                      Text("Error"),
                      Text("No se pudo Registrar"),
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
            color: HexColor("#384046"),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: authbloc.register2keyform,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logo),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
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
                                controller: authbloc.height,
                                label: 'Altura',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: InputCustomAuth(
                                controller: authbloc.weight,
                                label: 'Peso',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            value: authbloc.genre.text.isEmpty
                                ? null
                                : authbloc.genre.text,
                            hint: const Text("Genero"),
                            underline: const SizedBox.shrink(),
                            alignment: Alignment.center,
                            items: menuitemsgenre
                                .map(
                                  (value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                authbloc.genre.text = value ?? "";
                              });
                            },
                            borderRadius: BorderRadius.circular(20),
                            isExpanded: true,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                        InputCustomAuth(
                          controller: authbloc.birthdate,
                          label: 'Fecha de Nacimiento',
                          readOnly: true,
                          onTap: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (selectedDate != null) {
                              final formattedDate =
                                  "${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}";

                              authbloc.birthdate.text = formattedDate;
                            }
                          },
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            value: authbloc.physicalobjective.text.isEmpty
                                ? null
                                : authbloc.physicalobjective.text,
                            hint: const Text("Objetivo Fisico"),
                            underline: const SizedBox.shrink(),
                            alignment: Alignment.center,
                            items: menuitems
                                .map(
                                  (value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                authbloc.physicalobjective.text = value ?? "";
                              });
                            },
                            borderRadius: BorderRadius.circular(20),
                            isExpanded: true,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                        InputCustomAuth(
                          controller: authbloc.targetweight,
                          label: 'Peso Objetivo',
                        ),
                        ButtonCustomAuth(
                          onPressed: () {
                            authbloc.add(AuthEvent.onRegisterWithEmail());
                          },
                          label: "Register",
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
      ),
    );
  }
}
