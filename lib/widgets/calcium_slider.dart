
import 'package:bittersalt/provider/water_calculations.dart';
import 'package:bittersalt/widgets/nutrient_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CalciumSlider extends ConsumerWidget {
  const CalciumSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calcium = ref.watch(calciumSliderProvider);

    return NutrientSlider(
      title: 'Calcium (Ca) aktueller Wert',
      value: calcium,
      min: kMinCalcium,
      max: kMaxCalcium,
      onChanged: (value) =>
      ref.read(calciumSliderProvider.notifier).state = value,
      level: ref.watch(selectedPlantPhaseProvider).calciumLevelOk(calcium),
    );
  }
}
