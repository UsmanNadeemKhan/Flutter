//Usman Nadeem 2380247
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: width < 750
          ? AppBar(title: const Text("Responsive App"))
          : null,
      drawer: width < 750 ? const SideBar() : null,
      body: Row(
        children: [
          if (width >= 750) const SideBar(),
          const Expanded(
            child: CenterImage(),
          ),
        ],
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.blueGrey[900],
      child: Column(
        children: const [
          SizedBox(height: 40),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text("Home", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text("Way Of Life", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.white),
            title: Text("More About Hope", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class CenterImage extends StatelessWidget {
  const CenterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            "assets/HopeOfLife.webp",
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            fit: BoxFit.contain, // keeps aspect ratio
          ),
        );
      },
    );
  }
}
