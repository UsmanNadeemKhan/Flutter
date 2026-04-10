
// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AnimationPage(),
    );
  }
}

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animations Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            ExplicitAnimationWidget(),
            ImplicitAnimationWidget(),
          ],
        ),
      ),
    );
  }
}

// ---------------- EXPLICIT ANIMATION ----------------
class ExplicitAnimationWidget extends StatefulWidget {
  const ExplicitAnimationWidget({super.key});

  @override
  State<ExplicitAnimationWidget> createState() => _ExplicitAnimationWidgetState();
}

class _ExplicitAnimationWidgetState extends State<ExplicitAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Explicit Animation (Fade In Logo)'),
        FadeTransition(
          opacity: _animation,
          child: const FlutterLogo(size: 100),
        ),
      ],
    );
  }
}

// ---------------- IMPLICIT ANIMATION ----------------
class ImplicitAnimationWidget extends StatefulWidget {
  const ImplicitAnimationWidget({super.key});

  @override
  State<ImplicitAnimationWidget> createState() => _ImplicitAnimationWidgetState();
}

class _ImplicitAnimationWidgetState extends State<ImplicitAnimationWidget> {
  double _size = 100;
  bool _expanded = false;

  void _animate() {
    setState(() {
      _expanded = !_expanded;
      _size = _expanded ? 200 : 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Implicit Animation (AnimatedContainer)'),
        GestureDetector(
          onTap: _animate,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: _size,
            height: _size,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('Tap Me', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
