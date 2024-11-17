import 'package:app_gym/features/home/domain/entities/rankings_entity.dart';
import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RankingsPage extends StatefulWidget {
  const RankingsPage({super.key});

  @override
  State<RankingsPage> createState() => _RankingsPageState();
}

class _RankingsPageState extends State<RankingsPage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeEvent.onGetListRanking());
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
              child: const Text("Ranking Oficiales"),
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.listranking?.length,
                    itemBuilder: (context, index) {
                      final data = state.listranking![index];
                      return ItemRanking(
                        ranKingEntity: data,
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

class ItemRanking extends StatefulWidget {
  final RanKingEntity ranKingEntity;
  const ItemRanking({super.key, required this.ranKingEntity});

  @override
  State<ItemRanking> createState() => _ItemRankingState();
}

class _ItemRankingState extends State<ItemRanking> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text("data"),
      trailing: Text("data"),
    );
  }
}
