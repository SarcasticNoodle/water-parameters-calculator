
import 'package:bittersalt/provider/water_calculations.dart';
import 'package:bittersalt/widgets/nutrient_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CalciumTargetSlider extends ConsumerWidget {
  const CalciumTargetSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calcium = ref.watch(calciumTargetSliderProvider);
    final targetValuesEnabled = ref.watch(inCalculatorModeProvider);

    if (!targetValuesEnabled) {
      return const SizedBox.shrink();
    }

    return NutrientSlider(
      title: 'Calcium (Ca) Ziel Wert',
      value: calcium,
      min: kMinCalcium,
      max: kMaxCalcium,
      onChanged: (value) =>
      ref.read(calciumTargetSliderProvider.notifier).state = value,
      level: ref.watch(selectedPlantPhaseProvider).calciumLevelOk(calcium),
    );
  }
}
