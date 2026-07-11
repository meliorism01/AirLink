import 'package:flutter/material.dart';

class TemperatureControl extends StatelessWidget {
  final int temperature;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const TemperatureControl({
    super.key,
    required this.temperature,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D24),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            "Temperature",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton.filled(
                onPressed: onDecrease,
                icon: const Icon(Icons.remove),
              ),

              Text(
                "$temperature°C",
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),

              IconButton.filled(
                onPressed: onIncrease,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}