import 'package:flutter/material.dart';
import 'package:tween_animation/constants.dart';

class TransformTranslate extends StatefulWidget {
  const TransformTranslate({super.key});

  @override
  State<TransformTranslate> createState() => _TransformTranslateState();
}

class _TransformTranslateState extends State<TransformTranslate> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  late final _curveAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller.value = 1;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transform.translate'),
        ),
        body: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t write anything'),
                TextFormField(
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Text cant\'t be empty';
                    }
                    return null;
                  },
                ),
                AnimatedBuilder(
                  animation: _curveAnimation,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_form.currentState!.validate()) {
                              _form.currentState!.save();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Thanks'),
                                ),
                              );
                            } else {
                              if (_controller.isDismissed) {
                                _controller.forward();
                              } else {
                                _controller.reverse();
                              }
                            }
                          },
                          child: const Text('click'),
                        ),
                      ),
                    ],
                  ),
                  builder: (context, child) => Transform.translate(
                    offset: Offset(_curveAnimation.value * (size.width - 90), 0),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
