import 'package:flutter/material.dart';

class TabOption extends StatelessWidget {
  const TabOption({
    Key? key,
    required this.onTap,
    required this.isTrackerOn,
    required this.text,
  }) : super(key: key);

  final void Function() onTap;
  final bool isTrackerOn;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isTrackerOn ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: isTrackerOn ? Color(0xff142237) : Color(0xffA74813),
                fontWeight: isTrackerOn ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
