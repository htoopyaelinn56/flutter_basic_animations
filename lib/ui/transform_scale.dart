import 'package:flutter/material.dart';
import 'package:tween_animation/constants.dart';

class TransformScale extends StatefulWidget {
  const TransformScale({super.key});

  @override
  State<TransformScale> createState() => _TransformScaleState();
}

class _TransformScaleState extends State<TransformScale> with SingleTickerProviderStateMixin {
  double sliderValue = .3;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transform.scale'),
        ),
        body: Column(
          children: [
            Expanded(
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: kAnimationDuration),
                tween: Tween(begin: .3, end: 5),
                child: const Center(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
                builder: (context, tween, child) => Transform.scale(
                  scale: tween * sliderValue,
                  child: child,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Slider(
                min: .3,
                max: 5,
                value: sliderValue,
                onChanged: (value) {
                  sliderValue = value;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
