import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class AirLinkBluetoothService {
  static final AirLinkBluetoothService _instance =
      AirLinkBluetoothService._internal();

  factory AirLinkBluetoothService() => _instance;

  AirLinkBluetoothService._internal();

  BluetoothDevice? connectedDevice;
  BluetoothCharacteristic? commandCharacteristic;

  Future<void> connect(BluetoothDevice device) async {
    try {
      await device.connect();

      connectedDevice = device;

      final services = await device.discoverServices();

      for (final service in services) {
        print("SERVICE: ${service.uuid}");

        for (final characteristic in service.characteristics) {
          print("   CHARACTERISTIC: ${characteristic.uuid}");
        }
      }

      for (final service in services) {
        if (service.uuid.toString() ==
            "12345678-1234-1234-1234-1234567890ab") {
          for (final characteristic in service.characteristics) {
            if (characteristic.uuid.toString() ==
                "abcdefab-1234-5678-1234-abcdefabcdef") {
              commandCharacteristic = characteristic;

              print("✅ Command Characteristic Found");
            }
          }
        }
      }

      print("✅ Connected to ${device.platformName}");
    } catch (e) {
      print("❌ Connection Error: $e");
    }
  }

  Future<void> sendCommand(String command) async {
    if (commandCharacteristic == null) {
      print("❌ Characteristic not found");
      return;
    }

    await commandCharacteristic!.write(
      command.codeUnits,
      withoutResponse: false,
    );

    print("📤 Sent: $command");
  }

  Future<void> disconnect() async {
    await connectedDevice?.disconnect();

    connectedDevice = null;
    commandCharacteristic = null;

    print("🔌 Disconnected");
  }
}