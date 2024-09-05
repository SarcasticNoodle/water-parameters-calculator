import 'package:bittersalt/provider/water_calculations.dart';
import 'package:bittersalt/widgets/nutrient_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MagnesiumSlider extends ConsumerWidget {
  const MagnesiumSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final magnesium = ref.watch(magnesiumSliderProvider);

    return NutrientSlider(
      title: 'Magnesium (Mg) aktueller Wert',
      value: magnesium,
      min: kMinMagnesium,
      max: kMaxMagnesium,
      onChanged: (value) =>
          ref.read(magnesiumSliderProvider.notifier).state = value,
      level: ref.watch(selectedPlantPhaseProvider).magnesiumLevelOk(magnesium),
    );
  }
}
