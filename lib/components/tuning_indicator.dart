import 'package:flutter/material.dart';

class TuningIndicator extends StatefulWidget {
  final int cents;

  const TuningIndicator({
    super.key,
    required this.cents,
  }) : assert(
          cents > -100 && cents < 100,
          "Cents must be between -100 and 100",
        );

  @override
  State<TuningIndicator> createState() => _TuningIndicatorState();
}

class _TuningIndicatorState extends State<TuningIndicator> {
  final List<int> containerHeights = [
    40,
    40,
    40,
    70,
    70,
    100,
    70,
    70,
    40,
    40,
    40
  ];

  final Color centerColor = Colors.green;
  final Color middleColor = Colors.yellow;
  final Color outerColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    Color getColorForIndex(int index) {
      int centerIndex = containerHeights.length ~/ 2;
      int range = containerHeights.length ~/ 3;

      if (index == centerIndex) {
        return centerColor;
      } else if (index < centerIndex - range || index > centerIndex + range) {
        return outerColor;
      } else {
        return middleColor;
      }
    }

    int highlightedIndex =
        (((widget.cents / 100) + 1) * (containerHeights.length - 1) / 2)
            .clamp(0, containerHeights.length - 1)
            .toInt();

    Color highlightColor = getColorForIndex(highlightedIndex);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            containerHeights.length,
            (index) => Container(
              height: containerHeights[index].toDouble(),
              width: 5,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: index == highlightedIndex ? highlightColor : Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          "${widget.cents == 0 ? "" : widget.cents > 0 ? "+" : ""} ${widget.cents} cents",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: highlightColor,
          ),
        ),
      ],
    );
  }
}
