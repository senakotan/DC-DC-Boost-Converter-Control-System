# DC-DC Boost Converter Control System

MATLAB/Simulink implementation of a closed-loop DC-DC Boost Converter controlled using classical control techniques.

## Project Overview

This project investigates the voltage regulation of a DC-DC Boost Converter using different linear controllers. A small-signal model of the converter was derived through the state-space averaging method and implemented in MATLAB/Simulink.

The control objective is to regulate the output voltage from **12 V** to a **24 V reference voltage** while evaluating the performance of different controller structures.

## System Parameters

| Parameter | Value |
|------------|--------|
| Input Voltage | 12 V |
| Reference Voltage | 24 V |
| Inductance | 1 mH |
| Capacitance | 470 µF |
| Load Resistance | 10 Ω |
| Duty Cycle | 0.5 |
| Switching Frequency | 50 kHz |

## Controllers Implemented

- PI Controller
- PID Controller
- PD Controller
- Lead Compensator
- Lag Compensator

## Methodology

- State-Space Averaging
- Small-Signal Linearization
- Transfer Function Modeling
- Closed-Loop Control Design
- MATLAB `pidtune()` Based Controller Tuning
- Time-Domain Response Analysis

## Key Findings

- The Boost Converter contains a **Right Half Plane (RHP) Zero**, making controller design more challenging.
- PI and PID controllers successfully tracked the 24 V reference voltage.
- PD, Lead, and Lag controllers exhibited significant steady-state error.
- The PI controller achieved the best overall performance with stable reference tracking and zero steady-state error.
- Excessive proportional and derivative action reduced system stability due to the RHP zero dynamics.

## Repository Structure

```text
├── Lead_Lag_Controller.slx
├── PI_PD_PID_Controller.slx
├── system_parameters.m
├── system_responses/
│   ├── pi_response.png
│   ├── pid_response.png
│   ├── pd_response.jpg
│   ├── lead_response.jpg
│   └── lag_response.jpg
└── README.md
```

## Software

- MATLAB
- Simulink
- Control System Toolbox
