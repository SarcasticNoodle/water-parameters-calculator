import 'package:bittersalt/provider/water_calculations.dart';
import 'package:flutter/material.dart';

import 'nutrient_info_display.dart';

class NutrientSlider extends StatelessWidget {
  final String title;
  final int value;
  final int min;
  final int max;
  final NutrientAmount level;

  final void Function(int) onChanged;

  const NutrientSlider({
    super.key,
    required this.title,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        NutrientInfoDisplay(value: value, level: level),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('$min mg/L'),
              Expanded(
                child: Slider(
                  value: normalize(value),
                  onChanged: (value) {
                    onChanged(denormalize(value));
                  },
                  min: normalize(min),
                  max: normalize(max),
                  divisions: 1000,
                  label: '$title: ${normalize(value).toStringAsFixed(2)}mg/L',
                ),
              ),
              Text('${normalize(max)} mg/L'),
            ],
          ),
        ),
      ],
    );
  }
}
