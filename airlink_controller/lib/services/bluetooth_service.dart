import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class AirLinkBluetoothService  {
  BluetoothDevice? connectedDevice;

  Future<void> connect(BluetoothDevice device) async {
    try {
      await device.connect();

      connectedDevice = device;

      print("Connected to ${device.platformName}");
    } catch (e) {
      print("Connection Error: $e");
    }
  }

  Future<void> disconnect() async {
    await connectedDevice?.disconnect();
  }
}