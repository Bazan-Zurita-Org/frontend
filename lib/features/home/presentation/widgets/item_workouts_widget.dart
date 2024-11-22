import 'package:app_gym/core/helper/app_icons.dart';
import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class ItemWorkouts extends StatelessWidget {
  final int index;
  const ItemWorkouts({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.exercise);
      },
      child: Stack(
        children: [
          Container(
            width: 300.w,
            height: 177.h,
            margin: EdgeInsets.only(
              left: index == 0 ? 22 : 22,
              right: index == 19 ? 22 : 0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: const DecorationImage(
                image: AssetImage(AppImages.test2),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(15.w),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    HexColor("#353535"),
                    HexColor("#4B4B4B").withOpacity(0)
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lower Body Training",
                    maxLines: 2,
                    style: robotoMedium(
                      fontSize: 19.sp,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width / 4,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppIcons.flame),
                            Text(
                              "500 Kcal",
                              style: robotoRegular(
                                color: HexColor("#192126"),
                                fontSize: 12.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: MediaQuery.sizeOf(context).width / 4,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppIcons.time),
                            Text(
                              "50 Min",
                              style: robotoRegular(
                                color: HexColor("#192126"),
                                fontSize: 12.sp,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
