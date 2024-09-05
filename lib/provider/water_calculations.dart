import 'package:flutter_riverpod/flutter_riverpod.dart';


const kMinCalcium = 0;
const kMinMagnesium = 0;
const kMaxCalcium = 1500;
const kMaxMagnesium = 600;

/// 0.01g of bitter salt per 1L of water raises the magnesium level by 1mg/L
const kBitterSaltRatio = 1 / 96;

const kCalciumNitrateRatio = 1 / 184.6;

const kFactor = 10;

double normalize(int value) {
  return (value / kFactor);
}

int denormalize(double value) {
  return (value * kFactor).round();
}

const kOptimalCalMagRatio = 3 / 1;


enum NutrientAmount {
  low,
  high,
  marginal,
  optimal;
}

enum PlantPhase {
  seedling,
  vegetative,
  flowering;

  NutrientAmount _isInRange(num value, num low, num lowMargin, num up, num upMargin) {
    if (value < low) {
      return NutrientAmount.low;
    } else if (value > up) {
      return NutrientAmount.high;
    } else if (value < low + lowMargin || value > up - upMargin) {
      return NutrientAmount.marginal;
    } else {
      return NutrientAmount.optimal;
    }
  }

  NutrientAmount calciumLevelOk(int calcium) {
    return switch (this) {
      PlantPhase.seedling => _isInRange(calcium, 240, 60, 720, 120),
      PlantPhase.vegetative => _isInRange(calcium, 360, 90, 1080, 180),
      PlantPhase.flowering => _isInRange(calcium, 480, 120, 1440, 240),
    };
  }

  NutrientAmount magnesiumLevelOk(int magnesium) {
    return switch (this) {
      PlantPhase.seedling => _isInRange(magnesium, 80, 20, 240, 40),
      PlantPhase.vegetative => _isInRange(magnesium, 120, 30, 270, 45),
      PlantPhase.flowering => _isInRange(magnesium, 120, 30, 480, 79),
    };
  }

  NutrientAmount calciumMagnesiumRatioOk(double ratio) => _isInRange(ratio, 2, 0.5, 4, 0.5);
}

final selectedPlantPhaseProvider = StateProvider<PlantPhase>((ref) {
  return PlantPhase.seedling;
});

final inCalculatorModeProvider = StateProvider<bool>((ref) {
  return false;
});

final calciumSliderProvider = StateProvider<int>((ref) {
  return 600;
});

final calciumTargetSliderProvider = StateProvider<int>((ref) {
  return 600;
});

final magnesiumSliderProvider = StateProvider<int>((ref) {
  return 200;
});

final magnesiumTargetSliderProvider = StateProvider<int>((ref) {
  return 200;
});
