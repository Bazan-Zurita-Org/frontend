import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:app_gym/features/home/presentation/widgets/item_animation_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            Image.asset(
              AppImages.logo,
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.profile);
              },
              child: CircleAvatar(child: Icon(Icons.person_outlined)),
            )
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              HexColor("#65AED8"),
              HexColor("#8897DA"),
              HexColor("#8F88E9"),
            ],
          ),
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return homebloc.listpage[state.indexpage ?? 0].page;
          },
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomAppBar(
          height: 60,
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
