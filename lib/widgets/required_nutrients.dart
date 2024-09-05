import 'package:bittersalt/provider/water_calculations.dart';
import 'package:bittersalt/widgets/required_water_nutrients_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequiredNutrients extends ConsumerWidget {
  const RequiredNutrients({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calcium = normalize(ref.watch(calciumSliderProvider));
    final magnesium = normalize(ref.watch(magnesiumSliderProvider));
    final targetValuesEnabled = ref.watch(inCalculatorModeProvider);
    final calciumTarget = normalize(ref.watch(calciumTargetSliderProvider));
    final magnesiumTarget = normalize(ref.watch(magnesiumTargetSliderProvider));

    final perfectCalcium =
        targetValuesEnabled ? calciumTarget : kOptimalCalMagRatio * magnesium;
    final requiredCalciumDiff = perfectCalcium - calcium;

    final perfectMagnesium =
        targetValuesEnabled ? magnesiumTarget : calcium / kOptimalCalMagRatio;
    final requiredMagnesiumDiff = perfectMagnesium - magnesium;

    if (targetValuesEnabled ? false : requiredMagnesiumDiff.abs() < 5 && requiredCalciumDiff.abs() < 5) {
      return Center(
        child: Column(
          children: [
            SizedBox(height: 8),
            Icon(
              Icons.water_drop_outlined,
              size: 40,
              color: Colors.blue,
            ),
            Text(
              'Dein Wasser ist perfekt eingestellt!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              targetValuesEnabled ? 'Differenz von Ziel und aktuellem Wert:' : 'Bitte passe deine Wasserwerte an:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => RequiredWaterNutrientsInfoDialog(),
              ),
              icon: Icon(Icons.info),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text('Calcium: ${requiredCalciumDiff.toStringAsFixed(2)}mg/L'),
        const SizedBox(width: 8),
        Text(
          'Magnesium: ${requiredMagnesiumDiff.toStringAsFixed(2)}mg/L',
        ),
        if (!requiredMagnesiumDiff.isNegative)
          Text(
            '${(requiredMagnesiumDiff * kBitterSaltRatio).toStringAsFixed(2)}g Bittersalz',
          ),
        if (!requiredCalciumDiff.isNegative)
          Text(
            '${(requiredCalciumDiff * kCalciumNitrateRatio).toStringAsFixed(2)}g Calcium Nitrate',
          ),
      ],
    );
  }
}
