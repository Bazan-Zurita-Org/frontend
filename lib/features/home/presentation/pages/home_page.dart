import 'package:app_gym/core/helper/app_constants.dart';
import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:app_gym/features/home/presentation/widgets/item_animation_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homebloc = context.read<HomeBloc>();
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              AppImages.stars,
              width: 35.w,
              height: 35.w,
              fit: BoxFit.fill,
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state.indexpage != 0) {
                return Text(
                  state.indexpage == 1
                      ? "Retos Semanales"
                      : (state.indexpage == 2
                          ? "Mis Dietas"
                          : (state.indexpage == 3
                              ? "Ranking Oficial"
                              : "Duelos")),
                  style: robotoMedium(fontSize: 16.sp),
                );
              } else {
                return Text('Gym', style: robotoMedium(fontSize: 16.sp));
              }
            }),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.profile);
              },
              child: CircleAvatar(
                  backgroundColor: AppConstants.primaryColor,
                  child: SvgPicture.asset(
                    AppImages.icPerson,
                    width: 20.w,
                    height: 20.w,
                    fit: BoxFit.fill,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          color: HexColor('#F7F5F3'),
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return homebloc.listpage[state.indexpage ?? 0].page;
          },
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
        child: BottomAppBar(
          height: 60.h,
          color: HexColor("#192126"),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              homebloc.listpage.length,
              (index) => GestureDetector(
                onTap: () {
                  homebloc.add(
                    HomeEvent.onchangedIndexPage(indexpage: index),
                  );
                },
                child: ItemAnimationBottom(
                  isselect: index,
                  title: homebloc.listpage[index].title,
                  icons: homebloc.listpage[index].icons,
                  isrotate: index == 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
