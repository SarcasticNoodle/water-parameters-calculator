import 'package:bittersalt/widgets/calcium_magnesium_calculator.dart';
import 'package:bittersalt/widgets/calcium_slider.dart';
import 'package:bittersalt/widgets/calcium_target_slider.dart';
import 'package:bittersalt/widgets/growth_stage_selector.dart';
import 'package:bittersalt/widgets/magnesium_slider.dart';
import 'package:bittersalt/widgets/magnesium_target_slider.dart';
import 'package:bittersalt/widgets/ph_value_slider.dart';
import 'package:bittersalt/widgets/required_nutrients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/water_calculations.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wasserwat?'),
      ),
      body: LayoutBuilder(
        builder: (context, layout) {
          return Column(
            children: [
              Center(
                child: Container(
                  width: layout.maxWidth > 600 ? 600 : layout.maxWidth,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PhValueSlider(),
                        Text(
                          'Wachstumsphase',
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge,
                        ),
                        const Center(
                          child: GrowthStageSelector(),
                        ),
                        const SizedBox(height: 16),
                        Consumer(
                          builder: (context, ref, child) {
                            return SwitchListTile(
                              value: ref.watch(inCalculatorModeProvider),
                              onChanged: (value) {
                                ref
                                    .read(inCalculatorModeProvider.notifier)
                                    .state = value;
                              },
                              title: const Text('Zielwerte anzeigen'),
                            );
                          },
                        ),
                        const CalciumSlider(),
                        const CalciumTargetSlider(),
                        const MagnesiumSlider(),
                        const MagnesiumTargetSlider(),
                        const CalciumMagnesiumCalculator(),
                        const RequiredNutrients(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
