import 'dart:math';

enum Notes {
  none(note: "-", frequencies: []),
  a(note: "A", frequencies: [
    27.5,
    55,
    110,
    220,
    440,
    880,
    1760,
    3520,
    7040,
  ]),
  aSharp(note: "A♯", frequencies: [
    29.14,
    58.27,
    116.54,
    233.08,
    466.16,
    932.33,
    1864.66,
    3729.31,
    7458.62,
  ]),
  b(note: "B", frequencies: [
    30.87,
    61.74,
    123.47,
    246.94,
    493.88,
    987.77,
    1975.53,
    3951.07,
    7902.13,
  ]),
  c(note: "C", frequencies: [
    16.35,
    32.7,
    65.41,
    130.81,
    261.63,
    523.25,
    1046.5,
    2093,
    4186.01,
  ]),
  cSharp(note: "C♯", frequencies: [
    17.32,
    34.65,
    69.3,
    138.59,
    277.18,
    554.37,
    1108.73,
    2217.46,
    4434.92,
  ]),
  d(note: "D", frequencies: [
    18.35,
    36.71,
    73.42,
    146.83,
    293.66,
    587.33,
    1174.66,
    2349.32,
    4698.63,
  ]),
  dSharp(note: "D♯", frequencies: [
    19.45,
    38.89,
    77.78,
    155.56,
    311.13,
    622.25,
    1244.51,
    2489.02,
    4978.03,
  ]),
  e(note: "E", frequencies: [
    20.6,
    41.2,
    82.41,
    164.81,
    329.63,
    659.25,
    1318.51,
    2637.02,
    5274.04,
  ]),
  f(note: "F", frequencies: [
    21.83,
    43.65,
    87.31,
    174.61,
    349.23,
    698.46,
    1396.91,
    2793.83,
    5587.65,
  ]),
  fSharp(note: "F♯", frequencies: [
    23.12,
    46.25,
    92.5,
    185,
    369.99,
    739.99,
    1479.98,
    2959.96,
    5919.91,
  ]),
  g(note: "G", frequencies: [
    24.5,
    49,
    98,
    196,
    392,
    783.99,
    1567.98,
    3135.96,
    6271.93,
  ]),
  gSharp(note: "G♯", frequencies: [
    25.96,
    51.91,
    103.83,
    207.65,
    415.3,
    830.61,
    1661.22,
    3322.44,
    6644.88,
  ]);

  const Notes({
    required this.note,
    required this.frequencies,
  });

  final String note;
  final List<double> frequencies;

  static double calculateCents(double inputFrequency, double closestFrequency) {
    return 1200 * log(inputFrequency / closestFrequency) / log(2);
  }

  static Map<String, dynamic> getClosestNoteAndOctaveFromFrequency(
      double frequency) {
    var closestNote = Notes.none;
    var closestFrequency = -1.0;
    var closestDistance = double.infinity;
    int octave = -1;

    for (final note in Notes.values) {
      for (int i = 0; i < note.frequencies.length; i++) {
        final noteFrequency = note.frequencies[i];
        final distance = (noteFrequency - frequency).abs();

        if (distance < closestDistance) {
          closestNote = note;
          closestFrequency = noteFrequency;
          closestDistance = distance;
          octave =
              i;
        }
      }
    }

    int centsDeviation = calculateCents(frequency, closestFrequency).round();

    return {
      'note': closestNote,
      'octave': octave,
      'closestFrequency': closestFrequency,
      'centsDeviation': centsDeviation,
    };
  }
}
