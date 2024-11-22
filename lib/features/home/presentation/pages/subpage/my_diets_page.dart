import 'package:app_gym/core/bloc/result_state.dart';
import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/features/home/domain/entities/diet_entity.dart';
import 'package:app_gym/features/home/presentation/bloc/diet/diet_bloc.dart';
import 'package:app_gym/features/home/presentation/bloc/diet/diet_event.dart';
import 'package:app_gym/features/home/presentation/utils/diets_util.dart';
import 'package:app_gym/features/shared/widgets/dialog/diets_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';

final sl = GetIt.instance;

class MyDietsPage extends StatelessWidget {
  const MyDietsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DietBloc>(
      create: (context) => sl()..add(const DoGetDiets()),
      child: const MyDietsView(),
    );
  }
}

class MyDietsView extends StatelessWidget {
  const MyDietsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: BlocBuilder<DietBloc, ResultState<List<DietEntity>>>(
        builder: (context, dietListState) {
          return dietListState.whenOrNull(
                data: (diets) {
                  return SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(children: [
                      SizedBox(height: 120.h),
                      ...List.generate(
                        diets.length,
                        (index) {
                          final diet = diets[index];
                          return Container(
                            margin: EdgeInsets.only(
                                bottom: 16.h, left: 10.w, right: 10.w),
                            padding: EdgeInsets.only(bottom: 16.h),
                            decoration: BoxDecoration(
                              color: HexColor("#384046"),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: ListTile(
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              tileColor: HexColor("#384046"),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(AppImages.lamge),
                              ),
                              title: Text(
                                diet.name,
                                style: robotoMedium(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                              subtitle: Text(
                                diet.goal,
                                style: robotoRegular(
                                  fontSize: 13.sp,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  DietsDialog(
                                    title: diet.name,
                                    widgetDescription: Container(
                                      height: 300.h,
                                      // width: 250.w,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children:
                                              dietEntityToTextWidgets(diet),
                                        ),
                                      ),
                                    ),
                                  ).show(context);
                                },
                                child: CircleAvatar(
                                  radius: 18.r,
                                  backgroundColor: HexColor("#192126"),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 20.w,
                                    color: HexColor("#3899DE"),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ]),
                  );
                },
                error: (error) {
                  return const Center(
                    child: Text('Algo salió mal'),
                  );
                },
              ) ??
              const SizedBox();
        },
      ),
    );
  }
}

List<Widget> dietEntityToTextWidgets(DietEntity dietEntity) {
  List<Widget> widgets = [];

  widgets.add(_buildRichText('Name: ', dietEntity.name));
  widgets.add(_buildRichText('Goal: ', dietEntity.goal));
  widgets.add(_buildRichText(
      'Calories: ', '${dietEntity.calories.min} - ${dietEntity.calories.max}'));
  widgets.add(_buildRichText(
      'Proteins: ', '${dietEntity.proteins.min} - ${dietEntity.proteins.max}'));
  widgets.add(_buildRichText('Carbohydrates: ',
      '${dietEntity.carbohydrates.min} - ${dietEntity.carbohydrates.max}'));
  widgets.add(_buildRichText(
      'Fats: ', '${dietEntity.fats.min} - ${dietEntity.fats.max}'));
  widgets.add(_buildRichText('Duration: ', '${dietEntity.duration} days'));

  for (var meal in dietEntity.meals) {
    widgets.add(_buildRichText('Type: ', DietsUtil.getStringByType(meal.type)));
    // widgets.add(_buildRichText('Schedule Time: ', meal.scheduleTime));

    for (var food in meal.food) {
      widgets.add(_buildRichText(' • Name: ', food.name));
      widgets.add(_buildRichText(' • Quantity: ', food.quantity));
      widgets.add(_buildRichText(' • Macronutrients:', ''));
      widgets.add(
          _buildRichText('   • Protein: ', '${food.macronutrients.protein}'));
      widgets.add(_buildRichText(
          '   • Carbohydrates: ', '${food.macronutrients.carbohydrates}'));
      widgets.add(_buildRichText('   • Fat: ', '${food.macronutrients.fat}'));
    }
  }

  return widgets;
}

Widget _buildRichText(String title, String content) {
  return RichText(
    textAlign: TextAlign.start,
    maxLines: 1,
    text: TextSpan(
      style: TextStyle(
          fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w300),
      children: [
        TextSpan(
          text: title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        TextSpan(
          text: '$content\n',
        ),
      ],
    ),
  );
}
