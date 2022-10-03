import 'package:flutter/material.dart';
import 'package:tween_animation/constants.dart';
import 'dart:math' as math;

class TransformRotate extends StatefulWidget {
  const TransformRotate({super.key});

  @override
  State<TransformRotate> createState() => _TransformRotateState();
}

class _TransformRotateState extends State<TransformRotate> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  );

  late final _curveAnimation = CurvedAnimation(parent: _controller, curve: Curves.linear);

  @override
  void initState() {
    super.initState();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transform.rotate'),
        ),
        body: Center(
          child: AnimatedBuilder(
            animation: _curveAnimation,
            child: Container(
              width: 2,
              height: 300,
              color: Colors.red,
            ),
            builder: (context, child) => Transform.rotate(
              angle: _controller.value,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
