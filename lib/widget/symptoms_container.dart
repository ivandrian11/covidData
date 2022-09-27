import 'package:flutter/material.dart';

class SymptomsContainer extends StatelessWidget {
  const SymptomsContainer({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Color(0xffFFE7E3),
      ),
      child: Column(
        children: [
          Flexible(
            child: Image.asset('assets/$label.png'),
          ),
          SizedBox(height: 6),
          Text(label),
        ],
      ),
    );
  }
}
