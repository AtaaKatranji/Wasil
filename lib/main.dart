import 'package:flutter/material.dart';
import 'package:tasks_rewerd/taskCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const List<Map<String, dynamic>> tasks = [
    {
      "taskType": "Like a post",
      "icon": Icons.thumb_up,
      "description": "Like our latest social media post to show support.",
      "points": "+50",
      "color": Colors.blue,
    },
    {
      "taskType": "Share a post",
      "icon": Icons.share,
      "description": "Share our post on your profile to spread awareness.",
      "points": "+100",
      "color": Colors.green,
    },
    {
      "taskType": "Follow a page",
      "icon": Icons.group_add,
      "description":
          "Follow our official page for updates on new content and offers.",
      "points": "+75",
      "color": Colors.red,
    },
    {
      "taskType": "Comment on",
      "icon": Icons.comment,
      "description": "Leave a thoughtful comment on our latest post to engage.",
      "points": "+60",
      "color": Colors.orange,
    },
    {
      "taskType": "Subscribe to",
      "icon": Icons.email,
      "description":
          "Sign up for our weekly newsletter to receive exclusive updates.",
      "points": "+90",
      "color": Colors.purple,
    },
    {
      "taskType": "Watch a video",
      "icon": Icons.play_circle,
      "description":
          "Watch our latest promotional video and learn about our services.",
      "points": "+120",
      "color": Colors.teal,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Rewards"),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                label: const Text("250"),
                backgroundColor: Colors.blueAccent.withOpacity(0.2),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       const Text(
          //         "Your Points:",
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //       ),
          //       Chip(
          //         label: const Text("250"),
          //         backgroundColor: Colors.blueAccent.withOpacity(0.2),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   width: 200,
          //   child: Card(
          //     margin: const EdgeInsets.all(10),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(15)),
          //     child: Padding(
          //       padding: const EdgeInsets.all(16.0),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           const Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Icon(Icons.facebook,
          //                   color: Color.fromARGB(255, 255, 0, 0), size: 32),
          //               Text(
          //                 "+50",
          //                 style: TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.bold,
          //                   color: false
          //                       ? Color.fromARGB(255, 255, 0, 0)
          //                       : Colors.green,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           const SizedBox(height: 10),
          //           const Text(
          //             "like",
          //             style:
          //                 TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //           ),
          //           const SizedBox(height: 10),
          //           Text(
          //             "like our latest social media post",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          //           ),
          //           const SizedBox(height: 20),
          //           ElevatedButton(
          //             onPressed: () {},
          //             child: const Text(true ? "Completed" : "Start"),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: 6, // Sample task count
              itemBuilder: (context, index) {
                // Sample data - replace with your actual data
                bool isDone = index % 2 == 0;
                final task = tasks[index]; // Example done state
                return TaskCard(
                  taskType: task["taskType"],
                  icon: task["icon"],
                  iconColor: task["color"],
                  description: task["description"],
                  points: task["points"],
                  isDone: false, // Default to not done
                  onPressed: () {
                    // Handle task completion here
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RewardsPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RivalPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: "Rewards"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Rival"),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: const Center(child: Text("Profile Page")),
    );
  }
}

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rewards")),
      body: const Center(child: Text("Rewards Page")),
    );
  }
}

class RivalPage extends StatelessWidget {
  const RivalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rival Page")),
      body: const Center(child: Text("Rival Page")),
    );
  }
}
