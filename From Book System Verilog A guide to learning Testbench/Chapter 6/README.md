# RANDOMIZATION

## Table of Contents
1. [Constrained-Random Tests (CRT)](#61-constrained-random-tests-crt)
   - [Challenges](#challenges)
   - [Limitations of Directed Tests](#limitations-of-directed-tests)
   - [CRT Solution](#crt-solution)
   - [Advantages](#advantages)
2. [CRT Environment Setup](#61.1-crt-environment-setup)
   - [Effort Comparison](#effort-comparison)
   - [CRT Requirements](#crt-requirements)
   - [Advantages of CRT](#advantages-of-crt)
3. [Components of CRT](#61.2-components-of-crt)
4. [What to Randomize in CRT](#62-what-to-randomize-in-crt)
   - [Focus of Randomization](#focus-of-randomization)
   - [Key Areas to Randomize](#key-areas-to-randomize)
   - [Goal of Randomization](#goal-of-randomization)
5. [Device Configuration in CRT](#62.1-device-configuration-in-crt)
6. [Environment Configuration in CRT](#62.2-environment-configuration-in-crt)
7. [Primary Input Data in CRT](#62.3-primary-input-data-in-crt)
8. [Encapsulated Input Data in CRT](#62.4-encapsulated-input-data-in-crt)
9. [Protocol Exceptions, Errors, and Violations in CRT](#62.5-protocol-exceptions-errors-and-violations-in-crt)
10. [Delays in CRT](#62.6-delays-in-crt)
11. [Randomization in SystemVerilog](#63-randomization-in-systemverilog)

---

## 6.1 Constrained-Random Tests (CRT)

### Challenges
- Hard to create complete stimuli for large designs.
- Directed tests (manual, feature-specific test cases) can't cover all feature interactions.
- Feature doubling increases complexity; bugs from feature interactions are missed.

### Limitations of Directed Tests
- Only find anticipated bugs.
- Impractical for all feature combinations.

### CRT Solution
- Automatically generates random test cases.
- Uses constraints to ensure tests are valid and relevant.

### Advantages
- Wider coverage and exploration of scenarios.
- Finds unanticipated bugs.
- Reduces manual effort, increasing efficiency.

---

## 6.1.1 CRT Environment Setup

### 1. Effort Comparison
- CRT setup requires more effort than directed tests.
- Directed test: Apply stimulus and manually check results using a golden log file (output file).

### CRT Requirements
- Environment to predict results using a reference model, transfer function, or similar techniques.
- Functional coverage to measure stimulus effectiveness.

### Advantages of CRT
- Once set up, hundreds of tests can run automatically without manual result-checking.
- Improves productivity by trade off test-authoring time (manual effort) for CPU time (automated processing).

---

## 6.1.2 Components of CRT

### Parts of CRT:
- **Test Code**: Generates random input values for the DUT.
- **Seed**: A starting value for the pseudo-random number generator (PRNG) that ensures the same sequence of random values can be reproduced for debugging or rerunning tests.

---

## 6.2 What to Randomize in CRT

### Focus of Randomization
- Randomizing data fields (e.g., using `$random`) mainly uncovers data-path issues, but has limited effectiveness for complex bugs.
- The more critical bugs are often in the control logic, so randomizing these areas is essential.

### Key Areas to Randomize:
- **Device Configuration**: Hardware settings and operational modes.
- **Environment Configuration**: External conditions affecting the DUT.
- **Primary Input Data**: Main data provided to the DUT.
- **Encapsulated Input Data**: Data wrapped in structures or packages.
- **Protocol Exceptions**: Edge cases in protocol behavior.
- **Delays**: Timing variations between operations or signals.
- **Transaction Status**: Progress or state of ongoing transactions.
- **Errors and Violations**: Faults, incorrect operations, or rule violations.

### Goal of Randomization:
Increase path coverage: By randomizing decision points (where control paths diverge), you ensure that the DUT explores a wide variety of execution paths, increasing the chances of finding hidden bugs.

---

## 6.2.1 Device Configuration in CRT

### Common Issue in RTL Testing:
- Bugs are often missed because not enough different configurations are tested.
- Many tests use a fixed configuration (e.g., design in reset or with a fixed initialization vector).

### Real-World Example:
A multiplexor switch with 600 input channels and 12 output channels was tested with a fixed configuration. In real-world use, channels are allocated and deallocated randomly, making the configuration appear random.

### Traditional Testing Limitation:
- The engineer had to manually configure each channel using Tcl code, testing only a few configurations.

### CRT Approach:
- By randomizing the configuration of each channel and using a loop to configure the entire device, a broader range of configurations was tested. This approach ensured that previously missed bugs were uncovered by simulating more realistic, varied configurations.

---

## 6.2.2 Environment Configuration in CRT

### Randomizing the Environment:
- The DUT operates in a system with other devices. Randomizing the environment (number of devices, their configuration, etc.) is essential for realistic testing.

### Example:
- **PCI Switch**: Randomized the number of PCI buses (1-4), number of devices on each bus (1-8), and device parameters (master/slave, CSR addresses).
  - This ensured that all possible configurations were tested, increasing coverage and bug detection.

### Goal:
Randomizing the environment helps simulate real-world conditions and uncover bugs that may arise from interactions with other devices in the system.

---

## 6.2.3 Primary Input Data in CRT

### Randomizing Primary Input Data:
- The first thought is often to randomize transactions like bus writes or ATM cells with random values.
- This is straightforward if the transaction classes are well-prepared in advance.

### Considerations:
- Anticipate layered protocols (e.g., communication protocols) to ensure valid input.
- Include error injection to simulate real-world faults and edge cases.

### Goal:
Ensure the random input data is valid, realistic, and comprehensive to test a wide range of scenarios.

---

## 6.2.4 Encapsulated Input Data in CRT

### Multiple Layers of Data:
- Devices often handle data in layers, like TCP inside IP packets, which are then inside Ethernet frames.

### Randomizing Control Fields:
- Each layer has its own settings (control fields) that can be randomized to test different combinations.

### Creating Valid Control Fields:
- You need to set rules (constraints) to make sure the control fields are correct, but also allow for errors to test how the system handles them.

### Goal:
Randomize data and control fields across all layers, while ensuring the system is tested for both valid and faulty conditions.

---

## 6.2.5 Protocol Exceptions, Errors, and Violations in CRT

### Handling Errors:
- Errors will eventually occur, so the design must handle them without crashing or entering an illegal state.
- It's important to test the system for all potential error cases, even those beyond the functional specification.

### Error Scenarios:
- What happens if a transfer is interrupted midway? The testbench should simulate such situations.
- Test error detection and correction fields by trying all possible combinations.

### Random Error Injection:
- The testbench should be able to send correct inputs and, with a simple change, inject random errors at random points during the test.

### Goal:
Ensure the design can handle all types of errors and exceptions gracefully, simulating real-world issues like interruptions or faulty transfers.

---

## 6.2.6 Delays in CRT

### Randomizing Delays:
- Communication protocols specify delays (e.g., bus grant after 1-3 cycles, memory data valid after 4-10 cycles).
- Directed tests often use the shortest delays for faster simulation, missing potential bugs.
- The testbench should use random legal delays in every test to uncover bugs that may only appear with specific timing.

### Clock Jitter:
- Some designs are sensitive to clock jitter (small variations in the clock cycle).
- By slightly shifting the clock edges, you can test if the design handles small timing changes correctly.

### Clock Generator:
- The clock generator should be a separate module outside the testbench, creating events like other design events.
- It should have configurable parameters (e.g., frequency, offset) that the testbench can adjust during setup.

### Focus on Functional Errors:
- This methodology focuses on functional errors, not timing errors.
- Timing errors like setup and hold violations should be checked using timing analysis tools, not through random delays in the testbench.

---

## 6.3 Randomization in SystemVerilog

### Randomization with OOP:
- SystemVerilog's random stimulus generation is most effective when used with Object-Oriented Programming (OOP).
- You create a class to hold related random variables, and the random-solver fills these variables with random values.

### Constraints:
- Constraints can be applied to ensure the random values are legal or to test specific features.

### Transaction-Level Randomization:
- Randomizing individual variables one at a time is less useful.
- True constrained-random stimuli is created at the transaction level, where multiple related values are randomized together to form a complete test case.
