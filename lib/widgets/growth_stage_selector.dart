import 'package:bittersalt/provider/water_calculations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GrowthStageSelector extends ConsumerWidget {
  const GrowthStageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selectedPlantPhase = ref.watch(selectedPlantPhaseProvider);

    return SegmentedButton<PlantPhase>(
      segments: PlantPhase.values.map(
            (phase) => ButtonSegment(
          value: phase,
          label: switch (phase) {
            PlantPhase.seedling => const Text('Sämling'),
            PlantPhase.vegetative => const Text('Veg.'),
            PlantPhase.flowering => const Text('Blüte'),
          },
          icon: switch (phase) {
            PlantPhase.seedling => const Icon(Icons.sports_rugby_outlined),
            PlantPhase.vegetative => const Icon(Icons.eco_outlined),
            PlantPhase.flowering => const Icon(Icons.eco),
          },
        ),
      ).toList(),
      multiSelectionEnabled: false,
      onSelectionChanged: (phase) {
        ref.read(selectedPlantPhaseProvider.notifier).state = phase.firstOrNull ?? selectedPlantPhase;
      },
      selected: {selectedPlantPhase},
    );
  }
}