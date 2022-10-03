import 'package:flutter/material.dart';
import 'package:tween_animation/constants.dart';
import 'package:tween_animation/ui/transform_rotate.dart';
import 'package:tween_animation/ui/transform_translate.dart';
import 'package:tween_animation/ui/transform_scale.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isRight = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animation Practice'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransformTranslate(),
                    ),
                  );
                },
                child: const Text('Transform.translate'),
              ),
              kDividerV,
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransformScale(),
                    ),
                  );
                },
                child: const Text('Transform.scale'),
              ),
              kDividerV,
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransformRotate(),
                    ),
                  );
                },
                child: const Text('Transform.rotate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
