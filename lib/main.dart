import 'package:flutter/material.dart';
import 'package:tasks_rewerd/referral.dart';
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
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Number of columns
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio:
                    1.5, // Adjust this value to control the height of the cards
              ),
              padding: const EdgeInsets.all(4),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return TaskCard(
                  taskType: task["taskType"],
                  icon: task["icon"],
                  iconColor: task["color"],
                  description: task["description"],
                  points: task["points"],
                  isDone: index % 2 == 0, // Default to not done
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
              MaterialPageRoute(
                  builder: (context) => const ReferralPage(
                        totalInvited: 0,
                        pendingAuthentication: 0,
                        totalPoints: 0,
                        inviteCode: 'FX4D2',
                      )),
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
