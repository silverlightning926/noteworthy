import 'package:flutter/material.dart';
import 'package:noteworthy/models/notes.dart';

class NoteIndicator extends StatelessWidget {
  final Notes note;
  final int octave;

  const NoteIndicator({
    super.key,
    required this.note,
    required this.octave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          note.note,
          style: const TextStyle(
            fontSize: 175,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${note.frequencies[octave]} Hz",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
