import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/core/routes/bloc/routes_bloc.dart';
import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_gym/features/shared/widgets/dialog/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({super.key});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  @override
  void initState() {
    context.read<AuthBloc>().add(AuthEvent.onGetSaveUserData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authbloc = context.read<AuthBloc>();
    final routebloc = context.read<RoutesBloc>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: HexColor('#F7F5F3'),
        ),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: state.userEntity?.firstName ?? '',
                          style: robotoMedium(fontSize: 19.sp),
                        ),
                        const TextSpan(text: " "),
                        TextSpan(
                          text: state.userEntity?.lastName ?? '',
                          style: robotoMedium(fontSize: 19.sp),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: const AssetImage(AppImages.user),
                          radius: 50.r,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Puntos: ${state.userEntity?.points.toString() ?? '0'}",
                    style: robotoMedium(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color.fromARGB(255, 236, 196, 255),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: const Icon(
                              Icons.settings,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Profile Settings",
                            style: robotoMedium(
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(vertical: 20),
                  //   decoration: const BoxDecoration(
                  //     border: Border(
                  //       top: BorderSide(
                  //         color: Color.fromARGB(255, 236, 196, 255),
                  //       ),
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 20),
                  //     child: Row(
                  //       children: [
                  //         const Padding(
                  //           padding: EdgeInsets.only(right: 10),
                  //           child: Icon(
                  //             Icons.monetization_on_outlined,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //         Text(
                  //           "Manager Subscription",
                  //           style: robotoMedium(
                  //             fontSize: 18,
                  //             color: Colors.black,
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  GestureDetector(
                    onTap: () {
                      LogoutDialog(
                        onAcceptButton: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          routebloc.add(RoutesEvent.onLogout());
                          authbloc.add(AuthEvent.onLogout());

                          context.go(Routes.auth);
                        },
                      ).show(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color.fromARGB(255, 236, 196, 255),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Log Out",
                              style: robotoMedium(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color.fromARGB(255, 236, 196, 255),
                        ),
                        bottom: BorderSide(
                          color: Color.fromARGB(255, 236, 196, 255),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            "Remove Account",
                            style: robotoMedium(
                              fontSize: 16.sp,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
