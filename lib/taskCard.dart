import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String taskType;
  final IconData icon;
  final String description;
  final String points;
  final Color iconColor;
  final bool isDone;
  final VoidCallback onPressed;

  const TaskCard({
    super.key,
    required this.taskType,
    required this.icon,
    required this.description,
    required this.points,
    required this.iconColor,
    required this.isDone,
    required this.onPressed,
  });

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0, // Remove default elevation
      shadowColor: Colors.black.withOpacity(0.3), // Shadow color
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  widget.iconColor,
                  widget.iconColor.withOpacity(0.5),
                  widget.iconColor.withOpacity(0.3),
                  widget.iconColor.withOpacity(0.5),
                  widget.iconColor,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(4, 4), // Shadow position
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(widget.icon, color: widget.iconColor, size: 32),
                      Text(
                        widget.points,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: widget.isDone
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.taskType,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description.length > 100
                        ? "${widget.description.substring(0, 100)}..." // Truncate
                        : widget.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      onPressed: widget.isDone ? null : widget.onPressed,
                      child: Text(widget.isDone ? "Completed" : "Start"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add a "Done" stamp if the task is completed
          if (widget.isDone)
            Positioned(
              bottom: 10,
              right: 10,
              child: Transform.rotate(
                angle: -0.1, // Slight rotation for a stamp effect
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(0, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/done.png',
                    color: Colors.white,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
