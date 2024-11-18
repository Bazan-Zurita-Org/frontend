import 'dart:ui';

import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class ExersizePage extends StatefulWidget {
  final String nameRutine;
  final List<ExerciseEntity> exerciseEntity;
  const ExersizePage(
      {super.key, required this.exerciseEntity, required this.nameRutine});

  @override
  State<ExersizePage> createState() => _ExersizePageState();
}

class _ExersizePageState extends State<ExersizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#192126"),
      appBar: AppBar(
        backgroundColor: HexColor("#192126"),
        title: Text(
          "Workout",
          style: robotoMedium(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            decoration: const BoxDecoration(),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: ItemBurnCustom(),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 17),
                          child: Text(
                            widget.nameRutine,
                            style: robotoBold(
                              fontWeight: FontWeight.w800,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "The lower abdomen and hips are the most difficult areas of the body to reduce when we are on a diet. Even so, in this area, especially the legs as a whole, you can reduce weight even if you don't use tools.",
                          style: robotoRegular(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverAppBar(
                  forceMaterialTransparency: true,
                  automaticallyImplyLeading: false,
                  title: Text(
                    "Rounds",
                    style: robotoBold(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  actions: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "1",
                            style: robotoMedium(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: "/${widget.exerciseEntity.length}",
                            style: robotoMedium(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SliverList.builder(
                  itemCount: widget.exerciseEntity.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ListTile(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        tileColor: HexColor("#384046"),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(AppImages.lamge),
                        ),
                        title: Text(
                          widget.exerciseEntity[index].name ?? "",
                          style: robotoMedium(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          widget.exerciseEntity[index].restTime ?? "",
                          style: robotoRegular(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: HexColor("#192126"),
                            child: Icon(
                              Icons.play_arrow,
                              size: 20,
                              color: HexColor("#3899DE"),
                            ),
                          ),
                        ),
                      ),
                    );
                    // return Container(
                    //   margin: const EdgeInsets.only(bottom: 16),
                    //   padding: const EdgeInsets.all(8),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //     color: HexColor("#384046"),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       ClipRRect(
                    //         borderRadius: BorderRadius.circular(15),
                    //         child: Image.asset(AppImages.lamge),
                    //       )
                    //     ],
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 18),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor("#3899DE"),
                  minimumSize: Size(
                    MediaQuery.sizeOf(context).width,
                    50,
                  ),
                ),
                child: Text(
                  "Lets Workout",
                  style: robotoMedium(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: HexColor("#192126"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemBurnCustom extends StatelessWidget {
  const ItemBurnCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      width: MediaQuery.sizeOf(context).width,
      height: 270,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          const ImageCustomWorkOut(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  width: 260,
                  height: 66,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 6,
                        color: HexColor("#192126").withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ItemBurn(
                        icon: Icon(
                          Icons.timer_outlined,
                          color: Colors.white,
                        ),
                        title: 'Time',
                        subtitle: '20 min',
                      ),
                      VerticalDivider(
                        indent: 10,
                        endIndent: 10,
                        color: Colors.white.withOpacity(0.25),
                      ),
                      const ItemBurn(
                        icon: Icon(
                          Icons.local_fire_department_outlined,
                          color: Colors.white,
                        ),
                        title: 'Burn',
                        subtitle: '95 kcal',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ImageCustomWorkOut extends StatelessWidget {
  const ImageCustomWorkOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(AppImages.test2),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 135,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    HexColor("#1D1D1D"),
                    HexColor("#686868").withOpacity(0),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemBurn extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  const ItemBurn({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            child: icon,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: robotoRegular(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: robotoRegular(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: HexColor("#3899DE"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

// SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(bottom: 20),
//                 child: Text(
//                   widget.nameRutine,
//                   style: robotoMedium(
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(bottom: 20),
//                 child: Text("Ejercicios"),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: widget.exerciseEntity.length,
//                   itemBuilder: (context, index) {
//                     final data = widget.exerciseEntity[index];
//                     return Container(
//                       padding: EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: const Color.fromARGB(255, 189, 189, 189),
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(data.name ?? ""),
//                               Text(data.sets != null
//                                   ? data.sets.toString()
//                                   : "0"),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(child: Text(data.instructions ?? "")),
//                               Text(
//                                 data.reps != null ? data.reps.toString() : "0",
//                               )
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(data.restTime.toString()),
//                               Text(data.equipment ?? "")
//                             ],
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
