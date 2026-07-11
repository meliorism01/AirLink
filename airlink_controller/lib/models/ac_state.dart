enum ACMode {
  cool,
  dry,
  fan,
  auto,
}

enum FanSpeed {
  auto,
  low,
  medium,
  high,
}

class ACState {
  bool power;
  bool swing;

  int temperature;

  ACMode mode;

  FanSpeed fanSpeed;

  ACState({
    this.power = true,
    this.swing = false,
    this.temperature = 24,
    this.mode = ACMode.cool,
    this.fanSpeed = FanSpeed.auto,
  });

  Map<String, dynamic> toJson() {
    return {
      "power": power,
      "swing": swing,
      "temperature": temperature,
      "mode": mode.name,
      "fanSpeed": fanSpeed.name,
    };
  }
}