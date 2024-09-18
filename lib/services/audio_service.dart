import 'dart:typed_data';

import 'package:buffered_list_stream/buffered_list_stream.dart';
import 'package:noteworthy/models/notes.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitch_detector_dart/pitch_detector_result.dart';
import 'package:record/record.dart';

final AudioRecorder _audioRecorder = AudioRecorder();
final PitchDetector _pitchDetector = PitchDetector();

Stream<List<int>> getRecordStream() async* {
  final recordStream = await _audioRecorder.startStream(
    const RecordConfig(
      encoder: AudioEncoder.pcm16bits,
      numChannels: 1,
      bitRate: 128000,
      sampleRate: PitchDetector.DEFAULT_SAMPLE_RATE,
    ),
  );

  yield* bufferedListStream(
    recordStream.map((event) {
      return event.toList();
    }),
    PitchDetector.DEFAULT_BUFFER_SIZE * 2,
  );
}

Stream<PitchDetectorResult> getPitchStream() async* {
  final recordStream = getRecordStream();

  await for (final buffer in recordStream) {
    final intBuffer = Uint8List.fromList(buffer);

    final pitch = await _pitchDetector.getPitchFromIntBuffer(intBuffer);

    yield pitch;
  }
}

Stream getNoteStream() async* {
  final pitchStream = getPitchStream();

  await for (final pitch in pitchStream) {
    if (pitch.pitched) {
      yield Notes.getClosestNoteAndOctaveFromFrequency(pitch.pitch);
    }
  }
}

void stopRecording() {
  _audioRecorder.stop();
  _audioRecorder.dispose();
}
