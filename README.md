# MC Microcontroller Project

A compact and versatile 8051-based embedded demonstration integrating an LCD attendance counter, seven‑segment timer, LED signaling, sensor-driven logic, and stepper motor control—developed using Keil uVision and ProgISP.

---

## Description

This project includes two main routines:

1. **LCD Attendance Counter**  
   Displays **"ATTENDENCE"** on a 16×2 LCD.  
   Detects input on P0.0 and P0.1 with debounce logic to increment/decrement a counter. Updates the display in a `CT:xx` format.

2. **Sensor-Driven Timer and Stepper Sequence**  
   Monitors sensors on P3.0 and P3.1 to trigger:  
   - A **7‑segment countdown** (0–9) displayed on P0.  
   - **Red/green LEDs** toggled via P1.1 and P1.0.  
   - **Stepper motor control** through P2.0–P2.3 according to logic sequence and simple automation flow.

---

## Requirements

### Development Tools
- **Keil uVision** (8051 IDE)
- **ProgISP** (Programmer)

### Hardware Components
- 8051-based microcontroller board (e.g., AT89C51)
- 16×2 LCD display
- 7‑segment display
- Red LED (P1.1), Green LED (P1.0)
- Stepper motor (via P2.0–P2.3)
- Sensors (e.g., IR / push buttons) connected to P3.0 & P3.1

### Optional
- **Proteus** or similar simulator for visual testing and debugging

---

## How to Use

1. Clone or open the project in Keil uVision.  
2. Build the code to generate the HEX file.  
3. Use ProgISP to flash the HEX file onto the 8051 microcontroller.  
4. Wire up the hardware components according to the pin configuration.  
5. Power up the system:
   - **LCD Mode**: Displays “ATTENDENCE” and activates the counter.  
   - **Secondary Mode**: Sensor inputs trigger a sequence with the 7‑segment display, LEDs, and stepper motor.

---

## Pin Configuration Reference

| Module              | Port / Pins             |
|---------------------|-------------------------|
| LCD                 | P2, P3.0 – P3.2         |
| 7‑Segment Display   | P0                      |
| LEDs                | Red: P1.1, Green: P1.0  |
| Stepper Motor       | P2.0 – P2.3             |
| Sensors             | P3.0, P3.1              |

---

## Contributors

- **Main Developer**: Abin S Manoj  
- **Co-authors**:  
  - Aditya Arun  
  - Abhishek D.  
  - Ardra A. Nair  
  - Ashish Swami  
  - Arya R. Nair

---

## License

This project is provided **free for educational use**. You’re encouraged to modify, improve, and explore the code; all contributions are welcome.

---

