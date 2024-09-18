import 'package:flutter/material.dart';
import 'package:noteworthy/components/note_indicator.dart';
import 'package:noteworthy/components/tuning_indicator.dart';
import 'package:noteworthy/models/notes.dart';
import 'package:noteworthy/services/audio_service.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  void dispose() {
    stopRecording();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: StreamBuilder(
            stream: getNoteStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NoteIndicator(
                      note: snapshot.data['note'],
                      octave: snapshot.data['octave'],
                    ),
                    TuningIndicator(
                      cents: snapshot.data['centsDeviation'],
                    ),
                  ],
                );
              } else {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NoteIndicator(
                      note: Notes.none,
                      octave: 0,
                    ),
                    TuningIndicator(
                      cents: 0,
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
