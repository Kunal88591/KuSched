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

1. Clone the repository:
   ```bash
   git clone https://github.com/Kunal88591/KuSched.git
   cd KuSched
   ```
2. Install g++ and make:
```bash
sudo apt-get install g++ make
```
3. Compile using:
```bash
make
```

# Author

Kunal Meena  
GitHub: [Kunal88591](https://github.com/Kunal88591)  
Email: [kunalmeena1311@gmail.com](mailto:kunalmeena1311@gmail.com)
