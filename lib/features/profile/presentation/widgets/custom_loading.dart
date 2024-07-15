import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
