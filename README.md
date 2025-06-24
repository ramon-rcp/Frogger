# 🐸 FPGA Frogger Game

This project implements a simplified version of the classic *Frogger* game using SystemVerilog and an FPGA development board. The goal is to help a frog safely cross a busy road filled with cars — perfect for training campus wildlife!

## 🚗 Project Overview

In this hardware game:
- The road is represented by an LED matrix (at least 12 rows × 8 columns).
- Cars move across the board in a set pattern, and the user must navigate a frog across the road without getting squished.
- If the frog reaches the opposite side, the user wins and the game resets.
- If the frog collides with a car, it's game over (💀 roadkill soufflé).

This project was built as part of a SystemVerilog and FPGA coursework assignment.

## 🎯 Features

- ✅ 12x8+ LED matrix game board
- ✅ Frog and cars indicated by different LED colors
- ✅ Directional movement using 4 buttons (up, down, left, right)
- ✅ Car movement logic with predictable patterns
- ✅ Collision detection logic for game over
- ✅ Win condition detection and automatic game reset
- ✅ Frog moves faster than cars

## 🧱 Requirements

- FPGA development board (e.g., Basys3 or equivalent)
- At least a 4x8 matrix of individually controllable LEDs
- Pushbuttons (or directional inputs) for controlling frog movement
- SystemVerilog-compatible toolchain
