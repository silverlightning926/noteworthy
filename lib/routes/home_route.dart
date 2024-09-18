import 'package:flutter/material.dart';
import 'package:noteworthy/components/tuning_indicator.dart';

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "A",
                  style: TextStyle(
                    fontSize: 175,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "440 Hz",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
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
