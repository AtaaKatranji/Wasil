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
  bool isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFlipped = !isFlipped;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return RotationTransition(
            turns: Tween(begin: 1.0, end: 0.0).animate(animation),
            child: child,
          );
        },
        child: isFlipped ? _buildBackCard() : _buildFrontCard(),
      ),
    );
  }

  /// Front Side of the Card
  Widget _buildFrontCard() {
    return Card(
      key: const ValueKey(1),
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    color: widget.isDone ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.taskType,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description.length > 30
                  ? "${widget.description.substring(0, 25)}..." // Truncate
                  : widget.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.isDone ? null : widget.onPressed,
                child: Text(widget.isDone ? "Completed" : "Start"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Back Side of the Card (Full Description)
  Widget _buildBackCard() {
    return Card(
      key: const ValueKey(2),
      color: Colors.grey[200],
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Full Description",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            const Text("Tap to flip back",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
