import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedHeaderCard extends StatefulWidget {
  const AnimatedHeaderCard({super.key});

  @override
  State<AnimatedHeaderCard> createState() => _AnimatedHeaderCardState();
}

class _AnimatedHeaderCardState extends State<AnimatedHeaderCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.2),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    repeatOnce();
  }

  void repeatOnce() async {
    await _controller.forward();
    await _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset("assets/images/${Random().nextInt(9) + 1}.jpg"),
        //${Random().nextInt(9) + 1}
      ),
    );
  }
}
