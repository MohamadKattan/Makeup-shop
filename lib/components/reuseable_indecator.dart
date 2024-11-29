import 'package:flutter/material.dart';

class ReuseableIndecators {
  static circles(List list, int current) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: List.generate(
          list.length,
          (index) => Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: current == index ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
