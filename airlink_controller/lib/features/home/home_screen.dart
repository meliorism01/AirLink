import 'package:flutter/material.dart';
import '../../shared/widgets/device_card.dart';
import '../ac/ac_screen.dart';
import '../bluetooth/bluetooth_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AirLink"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              "Good Evening 👋",
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "My Devices",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            DeviceCard(
              title: "Living Room AC",
              status: "Bluetooth Ready",
              icon: Icons.ac_unit,
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const ACScreen(),
    ),
  );
},
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const BluetoothScreen(),
      ),
    );
  },
                icon: const Icon(Icons.add),
                label: const Text("Add Device"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}