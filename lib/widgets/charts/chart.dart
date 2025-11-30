import 'package:flutter/material.dart';
import 'package:expense_create/models/expense.dart';
import 'package:expense_create/widgets/charts/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotal = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotal) {
        maxTotal = bucket.totalExpenses;
      }
    }
    return maxTotal;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8), // FIXED
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: isDarkMode
              ? [Colors.blueGrey.shade900, Colors.blueGrey.shade700]
              : [const Color(0xFFB3E5FC), const Color(0xFFE1F5FE)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: buckets.map((bucket) {
          final double fill = maxTotalExpense == 0
              ? 0
              : (bucket.totalExpenses / maxTotalExpense).toDouble();

          return Expanded(
            child: Column(
              children: [
                SizedBox(height: 100, child: ChartBar(fill: fill)),

                const SizedBox(height: 4),

                Icon(
                  categoryIcons[bucket.category] ?? Icons.help_outline,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
