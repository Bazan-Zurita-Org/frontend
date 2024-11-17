import 'package:app_gym/features/home/domain/entities/rutina_entity.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
        decoration: const BoxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(widget.nameRutine),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text("Ejercicios"),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.exerciseEntity.length,
                  itemBuilder: (context, index) {
                    final data = widget.exerciseEntity[index];
                    return Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 189, 189, 189),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data.name ?? ""),
                              Text(data.sets != null
                                  ? data.sets.toString()
                                  : "0"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text(data.instructions ?? "")),
                              Text(
                                data.reps != null ? data.reps.toString() : "0",
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data.restTime.toString()),
                              Text(data.equipment ?? "")
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
