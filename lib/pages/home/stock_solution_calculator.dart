import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockSolutionCalculator extends ConsumerStatefulWidget {
  const StockSolutionCalculator({super.key});

  @override
  ConsumerState createState() => _StockSolutionCalculatorState();
}

class _StockSolutionCalculatorState
    extends ConsumerState<StockSolutionCalculator> {
  final TextEditingController _stockSolutionController =
      TextEditingController();
  final TextEditingController _targetSolutionController =
      TextEditingController();
  final TextEditingController _targetSolutionVolume = TextEditingController();
  num _neededStockSolution = -1;

  @override
  void initState() {
    _stockSolutionController.addListener(recalculate);
    _targetSolutionController.addListener(recalculate);
    _targetSolutionVolume.addListener(recalculate);

    super.initState();
  }

  void _updateNeededStockSolution(num stockSolutionConcentration, num targetSolutionConcentration, num targetSolutionVolume) {
    if (stockSolutionConcentration <= 0 || targetSolutionConcentration <= 0 || targetSolutionVolume <= 0) {
      setState(() {
        _neededStockSolution = -1;
      });
      return;
    }

    final neededStockSolution = (targetSolutionConcentration * targetSolutionVolume) /
        stockSolutionConcentration;

    setState(() {
      _neededStockSolution = neededStockSolution;
    });
  }

  void recalculate() {
    final result = [num.tryParse(_stockSolutionController.text), num.tryParse(_targetSolutionController.text), num.tryParse(_targetSolutionVolume.text)];
    switch (result) {
      case [num stockSolutionConcentration, num targetSolutionConcentration, num targetSolutionVolume]:
        _updateNeededStockSolution(stockSolutionConcentration, targetSolutionConcentration, targetSolutionVolume);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          TextField(
            controller: _stockSolutionController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Stock Solution'),
              suffixText: 'g/L',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _targetSolutionController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Target Solution'),
              suffixText: 'g/L',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _targetSolutionVolume,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Target Solution Volume'),
              suffixText: 'L',
            ),
          ),

          SizedBox(height: 16),
          Text('Need Stock Solution: ${_neededStockSolution}ml'),
        ],
      ),
    );
  }
}
