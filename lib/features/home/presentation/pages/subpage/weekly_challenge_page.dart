import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/features/auth/domain/usecases/user/get_list_user_id_use_case.dart';
import 'package:app_gym/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_gym/features/home/domain/entities/challenges_entity.dart';
import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:app_gym/injector_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class WeeklyChallengePage extends StatefulWidget {
  const WeeklyChallengePage({super.key});

  @override
  State<WeeklyChallengePage> createState() => _WeeklyChallengePageState();
}

class _WeeklyChallengePageState extends State<WeeklyChallengePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeEvent.onGetListChallenges());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: const BoxDecoration(),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text("Retos Semanales"),
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.listchallenges?.length,
                    itemBuilder: (context, index) {
                      final data = state.listchallenges![index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ItemWeekly(
                          challengesEntity: data,
                        ),
                      );
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

class ItemWeekly extends StatefulWidget {
  final ChallengesEntity challengesEntity;
  const ItemWeekly({super.key, required this.challengesEntity});

  @override
  State<ItemWeekly> createState() => _ItemWeeklyState();
}

class _ItemWeeklyState extends State<ItemWeekly> {
  final oponnentsID = <dynamic>[];
  final isselect = {};
  String challengeName = "";

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }

  @override
  void initState() {
    if (widget.challengesEntity.type == 2) {
      chargetOpponentsIds();
    }
    super.initState();
  }

  void chargetOpponentsIds() async {
    final data = await sl<GetListUserIdUseCase>().call();
    debugPrint("la data es $data");
    setState(() {
      oponnentsID.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homebloc = context.read<HomeBloc>();
    final authbloc = context.read<AuthBloc>();
    return GestureDetector(
      onTap: () {
        if (widget.challengesEntity.type == 2) {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.challengesEntity.type == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: DropdownButton<dynamic>(
                              value: isselect["name"],
                              hint: const Text("Selecciona un oponente"),
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              borderRadius: BorderRadius.circular(20),
                              underline: SizedBox.shrink(),
                              items: oponnentsID
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: Center(child: Text(value["name"])),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                final data = value as Map<String, dynamic>;
                                setState(() {
                                  isselect.addAll(
                                    {
                                      "id": data['id'].toString(),
                                      "name": data['name'].toString(),
                                    },
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: TextFormField(
                          onChanged: (text) {
                            setState(() {
                              challengeName = text;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Nombre del Reto",
                            hintText: "Escribe un nombre para el reto",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (isselect['id'] != null &&
                                  challengeName != null) {
                                homebloc.add(
                                  HomeEvent.onAssignChallengesByType(
                                    type:
                                        widget.challengesEntity.type.toString(),
                                    body: null,
                                    group: {
                                      "challengerId": authbloc.state.idUser,
                                      "opponentId": isselect['id'],
                                      "challengeId": widget.challengesEntity.id,
                                      "startDate":
                                          widget.challengesEntity.startDate,
                                      "endDtae":
                                          widget.challengesEntity.endDate,
                                      "challengeText": challengeName,
                                    },
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    SnackBar(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      behavior: SnackBarBehavior.floating,
                                      dismissDirection: DismissDirection.up,
                                      margin: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height -
                                                150,
                                        left: 10,
                                        right: 10,
                                      ),
                                      content: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Column(
                                          children: [
                                            Text("Message"),
                                            Text("Selecciona a tu oponente")
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text(
                              "Aceptar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text(
                              "Rechazar",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
      child: Stack(
        children: [
          Container(
            // height: 130,
            // margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          widget.challengesEntity.name ?? "",
                          style: robotoMedium(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: Text(
                          widget.challengesEntity.description ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: robotoMedium(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                            "Fecha de inicio: ${_formatDate(widget.challengesEntity.startDate!)}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                            "Fecha final: ${_formatDate(widget.challengesEntity.endDate!)}"),
                      ),
                      Container(
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
                      ),
                      if (widget.challengesEntity.type == 1)
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  homebloc.add(
                                    HomeEvent.onAssignChallengesByType(
                                      type: widget.challengesEntity.type
                                          .toString(),
                                      body: (
                                        authbloc.state.idUser ?? "",
                                        widget.challengesEntity.id ?? ""
                                      ),
                                      group: null,
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  // minimumSize: const Size(100, 40),
                                ),
                                child: Text(
                                  "Aceptar",
                                  style: robotoMedium(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  // minimumSize: const Size(100, 40),
                                ),
                                child: Text(
                                  "Rechazar",
                                  style: robotoMedium(
                                      fontSize: 14, color: Colors.white),
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
                color: Colors.black,
              ),
              child: Text(
                "Puntos a Ganar ${widget.challengesEntity.points}",
                style: robotoMedium(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   final homebloc = context.read<HomeBloc>();
  //   final authbloc = context.read<AuthBloc>();
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 20),
  //     decoration: const BoxDecoration(),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Padding(
  //           padding: EdgeInsets.only(bottom: 20, left: 10),
  //           child: Text("Reto Individual"),
  //         ),
  //         Container(
  //           padding: const EdgeInsets.all(20),
  //           decoration: BoxDecoration(
  //             color: const Color.fromARGB(255, 197, 196, 196),
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.only(
  //                   bottom: 20,
  //                 ),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(widget.challengesEntity.name ?? ""),
  //                     Text(
  //                       widget.challengesEntity.points != null
  //                           ? widget.challengesEntity.points.toString()
  //                           : "0",
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(bottom: 20),
  //                 child: Text(
  //                   widget.challengesEntity.description ?? "",
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(bottom: 20),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(_formatDate(widget.challengesEntity.startDate!)),
  //                     Text(_formatDate(widget.challengesEntity.endDate!)),
  //                   ],
  //                 ),
  //               ),
  //               if (widget.challengesEntity.type == 2)
  //                 Container(
  //                   margin: const EdgeInsets.all(10),
  //                   alignment: Alignment.center,
  //                   child: DecoratedBox(
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(20),
  //                       border: Border.all(color: Colors.grey),
  //                     ),
  //                     child: DropdownButton<dynamic>(
  //                       value: isselect["name"],
  //                       hint: const Text("Selecciona un oponente"),
  //                       alignment: Alignment.center,
  //                       padding: const EdgeInsets.symmetric(horizontal: 20),
  //                       borderRadius: BorderRadius.circular(20),
  //                       items: oponnentsID
  //                           .map(
  //                             (value) => DropdownMenuItem(
  //                               value: value,
  //                               child: Center(child: Text(value["name"])),
  //                             ),
  //                           )
  //                           .toList(),
  //                       onChanged: (value) {
  //                         final data = value as Map<String, dynamic>;
  //                         setState(() {
  //                           isselect.addAll(
  //                             {
  //                               "id": data['id'].toString(),
  //                               "name": data['name'].toString(),
  //                             },
  //                           );
  //                         });
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   ElevatedButton(
  //                     onPressed: () {
  //                       if (widget.challengesEntity.type != null &&
  //                           widget.challengesEntity.type == 1) {
  //                         // debugPrint("el id es ${authbloc.state.idUser}");
  //                         homebloc.add(
  //                           HomeEvent.onAssignChallengesByType(
  //                             type: widget.challengesEntity.type.toString(),
  //                             body: (
  //                               authbloc.state.idUser ?? "",
  //                               widget.challengesEntity.id ?? ""
  //                             ),
  //                             group: null,
  //                           ),
  //                         );
  //                       } else if (isselect['id'] != null) {
  //                         homebloc.add(
  //                           HomeEvent.onAssignChallengesByType(
  //                             type: widget.challengesEntity.type.toString(),
  //                             body: null,
  //                             group: {
  //                               "challengerId": authbloc.state.idUser,
  //                               "opponentId": isselect['id'],
  //                               "challengeId": widget.challengesEntity.id,
  //                               "startDate": widget.challengesEntity.startDate,
  //                               "endDtae": widget.challengesEntity.endDate,
  //                               "challengeText":
  //                                   widget.challengesEntity.description,
  //                             },
  //                           ),
  //                         );
  //                       } else {
  //                         ScaffoldMessenger.of(context)
  //                           ..hideCurrentSnackBar()
  //                           ..showSnackBar(
  //                             SnackBar(
  //                               shape: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(20)),
  //                               behavior: SnackBarBehavior.floating,
  //                               dismissDirection: DismissDirection.vertical,
  //                               content: Container(
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(20),
  //                                 ),
  //                                 child: const Column(
  //                                   children: [
  //                                     Text("Message"),
  //                                     Text("Selecciona a tu oponente")
  //                                   ],
  //                                 ),
  //                               ),
  //                             ),
  //                           );
  //                       }
  //                     },
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: Colors.blue,
  //                     ),
  //                     child: const Text(
  //                       "Aceptar",
  //                       style: TextStyle(color: Colors.white),
  //                     ),
  //                   ),
  //                   ElevatedButton(
  //                     onPressed: () {},
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: Colors.red,
  //                     ),
  //                     child: const Text(
  //                       "Rechazar",
  //                       style: TextStyle(color: Colors.white),
  //                     ),
  //                   )
  //                 ],
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
