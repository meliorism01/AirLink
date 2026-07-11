enum DeviceType {
  ac,
  tv,
}

class Device {
  final String id;
  final String name;
  final DeviceType type;
  bool connected;

  Device({
    required this.id,
    required this.name,
    required this.type,
    this.connected = false,
  });
}