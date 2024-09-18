import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:noteworthy/models/notes.dart';

class NoteIndicator extends StatelessWidget {
  final Notes note;
  final int octave;

  NoteIndicator({
    super.key,
    required this.note,
    required this.octave,
  }) : assert(
            octave >= 0 && octave < note.frequencies.length, "Invalid octave");

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EasyRichText(
          "${note.note}$octave",
          textAlign: TextAlign.center,
          defaultStyle: const TextStyle(
            fontSize: 175,
            fontWeight: FontWeight.bold,
          ),
          patternList: [
            EasyRichTextPattern(
              targetString: '♯',
              matchWordBoundaries: false,
              style: const TextStyle(
                fontSize: 85,
                fontWeight: FontWeight.bold,
              ),
            ),
            EasyRichTextPattern(
              targetString: ["0", "1", "2", "3", "4", "5", "6", "7", "8"],
              matchWordBoundaries: false,
              subScript: true,
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
