import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';
import 'package:flutter/material.dart';
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
            height: 130,
            // margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(AppImages.test),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          rutinaEntity.name ?? "",
                          style: robotoMedium(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(
                          rutinaEntity.goal ?? "",
                          style: robotoMedium(),
                        ),
                      ),
                      Container(
                        // width: 300,
                        height: 17,
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
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
                style: robotoMedium(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
