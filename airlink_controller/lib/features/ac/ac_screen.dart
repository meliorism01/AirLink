import 'package:flutter/material.dart';
import '../../shared/widgets/control_card.dart';
import '../../shared/widgets/temperature_control.dart';
import '../../shared/widgets/segment_selector.dart';

class ACScreen extends StatefulWidget {
  const ACScreen({super.key});

  @override
  State<ACScreen> createState() => _ACScreenState();
}

class _ACScreenState extends State<ACScreen> {
  bool power = true;
bool swing = false;

int temperature = 24;

String mode = "COOL";
String fanSpeed = "AUTO";
  // ----------------------------
  // Dynamic Icon
  // ----------------------------
  IconData getModeIcon() {
    switch (mode) {
      case "COOL":
        return Icons.ac_unit;
      case "DRY":
        return Icons.water_drop;
      case "FAN":
        return Icons.air;
      case "AUTO":
        return Icons.smart_toy;
      default:
        return Icons.ac_unit;
    }
  }

  // ----------------------------
  // Dynamic Color
  // ----------------------------
  Color getModeColor() {
    switch (mode) {
      case "COOL":
        return Colors.cyan;
      case "DRY":
        return Colors.orange;
      case "FAN":
        return Colors.green;
      case "AUTO":
        return Colors.deepPurple;
      default:
        return Colors.cyan;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Living Room AC"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              Icon(
                getModeIcon(),
                size: 90,
                color: getModeColor(),
              ),

              const SizedBox(height: 20),

              Text(
                "$temperature°C",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "$mode MODE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: getModeColor(),
                ),
              ),

              const SizedBox(height: 35),

             Column(
  children: [

    Row(
      children: [
        ControlCard(
          icon: power
              ? Icons.power_settings_new
              : Icons.power_off,
          title: power ? "Power ON" : "Power OFF",
          selected: power,
          onTap: () {
            setState(() {
              power = !power;
            });
          },
        ),

        ControlCard(
          icon: Icons.swap_vert,
          title: "Swing",
          selected: swing,
          onTap: () {
            setState(() {
              swing = !swing;
            });
          },
        ),
      ],
    ),

    Row(
      children: [
        ControlCard(
          icon: Icons.air,
          title: fanSpeed,
          selected: true,
          onTap: () {},
        ),

        ControlCard(
          icon: Icons.timer,
          title: "Timer",
          selected: false,
          onTap: () {},
        ),
      ],
    ),

  ],
),

              const SizedBox(height: 30),

              TemperatureControl(
                temperature: temperature,
                onIncrease: () {
                  if (temperature < 30) {
                    setState(() {
                      temperature++;
                    });
                  }
                },
                onDecrease: () {
                  if (temperature > 16) {
                    setState(() {
                      temperature--;
                    });
                  }
                },
              ),

              const SizedBox(height: 30),

              SegmentSelector(
                title: "Mode",
                items: const [
                  "COOL",
                  "DRY",
                  "FAN",
                  "AUTO",
                ],
                selectedItem: mode,
                onChanged: (value) {
                  setState(() {
                    mode = value;
                  });
                },
              ),

              const SizedBox(height: 30),

SegmentSelector(
  title: "Fan Speed",
  items: const [
    "AUTO",
    "LOW",
    "MEDIUM",
    "HIGH",
  ],
  selectedItem: fanSpeed,
  onChanged: (value) {
    setState(() {
      fanSpeed = value;
    });
  },
),
            ],
          ),
        ),
      ),
    );
  }
}