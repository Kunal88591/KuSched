# KuSched

KuSched is an implementation of classic CPU scheduling algorithms in C++.  
It supports simulation, analysis, and visualization of different scheduling strategies.  
Algorithms included: First Come First Serve (FCFS), Round Robin (RR), Shortest Process Next (SPN), Shortest Remaining Time (SRT), Highest Response Ratio Next (HRRN), Feedback (FB), and Aging.

---

## Table of Contents

- [KuSched](#kusched)
  - [Table of Contents](#table-of-contents)
  - [Algorithms](#algorithms)
    - [First Come First Serve (FCFS)](#first-come-first-serve-fcfs)
    - [Round Robin (RR)](#round-robin-rr)
    - [Shortest Process Next (SPN)](#shortest-process-next-spn)
    - [Shortest Remaining Time (SRT)](#shortest-remaining-time-srt)
    - [Highest Response Ratio Next (HRRN)](#highest-response-ratio-next-hrrn)
    - [Feedback (FB-1, FB-2i)](#feedback-fb-1-fb-2i)
    - [Aging](#aging)
  - [Installation](#installation)
- [Author](#author)

---

## Algorithms

### First Come First Serve (FCFS)

- A non-preemptive algorithm that executes processes in the order of arrival.  
- Simple to implement but can cause long waiting times if processes with long burst times arrive early.

### Round Robin (RR)

- Preemptive algorithm using fixed time quantum.  
- Each process gets a time slice; when it expires, the process goes to the back of the queue.  
- Fair for time-sharing systems; average waiting time depends on quantum size.

### Shortest Process Next (SPN)

- Non-preemptive algorithm.  
- Chooses the process with the smallest burst time next.  
- Minimizes average waiting time but may cause starvation of long processes.

### Shortest Remaining Time (SRT)

- Preemptive version of SPN.  
- At arrival of a new process, scheduler checks remaining time; process with least remaining time runs next.  
- Adaptable but can cause high context switching.

### Highest Response Ratio Next (HRRN)

- Non-preemptive algorithm.  
- Response ratio = (Waiting Time + Burst Time) / Burst Time.  
- Process with highest ratio runs next, balancing short and long processes.

### Feedback (FB-1, FB-2i)

- Multi-level feedback queues.  
- **FB-1**: All queues use time quantum of 1.  
- **FB-2i**: Quantum doubles with each lower-priority queue.  
- Ensures short jobs finish quickly while long jobs eventually get service.

### Aging

- Prevents starvation by gradually increasing the priority of waiting processes.  
- Eventually guarantees execution for all processes.

---

## Installation

## KuSched — v2.0

KuSched is a lightweight, educational CPU scheduling simulator (C++). This release marks v2.0: clearer docs, CI, a test harness, and better developer ergonomics.

**Highlights (v2.0)**

- Added `Makefile` targets: `make`, `make run`, `make test`, `make format`, `make clean`.
- Added `scripts/run_tests.sh` to run and diff all `testcases/` automatically.
- Added GitHub Actions CI to build and run tests on push/PR.
- Improved README with a workflow diagram and a concise "What's New" section.

**Quick Start**

```bash
make        # build kusched
make run    # run the simulator interactively
make test   # run automated testcases
```

## Overview

The simulator reads a short input describing the operation mode (trace/stats), algorithms to run, simulation horizon, and process list. It executes multiple scheduling algorithms and prints timelines or statistics.

```mermaid
graph LR
  Input[Input file] --> Parse[parse()]
  Parse --> Sim[Simulation loop]
  Sim -->|algorithms[]| Algorithms[Algorithm implementations]
  Algorithms --> Timeline[Timeline / Stats]
  Timeline --> Output[Console / Test runner]
  Output --> Tests[scripts/run_tests.sh]
```

## What's New in v2.0

- CI: [github workflow] builds and runs `make test` on push and PR.
- Test runner: `scripts/run_tests.sh` automates running the binary against `testcases/` and diffs results.
- Formatting: `make format` (uses `clang-format` if installed).
- Makefile: clearer build targets and `run` shortcut.
- Documentation: this README includes a flow diagram and upgrade notes.

## What’s Best About KuSched

- Educational: small, focused codebase with classic scheduling algorithms implemented plainly.
- Reproducible: automated tests and CI ensure results don't regress.
- Extensible: add new algorithms by implementing a function and registering it in `parser.h` / `main.cpp`.

## Changelog (v2.0)

- 2026-06-19 — v2.0
  - Added CI workflow (.github/workflows/ci.yml)
  - Added `make test` target and `scripts/run_tests.sh`
  - Improved `Makefile` targets (`run`, `format`, `clean`)
  - Updated README with flow diagram and "What's New" summary

## Developer notes

- Input format: first line `operation` (trace|stats), second line algorithm list (e.g. `8-1` or `2-4,3-`), then `last_instant` and `process_count`, followed by `process_count` lines `Name,arrival,service`.
- To add an algorithm: implement the scheduling routine (e.g., `void myAlgo()`), update `execute_algorithm()` in `main.cpp`, and add a label in `ALGORITHMS`.

## Author

Kunal Meena — v2.0
