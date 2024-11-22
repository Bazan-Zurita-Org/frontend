import 'package:app_gym/core/helper/app_icons.dart';
import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';
import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:app_gym/features/home/presentation/widgets/item_rutine_widget.dart';
import 'package:app_gym/features/home/presentation/widgets/item_workouts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class RutinaPage extends StatefulWidget {
  const RutinaPage({super.key});

  @override
  State<RutinaPage> createState() => _RutinaPageState();
}

class _RutinaPageState extends State<RutinaPage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeEvent.onGetListRutine());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homebloc = context.read<HomeBloc>();
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              forceMaterialTransparency: true,
              title: Text(
                "Popular Workouts",
                style: robotoMedium(fontSize: 18.sp),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 177.h,
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ItemWorkouts(index: index);
                  },
                ),
              ),
            ),
            SliverAppBar(
              forceMaterialTransparency: true,
              title: Text(
                "Today Plan",
                style: robotoMedium(fontSize: 18.sp),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(right: 14, left: 14),
              sliver: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return SliverList.builder(
                    itemCount: state.listrutine?.length,
                    itemBuilder: (context, index) {
                      return ItemRutina(
                        rutinaEntity: state.listrutine![index],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
