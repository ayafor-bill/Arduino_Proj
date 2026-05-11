# Interactive 3D LDR-Based Control System

A hardware–software interface system that maps ambient light intensity from two LDR sensors to real-time 3D object rotation using Arduino and Processing (P3D).

---

## System Overview

The system translates analog light intensity variations into rotational velocity commands for a 3D object rendered in Processing. Two LDR sensors represent orthogonal axes:

- LDR X → Horizontal rotation (Yaw)
- LDR Y → Vertical rotation (Pitch)

Arduino samples sensor data and streams it via serial communication to a Processing visualization engine.

---

## Hardware Components

- Arduino Uno
- 2 × LDR (Photoresistors)
- 2 × 10kΩ resistors (voltage divider configuration)
- Physical light isolation barrier (to reduce cross-axis interference)

---

## Software Stack

- Arduino C/C++
- Processing 4.x (P3D renderer)
- Serial communication (9600 baud)

---

## Signal Processing Model

### 1. Velocity-Based Mapping
Instead of direct positional mapping, sensor readings are converted into rotational velocity:

- Below threshold → negative rotation
- Above threshold → positive rotation
- Within threshold band → no movement (deadzone)

This prevents jitter and allows continuous rotation behavior.

---

### 2. Noise Reduction Strategy

A deadzone is implemented per axis:

- Eliminates minor fluctuations caused by ambient light noise
- Prevents unintended micro-rotations

Thresholds are calibrated empirically per sensor response curve.

---

### 3. Axis Decoupling

To prevent cross-axis interference:

- Physical light barrier separates LDR fields
- Independent thresholding applied per channel

---

## Serial Data Format

Arduino outputs normalized sensor values as:


Processing parses and maps values to rotational velocity vectors.

---

## Setup Instructions

### Arduino
1. Upload `*.ino`
2. Ensure Serial output is set to 9600 baud
3. Do not open Serial Monitor during Processing execution

### Processing
1. Set correct serial port index in code
2. Run sketch using P3D renderer

---

## Key Design Insight

This system prioritizes **stability over direct responsiveness**, using velocity accumulation and deadband filtering to achieve smooth 3D control from inherently noisy analog sensors.

---

## Future Improvements

- Kalman filtering for sensor smoothing
- Adaptive threshold calibration
- Wireless sensor integration (BLE/ESP32)
- Gesture classification layer above raw analog input

---
