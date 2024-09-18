import 'package:flutter/material.dart';
import 'package:noteworthy/components/tuning_indicator.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "A",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 175,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TuningIndicator(
              value: 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
