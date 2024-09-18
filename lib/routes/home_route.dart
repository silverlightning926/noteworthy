import 'package:flutter/material.dart';
import 'package:noteworthy/components/note_indicator.dart';
import 'package:noteworthy/components/tuning_indicator.dart';
import 'package:noteworthy/models/notes.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NoteIndicator(
              note: Notes.aSharp,
              octave: 2,
            ),
            const TuningIndicator(
              cents: 30,
            ),
          ],
        ),
      ),
    );
  }
}
