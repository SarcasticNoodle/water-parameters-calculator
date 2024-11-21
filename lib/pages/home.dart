import 'package:bittersalt/pages/home/stock_solution_calculator.dart';
import 'package:bittersalt/pages/home/water_calculator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wasserwat?'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children:  const [
          WaterCalculator(),
          StockSolutionCalculator(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (current) => setState(() {
          _currentIndex = current;
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.water),
            label: 'Water Calulator',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate),
            label: 'Stock Solution',
          ),

        ],
      ),
    );
  }
}
