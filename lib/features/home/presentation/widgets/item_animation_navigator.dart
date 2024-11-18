import 'package:app_gym/core/helper/roboto_styles.dart';
import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemAnimationBottom extends StatefulWidget {
  final int isselect;
  final String title;
  final Widget icons;
  final bool isrotate;
  const ItemAnimationBottom(
      {super.key,
      required this.isselect,
      required this.title,
      required this.icons,
      this.isrotate = false});

  @override
  State<ItemAnimationBottom> createState() => _ItemAnimationBottomState();
}

class _ItemAnimationBottomState extends State<ItemAnimationBottom>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _rotationAnimation;
  late Animation<int> _textAnimation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 30, end: 90).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 0.08).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    _textAnimation = IntTween(begin: 0, end: widget.title.length).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    if (widget.isselect == 0) {
      _controller.forward();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ItemAnimationBottom oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (widget.isselect != oldWidget.isselect && mounted) {
    //   if (widget.isselect) {
    //     _controller.forward();
    //   } else {
    //     _controller.reverse();
    //   }
    // }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final TextPainter textPainter = TextPainter(
    //   text: TextSpan(
    //     text: widget.title,
    //     style: robotoRegular(color: Colors.white),
    //   ),
    //   textDirection: TextDirection.ltr,
    // )..layout();

    // final double textWidth = textPainter.width;
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.indexpage == widget.isselect) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                // width: _animation.value + textWidth,
                // constraints: const BoxConstraints(maxWidth: 200),
                height: 30,
                padding: _animation.value == 30
                    ? EdgeInsets.zero
                    : const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(43),
                  color:
                      _animation.value == 30 ? Colors.transparent : Colors.blue,
                ),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        child: widget.isrotate
                            ? AnimatedBuilder(
                                animation: _controller,
                                builder: (BuildContext context, Widget? child) {
                                  return RotationTransition(
                                    turns: _rotationAnimation,
                                    child: widget.icons,
                                  );
                                },
                              )
                            : widget.icons,
                      ),
                      if (state.indexpage == widget.isselect)
                        Flexible(
                          child: AnimatedBuilder(
                            animation: _textAnimation,
                            builder: (context, child) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  widget.title
                                      .substring(0, _textAnimation.value),
                                  style: robotoRegular(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            },
                          ),
                        ),
                      // Flexible(
                      //   child: Text(
                      //     widget.title,
                      //     style: robotoRegular(color: Colors.white),
                      //   ),
                      // )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
