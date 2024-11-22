import 'package:app_gym/core/helper/app_constants.dart';
import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class ItemRutina extends StatelessWidget {
  final RutinaEntity rutinaEntity;
  const ItemRutina({
    super.key,
    required this.rutinaEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.exercise,
            extra: (rutinaEntity.name, rutinaEntity.exercises));
      },
      child: Stack(
        children: [
          Container(
            height: 130.h,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: EdgeInsets.only(top: 15.h),
                        child: Text(
                          rutinaEntity.name ?? "",
                          style: robotoMedium().copyWith(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: Text(
                          rutinaEntity.goal ?? "",
                          maxLines: 2,
                          style: robotoMedium()
                              .copyWith(fontSize: 14.sp, color: Colors.grey),
                        ),
                      ),
                      Container(
                        // width: 300,
                        height: 17.h,
                        decoration: BoxDecoration(
                          color: HexColor("#CDECFF"),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 5,
                          height: 17.h,
                          decoration: BoxDecoration(
                            color: HexColor("#3899DE"),
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "45%",
                            style: robotoRegular(
                              color: Colors.white,
                              fontSize: 8.sp,
                            ),
                          ),
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
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
                color: Colors.black,
              ),
              child: Text(
                switch (rutinaEntity.difficultyLevel) {
                  1 => "Beginner",
                  2 => "Intermediate",
                  3 => "Advanced",
                  _ => "",
                },
                style: robotoMedium(color: Colors.white, fontSize: 13.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
