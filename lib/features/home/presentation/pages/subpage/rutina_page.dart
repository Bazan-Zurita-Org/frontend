import 'package:app_gym/core/routes/routes.dart';
import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';
import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
      margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
      decoration: const BoxDecoration(),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: const Text("Rutina"),
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.listrutine?.length,
                    itemBuilder: (context, index) {
                      return ItemRutina(
                        rutinaEntity: state.listrutine![index],
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

class ItemRutina extends StatelessWidget {
  final RutinaEntity rutinaEntity;
  const ItemRutina({
    super.key,
    required this.rutinaEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20, left: 10),
            child: Text("Lunes"),
          ),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.exercise,
                  extra: (rutinaEntity.name, rutinaEntity.exercises));
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(rutinaEntity.name ?? ""),
                        Text(
                          rutinaEntity.difficultyLevel != null
                              ? rutinaEntity.difficultyLevel.toString()
                              : "",
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(rutinaEntity.goal ?? ""),
                      Text(
                        rutinaEntity.isCompleted != null &&
                                rutinaEntity.isCompleted!
                            ? "Completado"
                            : "Pendiente",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
