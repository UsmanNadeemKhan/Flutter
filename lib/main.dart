//Usman Nadeem - 2380247
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
      home: GmailHome(),
    );
  }
}

class GmailHome extends StatelessWidget {
  const GmailHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  "Search mail",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          actions: [
            const Icon(Icons.refresh, color: Colors.grey),
            const SizedBox(width: 10),
            const Icon(Icons.more_vert, color: Colors.grey),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=10"),
            ),
            const SizedBox(width: 10),
          ],
          bottom: const TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.red,
            tabs: [
              Tab(text: "Primary"),
              Tab(text: "Social"),
              Tab(text: "Promotions"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EmailList(),
            EmailList(),
            EmailList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {},
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}

class EmailList extends StatelessWidget {
  const EmailList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("A", style: TextStyle(color: Colors.white)),
          ),
          title: Text("Usman Nadeem", style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("Meeting tomorrow at 10 AM"),
          trailing: Text("12:30 PM"),
        );
      },
    );
  }
}
