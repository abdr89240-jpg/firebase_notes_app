import 'package:flutter/material.dart';

class ProgressComponent extends StatelessWidget {
  const ProgressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey.withValues(alpha: .3),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}