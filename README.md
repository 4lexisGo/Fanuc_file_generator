# FANUC Builder

Open-source Python toolkit for FANUC robot offline program generation, LS file automation, and more.
---

# Overview

FANUC Builder is a modular Python framework designed to simplify and automate the generation of FANUC robot programs.

The project focuses on:

- LS file manipulation and generation
- Automated fallback/recovery program generation
- Parametric robot program templating
- RENISHAW probing routine generation

The toolkit is intended for robotics engineers, automation integrators, and industrial developers working with FANUC robotic systems.

---

# Features

## LS Program Generation

- Create FANUC `.LS` robot programs programmatically
- Modify existing LS files
- Generate fallback and recovery routines
- Parametric code generation
- Dynamic motion instruction generation

## Program Templating

- Replace configurable sections automatically
- Inject positions, frames, registers, and offsets

## RENISHAW Probing Integration

- Automatic probing routine generation
- Touch sensing sequence generation
- Point acquisition program generation
- Configurable probing strategies

## Modular Architecture

The project is organized into reusable sub-packages:

- LS generation
- Parsing utilities
- Probing utilities
- RENISHAW integration
- Common robotics helpers
- File utilities

## Python & Poetry Based

- Modern Python packaging
- Dependency management with Poetry
- Local virtual environment support
- Easy reproducibility

---