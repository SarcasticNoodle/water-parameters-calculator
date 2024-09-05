import 'package:bittersalt/provider/water_calculations.dart';
import 'package:flutter/material.dart';

import 'nutrient_info_display.dart';

class PhValueSlider extends StatefulWidget {
  const PhValueSlider({super.key});

  @override
  State<PhValueSlider> createState() => _PhValueSliderState();
}

class _PhValueSliderState extends State<PhValueSlider> {
  int _phValue = 70;

  NutrientAmount get phLevel {
    if (_phValue < 60) {
      return NutrientAmount.low;
    } else if (_phValue > 80) {
      return NutrientAmount.high;
    } else if (_phValue > 75 || _phValue < 65) {
      return NutrientAmount.marginal;
    } else {
      return NutrientAmount.optimal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ph-Wert (Erde nicht Hydroponisch)',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            NutrientInfoDisplay(
              value: _phValue,
              level: phLevel,
              unit: 'pH',
            ),
            switch (phLevel) {
              NutrientAmount.low => const Text('zu niedrig'),
              NutrientAmount.optimal => const Text('optimal'),
              NutrientAmount.high => const Text('zu hoch'),
              NutrientAmount.marginal => _phValue > 75
                  ? const Text('leicht zu hoch')
                  : const Text('leicht zu niedrig'),
            }
          ],
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('pH 4.8'),
              Expanded(
                child: Slider(
                  value: normalize(_phValue),
                  onChanged: (value) {
                    setState(() {
                      _phValue = denormalize(value);
                    });
                  },
                  min: 4.8,
                  max: 8.8,
                  divisions: 40,
                  label: 'ph ${normalize(_phValue)}',
                ),
              ),
              Text('pH 8.8'),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
