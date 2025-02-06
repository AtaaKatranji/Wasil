import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class ReferralPage extends StatelessWidget {
  final int totalInvited;
  final int pendingAuthentication;
  final int totalPoints;
  final String inviteCode;

  const ReferralPage({
    Key? key,
    required this.totalInvited,
    required this.pendingAuthentication,
    required this.totalPoints,
    required this.inviteCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E3192),
        title: const Text(
          'Referral',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E3192), Color.fromARGB(255, 255, 255, 255)],
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Together\n we\'re going further!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              _buildInviteSection(context),
              const SizedBox(height: 20),
              _buildStatCard('Total Invited', totalInvited.toString()),
              _buildStatCard(
                  'Pending Authentication', pendingAuthentication.toString()),
              _buildStatCard('Total Points', totalPoints.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInviteSection(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        gradient: LinearGradient(
          colors: [Color(0xFF1BFFFF), Color(0xFF2E3192)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Container(
        color: const Color.fromARGB(0, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your Invite Code',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.share,
                        color: Color.fromARGB(255, 255, 255, 255)),
                    onPressed: () {
                      Share.share(
                          'Join the Wasil App using my invite code: $inviteCode');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: inviteCode));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invite code copied!')),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 181, 244, 244),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    inviteCode,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 53, 166),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(
          value,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue),
        ),
      ),
    );
  }
}
