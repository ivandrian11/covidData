import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  const DataContainer({
    Key? key,
    required this.color,
    required this.data,
    required this.label,
  }) : super(key: key);

  final Color color;
  final int data;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, color: color),
          ),
          Text(
            "$data",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 18,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
