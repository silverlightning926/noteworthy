import 'package:flutter/material.dart';

class TuningIndicator extends StatefulWidget {
  final double value;

  const TuningIndicator({
    super.key,
    required this.value,
  });

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
        ((widget.value + 1) * (containerHeights.length - 1) / 2)
            .clamp(0, containerHeights.length - 1)
            .toInt();

    return Row(
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
            color: index == highlightedIndex
                ? getColorForIndex(index)
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
