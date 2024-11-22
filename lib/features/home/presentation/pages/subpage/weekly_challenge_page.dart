import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/features/auth/domain/usecases/user/get_list_user_id_use_case.dart';
import 'package:app_gym/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_gym/features/home/domain/entities/challenges_entity.dart';
import 'package:app_gym/features/home/presentation/bloc/duel_selector/duel_selected_cubit.dart';
import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:app_gym/features/shared/widgets/dialog/success_dialog.dart';
import 'package:app_gym/injectable.dart';
import 'package:app_gym/injector_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class WeeklyChallengePage extends StatefulWidget {
  const WeeklyChallengePage({super.key});

  @override
  State<WeeklyChallengePage> createState() => _WeeklyChallengePageState();
}

Map<String, dynamic>? isselect;

class _WeeklyChallengePageState extends State<WeeklyChallengePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeEvent.onGetListChallenges());
    super.initState();
  }

  void _updateParentState(Map<String, String>? selected) {
    isselect = selected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: const BoxDecoration(),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.listchallenges?.length,
                    itemBuilder: (context, index) {
                      final data = state.listchallenges![index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.w),
                        child: ItemWeekly(
                          challengesEntity: data,
                          updateParentState: _updateParentState,
                          isselect: isselect,
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
  final void Function(Map<String, String>) updateParentState;
  final Map<String, dynamic>? isselect;

  const ItemWeekly({
    super.key,
    required this.challengesEntity,
    required this.updateParentState,
    required this.isselect,
  });

  @override
  State<ItemWeekly> createState() => _ItemWeeklyState();
}

class _ItemWeeklyState extends State<ItemWeekly> {
  final oponnentsID = <dynamic>[];
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
      onTap: () async {
        if (widget.challengesEntity.type == 2) {
          await showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.challengesEntity.type == 2)
                        Container(
                          margin: EdgeInsets.all(10.w),
                          alignment: Alignment.center,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: BlocBuilder<DuelCubit, String>(
                              builder: (context, state) {
                                return DropdownButton<dynamic>(
                                  value: state.isEmpty ? null : state,
                                  hint: const Text("Selecciona un oponente"),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  borderRadius: BorderRadius.circular(10.r),
                                  underline: SizedBox.shrink(),
                                  items: oponnentsID
                                      .map(
                                        (value) => DropdownMenuItem(
                                          value: value["id"],
                                          child: Center(
                                              child: Text(value["name"])),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    final selectedOpponent =
                                        oponnentsID.firstWhere(
                                      (opponent) => opponent["id"] == value,
                                      orElse: () => {"id": null, "name": null},
                                    );
                                    print(
                                        'SB - selectedOpponent: $selectedOpponent');
                                    setState(() {
                                      print(
                                          'SB - widget.isselect: ${widget.isselect}');
                                    });
                                    context
                                        .read<DuelCubit>()
                                        .changeValue(value);

                                    final isselect = {
                                      "id": selectedOpponent['id'].toString(),
                                      "name":
                                          selectedOpponent['name'].toString(),
                                    };
                                    widget.updateParentState(isselect);
                                  },
                                );
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
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (context.read<DuelCubit>().state.isNotEmpty &&
                                  challengeName.isNotEmpty) {
                                final DateFormat formatter =
                                    DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
                                final String formattedStartDate = formatter
                                    .format(widget.challengesEntity.startDate!);
                                final String formattedEndDate = formatter
                                    .format(widget.challengesEntity.endDate!);

                                homebloc.add(
                                  HomeEvent.onAssignChallengesByType(
                                    type:
                                        widget.challengesEntity.type.toString(),
                                    body: null,
                                    group: {
                                      "challengerId": authbloc.state.idUser,
                                      "opponentId":
                                          context.read<DuelCubit>().state,
                                      "challengeId": widget.challengesEntity.id,
                                      "startDate": formattedStartDate,
                                      "endDtae": formattedEndDate,
                                      "challengeText": challengeName,
                                    },
                                  ),
                                );
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context)
                                  ..showSnackBar(
                                    SnackBar(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
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
                                            Text("Reto asignado")
                                          ],
                                        ),
                                      ),
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
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child:
                      Image.asset(AppImages.test, height: 100.w, width: 100.w),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 22.5.h),
                        child: Text(
                          widget.challengesEntity.name ?? "",
                          style: robotoMedium().copyWith(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                        child: Text(
                          widget.challengesEntity.description ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: robotoMedium().copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: Text(
                            "Fecha de inicio: ${_formatDate(widget.challengesEntity.startDate!)}",
                            style: robotoRegular().copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w200,
                                height: 1)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text(
                          "Fecha final: ${_formatDate(widget.challengesEntity.endDate!)}",
                          style: robotoRegular().copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w200,
                              height: 1),
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
                          height: 17.h,
                          decoration: BoxDecoration(
                            color: HexColor("#3899DE"),
                            borderRadius: BorderRadius.circular(3),
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
                      ),
                      if (widget.challengesEntity.type == 1)
                        Container(
                          height: 36.h,
                          padding: EdgeInsets.only(top: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: ElevatedButton(
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
                                    SuccessDialog(
                                            title: 'Éxito',
                                            description: 'Reto aceptado')
                                        .show(context);
                                    // widget.updateParentState();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                  ),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
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
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
                color: Colors.black,
              ),
              child: Text(
                "Puntos a Ganar ${widget.challengesEntity.points}",
                style: robotoMedium(color: Colors.white, fontSize: 12.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
