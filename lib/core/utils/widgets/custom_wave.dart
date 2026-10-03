import 'package:flutter/material.dart';
import 'package:wave_widget/wave_widget.dart';

class CustomWave extends StatelessWidget {
  const CustomWave({super.key});

  @override
  Widget build(BuildContext context) {
    return WavesWidget(
      size: const Size(double.infinity, 250),
      waveLayers: [
        WaveLayer.solid(
          duration: 10000,
          heightFactor: 0.8,
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
        ),
      ],
    );
  }
}
