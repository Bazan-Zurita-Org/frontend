import 'package:app_gym/core/helper/app_constants.dart';
import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/features/home/domain/entities/duels_entity.dart';
import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:app_gym/features/shared/widgets/dialog/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class DuelsPage extends StatefulWidget {
  const DuelsPage({super.key});

  @override
  State<DuelsPage> createState() => _DuelsPageState();
}

class _DuelsPageState extends State<DuelsPage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeEvent.onGetListDuels());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.listduels!.isEmpty) {
                    return Center(
                      child: Text(
                        "No se Encontraron duelos",
                        style: robotoBold(fontSize: 24, color: Colors.white),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.listduels?.length,
                    itemBuilder: (context, index) {
                      final data = state.listduels![index];
                      return ItemDuels(data: data);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDuels extends StatelessWidget {
  final DuelsEntity data;
  const ItemDuels({super.key, required this.data});

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    final homebloc = context.read<HomeBloc>();
    print('SB - data: $data');
    print('SB - id: ${data.duelId}');
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: AppConstants.primaryColor,
                      width: 1,
                    ),
                  ),
                  margin: EdgeInsets.only(right: 10.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    child: Image.asset(
                      AppImages.test3,
                      width: 100.h,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.w),
                        child: Text(
                          data.challengerName ?? "",
                          style: robotoMedium(fontSize: 16.sp),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: Text(
                          data.challengeText ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style:
                              robotoMedium(fontSize: 16.sp, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Fecha de inicio: ${_formatDate(data.startDate!)}",
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Fecha final: ${_formatDate(data.endDate!)}",
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Container(
                        height: 17.h,
                        decoration: BoxDecoration(
                          color: HexColor("#CDECFF"),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 5,
                          height: 17,
                          decoration: BoxDecoration(
                            color: HexColor("#3899DE"),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "45%",
                            style: robotoRegular(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  print('SB - data.duelId: ${data.duelId}');
                                  homebloc.add(
                                    HomeEvent.onChallengesComplet(
                                      id: data.duelId ?? "",
                                    ),
                                  );
                                  SuccessDialog(
                                          title: 'Éxito',
                                          description: 'Duelo aceptado')
                                      .show(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.5.h, horizontal: 15.w)),
                                child: Text(
                                  "Aceptar",
                                  style: robotoMedium(
                                      fontSize: 13.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.5.h, horizontal: 20.w)
                                    // minimumSize: const Size(100, 40),
                                    ),
                                child: Text(
                                  "Rechazar",
                                  style: robotoMedium(
                                      fontSize: 13.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
                // const Padding(
                //   padding: EdgeInsets.only(bottom: 20, left: 10),
                //   child: Text("Lunes"),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     context.pushNamed(Routes.exercise,
                //         extra: (rutinaEntity.name, rutinaEntity.exercises));
                //   },
                //   child: Container(
                //     padding: const EdgeInsets.all(20),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: Colors.grey,
                //     ),
                //     child: Column(
                //       children: [
                //         Padding(
                //           padding: EdgeInsets.only(bottom: 20),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(rutinaEntity.name ?? ""),
                //               Text(
                //                 rutinaEntity.difficultyLevel != null
                //                     ? rutinaEntity.difficultyLevel.toString()
                //                     : "",
                //               ),
                //             ],
                //           ),
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(rutinaEntity.goal ?? ""),
                //             Text(
                //               rutinaEntity.isCompleted != null &&
                //                       rutinaEntity.isCompleted!
                //                   ? "Completado"
                //                   : "Pendiente",
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
                color: Colors.black,
              ),
              child: Text(
                "Puntos a Ganar ",
                style: robotoMedium(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
