import 'package:app_gym/core/helper/app_images.dart';
import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/features/home/domain/entities/rankings_entity.dart';
import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: const BoxDecoration(),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SvgPicture.asset(AppImages.rank, height: 100.w, width: 100.w),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.listranking?.length,
                    itemBuilder: (context, index) {
                      final data = state.listranking![index];
                      return ItemRanking(
                        ranKingEntity: data,
                        imageFirst: index == 0 ? AppImages.champion1 : null,
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class ItemRanking extends StatefulWidget {
  final RanKingEntity ranKingEntity;
  const ItemRanking({super.key, required this.ranKingEntity, this.imageFirst});
  final String? imageFirst;

  @override
  State<ItemRanking> createState() => _ItemRankingState();
}

class _ItemRankingState extends State<ItemRanking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: widget.imageFirst != null
              ? SvgPicture.asset(widget.imageFirst!)
              : const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
        ),
        title: Text(
          "${widget.ranKingEntity.name}",
          style: robotoRegular(
            color: Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Text(
          widget.ranKingEntity.points.toString(),
          style: robotoRegular(
            fontSize: 12.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
