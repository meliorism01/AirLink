#include <Arduino.h>

#include <NimBLEDevice.h>

#include <IRremoteESP8266.h>
#include <IRsend.h>
#include <ir_Hitachi.h>
#define SERVICE_UUID        "12345678-1234-1234-1234-1234567890ab"
#define CHARACTERISTIC_UUID "abcdefab-1234-5678-1234-abcdefabcdef"
const uint16_t IR_PIN = 4;

IRHitachiAc1 ac(IR_PIN);

String receivedCommand = "";
bool deviceConnected = false;
NimBLEServer* pServer = nullptr;
NimBLEService* pService = nullptr;
NimBLECharacteristic* pCharacteristic = nullptr;

class CommandCallbacks : public NimBLECharacteristicCallbacks {

  void onWrite(NimBLECharacteristic* pCharacteristic,
               NimBLEConnInfo& connInfo) override {

    receivedCommand = pCharacteristic->getValue();

    Serial.print("Received: ");
    Serial.println(receivedCommand);
  }
};

class ServerCallbacks : public NimBLEServerCallbacks {

  void onConnect(NimBLEServer* pServer,
                 NimBLEConnInfo& connInfo) override {

    deviceConnected = true;

    Serial.println("Flutter Connected");
  }

  void onDisconnect(NimBLEServer* pServer,
                    NimBLEConnInfo& connInfo,
                    int reason) override {

    deviceConnected = false;

    Serial.println("Flutter Disconnected");

    NimBLEDevice::startAdvertising();
  }
};

void setup() {

  Serial.begin(115200);

  ac.begin();

  ac.setModel(R_LT0541_HTA_A);

  NimBLEDevice::init("AirLink-01");
  NimBLEDevice::setDeviceName("AirLink-01");

  pServer = NimBLEDevice::createServer();

  pServer->setCallbacks(new ServerCallbacks());

  pService =
      pServer->createService(SERVICE_UUID);

  pCharacteristic =
      pService->createCharacteristic(
          CHARACTERISTIC_UUID,
          NIMBLE_PROPERTY::WRITE);

  pCharacteristic->setCallbacks(
      new CommandCallbacks());

  pService->start();

  NimBLEAdvertising* advertising =
      NimBLEDevice::getAdvertising();

  advertising->addServiceUUID(
      SERVICE_UUID);

  advertising->setName("AirLink-01");
advertising->enableScanResponse(true);
advertising->start();

  Serial.println("==============================");
  Serial.println("AirLink BLE Ready");
  Serial.println("==============================");
}

void loop() {

  if (receivedCommand.length() > 0) {

    Serial.print("Executing: ");
    Serial.println(receivedCommand);

    // ---------------- POWER ----------------

    if (receivedCommand == "POWER:ON") {

      ac.on();
      ac.send();

      Serial.println("Power ON");

    }

    else if (receivedCommand == "POWER:OFF") {

      ac.off();
      ac.send();

      Serial.println("Power OFF");

    }

    // ---------------- TEMPERATURE ----------------

    else if (receivedCommand.startsWith("TEMP:")) {

      int temp = receivedCommand.substring(5).toInt();

      if (temp >= 16 && temp <= 30) {

        ac.setTemp(temp);
        ac.send();

        Serial.print("Temperature -> ");
        Serial.println(temp);
      }
    }

    // ---------------- MODE ----------------

    else if (receivedCommand == "MODE:COOL") {

      ac.setMode(kHitachiAc1Cool);
      ac.send();

      Serial.println("Mode -> COOL");

    }

    else if (receivedCommand == "MODE:DRY") {

      ac.setMode(kHitachiAc1Dry);
      ac.send();

      Serial.println("Mode -> DRY");

    }

    else if (receivedCommand == "MODE:AUTO") {

      ac.setMode(kHitachiAc1Auto);
      ac.send();

      Serial.println("Mode -> AUTO");

    }

    // ---------------- FAN ----------------

    else if (receivedCommand == "FAN:LOW") {

      ac.setFan(kHitachiAc1FanLow);
      ac.send();

      Serial.println("Fan -> LOW");

    }

    else if (receivedCommand == "FAN:MEDIUM") {

      ac.setFan(kHitachiAc1FanMed);
      ac.send();

      Serial.println("Fan -> MEDIUM");

    }

    else if (receivedCommand == "FAN:HIGH") {

      ac.setFan(kHitachiAc1FanHigh);
      ac.send();

      Serial.println("Fan -> HIGH");

    }

    // ---------------- SWING ----------------

    else if (receivedCommand == "SWING:ON") {

      ac.setSwingV(true);
      ac.send();

      Serial.println("Swing -> ON");

    }

    else if (receivedCommand == "SWING:OFF") {

      ac.setSwingV(false);
      ac.send();

      Serial.println("Swing -> OFF");

    }

    receivedCommand = "";

  }

  delay(10);
}