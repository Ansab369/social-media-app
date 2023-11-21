import 'package:flutter/material.dart';

class HeartAnimationWidget extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final bool alWaysAnimate;
  final Duration duration;
  final VoidCallback? onEnd;

  const HeartAnimationWidget({
    Key? key,
    required this.child,
    required this.isAnimating,
    this.duration = const Duration(milliseconds: 700),
    this.onEnd,
    this.alWaysAnimate = false,
  }) : super(key: key);

  @override
  State<HeartAnimationWidget> createState() => _HeartAnimationWidgetState();
}

class _HeartAnimationWidgetState extends State<HeartAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;
  @override
  void initState() {
    super.initState();

    final halfDuration = widget.duration.inMilliseconds ~/ 2;

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: halfDuration),
    );
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant HeartAnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating != oldWidget.isAnimating) {
      doAnimation();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future doAnimation() async {
    if (widget.isAnimating || widget.alWaysAnimate) {
      await controller.forward();
      await controller.reverse();
      await Future.delayed(Duration(milliseconds: 400));
    }
    if (widget.onEnd != null) {
      widget.onEnd!();
    }
  }

  @override
  Widget build(BuildContext context) =>
      ScaleTransition(scale: scale, child: widget.child);
}