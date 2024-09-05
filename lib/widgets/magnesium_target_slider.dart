
import 'package:bittersalt/provider/water_calculations.dart';
import 'package:bittersalt/widgets/nutrient_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MagnesiumTargetSlider extends ConsumerWidget {
  const MagnesiumTargetSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final magnesium = ref.watch(magnesiumTargetSliderProvider);
    final targetValuesEnabled = ref.watch(inCalculatorModeProvider);

    if (!targetValuesEnabled) {
      return const SizedBox.shrink();
    }

    return NutrientSlider(
      title: 'Magnesium (Mg) Ziel Wert',
      value: magnesium,
      min: kMinMagnesium,
      max: kMaxMagnesium,
      onChanged: (value) =>
      ref.read(magnesiumTargetSliderProvider.notifier).state = value,
      level: ref.watch(selectedPlantPhaseProvider).magnesiumLevelOk(magnesium),
    );
  }
}
