# Constrained-Random Tests (CRT) in SystemVerilog

## Table of Contents
1. [Constrained-Random Tests (CRT)](#61-constrained-random-tests-crt)
2. [CRT Environment Setup](#61.1-crt-environment-setup)
3. [Components of CRT](#61.2-components-of-crt)
4. [What to Randomize in CRT](#62-what-to-randomize-in-crt)
5. [Device Configuration in CRT](#62.1-device-configuration-in-crt)
6. [Environment Configuration in CRT](#62.2-environment-configuration-in-crt)
7. [Primary Input Data in CRT](#62.3-primary-input-data-in-crt)
8. [Encapsulated Input Data in CRT](#62.4-encapsulated-input-data-in-crt)
9. [Protocol Exceptions, Errors, and Violations in CRT](#62.5-protocol-exceptions-errors-and-violations-in-crt)
10. [Delays in CRT](#62.6-delays-in-crt)
11. [Randomization in SystemVerilog](#62.7-randomization-in-systemverilog)
12. [Sample Class with Random Variables (Sample 6.1)](#62.8-sample-class-with-random-variables-sample-61)
13. [Randomization and Error Checking in SystemVerilog (Sample 6.2)](#62.9-randomization-and-error-checking-in-systemverilog-sample-62)
14. [The Constraint Solver in SystemVerilog](#62.10-the-constraint-solver-in-systemverilog)
15. [What Can Be Randomized in SystemVerilog?](#63-what-can-be-randomized-in-systemverilog)
16. [Constraints and Randomization](#63.1-constraints-and-randomization)
17. [Constraint Introduction](#63.2-constraint-introduction)
18. [Simple Expressions in Constraints](#63.3-simple-expression-in-constarints)
19. [Weighted Distributions](#63.4-weighted-distributions)
20. [Set Membership and the inside Operator](#63.5-set-membership-and-the-inside-operator)
21. [Array in Constraints](#63.6-array-in-constarints)
22. [Bidirectional Constraints](#63.7-bidirectional-constraints)
---

## 6.1 Constrained-Random Tests (CRT)

### 1 Challenges
- Hard to create complete stimuli for large designs.
- Directed tests (manual, feature-specific test cases) can't cover all feature interactions.
- Feature doubling increases complexity; bugs from feature interactions are missed.

### 2 Limitations of Directed Tests
- Only find anticipated bugs.
- Impractical for all feature combinations.

### 3 CRT Solution
- Automatically generates random test cases.
- Uses constraints to ensure tests are valid and relevant.

### 4 Advantages
- Wider coverage and exploration of scenarios.
- Finds unanticipated bugs.
- Reduces manual effort, increasing efficiency.

---

## 6.1.1 CRT Environment Setup

### 1 Effort Comparison
- CRT setup requires more effort than directed tests.
- Directed test: Apply stimulus and manually check results using a golden log file (output file).

### 2 CRT Requirements
- Environment to predict results using a reference model, transfer function, or similar techniques.
- Functional coverage to measure stimulus effectiveness.

### 3 Advantages of CRT
- Once set up, hundreds of tests can run automatically without manual result-checking.
- Improves productivity by trading test-authoring time (manual effort) for CPU time (automated processing).

---

## 2 Components of CRT

### 1 Parts of CRT:
- **Test Code**: Generates random input values for the DUT.
- **Seed**: A starting value for the pseudo-random number generator (PRNG) that ensures the same sequence of random values can be reproduced for debugging or rerunning tests.

---

## 6.2 What to Randomize in CRT

### 1 Focus of Randomization
- Randomizing data fields (e.g., using `$random`) mainly uncovers data-path issues, but has limited effectiveness for complex bugs.
- The more critical bugs are often in the control logic, so randomizing these areas is essential.

### 2 Key Areas to Randomize:
- **Device Configuration**: Hardware settings and operational modes.
- **Environment Configuration**: External conditions affecting the DUT.
- **Primary Input Data**: Main data provided to the DUT.
- **Encapsulated Input Data**: Data wrapped in structures or packages.
- **Protocol Exceptions**: Edge cases in protocol behavior.
- **Delays**: Timing variations between operations or signals.
- **Transaction Status**: Progress or state of ongoing transactions.
- **Errors and Violations**: Faults, incorrect operations, or rule violations.

### 3 Goal of Randomization:
Increase path coverage: By randomizing decision points (where control paths diverge), you ensure that the DUT explores a wide variety of execution paths, increasing the chances of finding hidden bugs.

---

## 6.2.1 Device Configuration in CRT

### 1 Common Issue in RTL Testing:
- Bugs are often missed because not enough different configurations are tested.
- Many tests use a fixed configuration (e.g., design in reset or with a fixed initialization vector).

### 2 Real-World Example:
A multiplexor switch with 600 input channels and 12 output channels was tested with a fixed configuration. In real-world use, channels are allocated and deallocated randomly, making the configuration appear random.

### 3 Traditional Testing Limitation:
- The engineer had to manually configure each channel using Tcl code, testing only a few configurations.

### 4 CRT Approach:
- By randomizing the configuration of each channel and using a loop to configure the entire device, a broader range of configurations was tested. This approach ensured that previously missed bugs were uncovered by simulating more realistic, varied configurations.

---

## 6.2.2 Environment Configuration in CRT

### 1 Randomizing the Environment:
- The DUT operates in a system with other devices. Randomizing the environment (number of devices, their configuration, etc.) is essential for realistic testing.

### 2 Example:
- **PCI Switch**: Randomized the number of PCI buses (1-4), number of devices on each bus (1-8), and device parameters (master/slave, CSR addresses).
  - This ensured that all possible configurations were tested, increasing coverage and bug detection.

### 3 Goal:
Randomizing the environment helps simulate real-world conditions and uncover bugs that may arise from interactions with other devices in the system.

---

## 6.2.3 Primary Input Data in CRT

### 1 Randomizing Primary Input Data:
- The first thought is often to randomize transactions like bus writes or ATM cells with random values.
- This is straightforward if the transaction classes are well-prepared in advance.

### 2 Considerations:
- Anticipate layered protocols (e.g., communication protocols) to ensure valid input.
- Include error injection to simulate real-world faults and edge cases.

### 3 Goal:
Ensure the random input data is valid, realistic, and comprehensive to test a wide range of scenarios.

---

## 6.2.4 Encapsulated Input Data in CRT

### 1 Multiple Layers of Data:
- Devices often handle data in layers, like TCP inside IP packets, which are then inside Ethernet frames.

### 2 Randomizing Control Fields:
- Each layer has its own settings (control fields) that can be randomized to test different combinations.

### 3 Creating Valid Control Fields:
- You need to set rules (constraints) to make sure the control fields are correct, but also allow for errors to test how the system handles them.

### 4 Goal:
Randomize data and control fields across all layers, while ensuring the system is tested for both valid and faulty conditions.

---

## 6.2.5 Protocol Exceptions, Errors, and Violations in CRT

### 1 Handling Errors:
- Errors will eventually occur, so the design must handle them without crashing or entering an illegal state.
- It's important to test the system for all potential error cases, even those beyond the functional specification.

### 2 Error Scenarios:
- What happens if a transfer is interrupted midway? The testbench should simulate such situations.
- Test error detection and correction fields by trying all possible combinations.

### 3 Random Error Injection:
- The testbench should be able to send correct inputs and, with a simple change, inject random errors at random points during the test.

### 4 Goal:
Ensure the design can handle all types of errors and exceptions gracefully, simulating real-world issues like interruptions or faulty transfers.

---

## 6.2.6 Delays in CRT

### 1 Randomizing Delays:
- Communication protocols specify delays (e.g., bus grant after 1-3 cycles, memory data valid after 4-10 cycles).
- Directed tests often use the shortest delays for faster simulation, missing potential bugs.
- The testbench should use random legal delays in every test to uncover bugs that may only appear with specific timing.

### 2 Clock Jitter:
- Some designs are sensitive to clock jitter (small variations in the clock cycle).
- By slightly shifting the clock edges, you can test if the design handles small timing changes correctly.

### 3 Clock Generator:
- The clock generator should be a separate module outside the testbench, creating events like other design events.
- It should have configurable parameters (e.g., frequency, offset) that the testbench can adjust during setup.

### 4 Focus on Functional Errors:
- This methodology focuses on functional errors, not timing errors.
- Timing errors like setup and hold violations should be checked using timing analysis tools, not through random delays in the testbench.

---

## 6.3 Randomization in SystemVerilog

### 1 Randomization with OOP:
- SystemVerilog's random stimulus generation is most effective when used with Object-Oriented Programming (OOP).
- You create a class to hold related random variables, and the random-solver fills these variables with random values.

### 2 Constraints:
- Constraints can be applied to ensure the random values are legal or to test specific features.
- ## 1. Sample Class with Random Variables (Sample 6.1)
### Class Overview:
The `Packet` class contains four random variables:
- `src`, `dst`, and `data` use the `rand` modifier (values may repeat).
- `kind` uses the `randc` modifier (random cyclic, ensures all possible values are used before repeating).

### Constraints:
Constraints are rules for randomization. For example:
```systemverilog
constraint c {
    src > 10;
    src < 15;
}
```

### Randomization Behavior:
- `rand`: Generates new values for every randomization (like rolling dice).
- `randc`: Ensures all possible values are assigned before repeating (like shuffling a deck of cards).

### Why Not Randomize in Constructor?
The constructor initializes variables but does not randomize them. This allows flexibility for additional constraints or changes later in the testbench.

### Example Code:
```systemverilog
class Packet;
    rand bit [31:0] src;
    rand bit [31:0] dst;
    rand bit [31:0] data[8];
    randc bit [7:0] kind;

    constraint c {
        src > 10;
        src < 15;
    }
endclass : Packet

module sample_6_1;
    Packet p;
    initial begin
        p = new();
        if (!p.randomize())
            $finish;
        transmit(p);
    end
endmodule : sample_6_1
```

---

## 2. Randomization and Error Checking in SystemVerilog (Sample 6.2)
### Purpose of Randomization Check:
The `randomize()` function assigns random values to variables and ensures constraints are respected. Checking the success of randomization prevents simulation errors due to unsatisfied constraints.

### Macro for Randomization Check:
The `SV_RAND_CHECK` macro ensures successful randomization. If randomization fails, it displays an error and stops the simulation.

### Example Code:
```systemverilog
`define SV_RAND_CHECK(r) \
    do begin \
        if((!r)) begin \
            $display("%s: %0d: Randomization failed \"%s\"", \
                `__FILE__, `__LINE__, `"r"); \
            $finish; \
        end \
    end while (0)

class Packet;
    rand bit [31:0] src;
    rand bit [31:0] dst;
    rand bit [31:0] data[8];
    randc bit [7:0] kind;

    constraint c {
        src > 10;
        src < 15;
    }
endclass : Packet

module sample_6_2;
    Packet p;
    initial begin
        p = new();
        `SV_RAND_CHECK(p.randomize());
    end
endmodule : sample_6_2
```

---

## 3. The Constraint Solver in SystemVerilog
### Overview:
The constraint solver selects random values for variables while ensuring all constraints are satisfied.

### Key Points:
- **Reproducibility:** The solver uses a pseudo-random number generator (PRNG) with a seed. Using the same seed produces the same results.
- **Tool Dependency:** Results may vary across simulators or versions due to solver implementation differences.
- **Seed Control:** Specifying the seed ensures consistent results for debugging.

### Summary:
The solver is essential for generating valid random values. Understanding seed usage and reproducibility is crucial for reliable testing.

---

## 4. What Can Be Randomized in SystemVerilog?
### Randomizable Types:
- **2-state types:** e.g., `bit`, `logic`, `reg`
- **4-state types:** e.g., `bit [n:0]`, `logic [n:0]` (only 2-state values are generated)
- **Integers**
- **Bit vectors:** Arrays of bits

### Non-Randomizable Types:
- **Strings:** Cannot be randomized.
- **Handles:** Object references cannot be randomized.
- **Real variables:** Floating-point variables are not supported for randomization.

### Summary:
SystemVerilog supports randomization of integral types but not strings, handles, or real variables.

### 3 Transaction-Level Randomization:
- Randomizing individual variables one at a time is less useful.
- True constrained-random stimuli is created at the transaction level, where multiple related values are randomized together to form a complete test case.
# Constraints and Randomization in SystemVerilog



---

## 6.4 Constraints and Randomization in SystemVerilog

In SystemVerilog, constraints are used to define relationships between variables, ensuring that the generated random values meet certain conditions. These relationships help avoid generating illegal or undesirable stimulus values. Constraints are particularly useful when you want to control how variables interact with each other during randomization.

### Key Points:

#### Constraints Define Relationships:
Constraints express relationships between variables, such as ranges or dependencies. The SystemVerilog constraint solver ensures that random values satisfy these constraints.

#### Random Variables in Constraints:
At least one variable in each constraint expression must be marked as random (`rand` or `randc`). If no random variables are present, the constraint cannot generate random values but will only check if the existing values meet the constraint conditions.

#### Example and Explanation (Sample 6.3)
```systemverilog
// Sample 6.3: Constraint without random variables
class Child;
    bit [7:0] age;  // Error - should be rand or randc
    constraint c_teenager {
        age > 12;
        age < 20;
    }
endclass : Child
```

**Problem:** In this class, `age` is not marked as a random variable (`rand` or `randc`). This leads to an issue when calling the `randomize()` function. The randomization function will try to assign random values to the variables and check if the constraints are satisfied. However, since `age` is not random, the randomization process fails unless `age` is already within the specified range of 13 to 19.

**Why It Fails:** Since `age` is not random, the `randomize()` function only checks if the value of `age` falls within the range specified by the constraint `c_teenager`. If `age` is not in the range of 13 to 19, the randomization will fail. However, this kind of check is better suited for an assert or if statement instead of a constraint.

**Best Practice:**
Use asserts or if-statements to check the validity of non-random variables (like `age` in this case). This approach is more straightforward and easier to debug than relying on the randomization process to check constraints on non-random variables.

### Summary:
- Constraints define relationships between variables and guide the randomization process.
- At least one random variable (`rand` or `randc`) must be involved in each constraint expression.
- If a variable is not random, use asserts or procedural checks instead of constraints to validate its value.

---

## 6.4.1 Constraint Introduction in SystemVerilog

In SystemVerilog, constraints are used to restrict the possible values that random variables can take. Constraints allow you to define relationships between variables and enforce rules that must be satisfied during randomization. They help in creating more meaningful and realistic stimulus for the design under test (DUT).

### Key Concepts:

#### Constraint Block:
- A constraint block is used to group multiple constraint expressions together. These expressions define the legal values for the random variables.
- The block is enclosed within curly braces `{}`.
- The `begin...end` keywords are used for procedural code, but not in constraint blocks.

#### Random Variables:
- Random variables are defined with the `rand` or `randc` keyword. These variables are subject to randomization during simulation.
- `randc` is used for cyclic randomization, ensuring that all possible values are used before any value is repeated.

#### Example (Sample 6.4)
```systemverilog
// Sample 6.4: Constrained-random class
class Stim;
    // Constant value for congestion address
    const bit [31:0] CONGEST_ADDR = 42;

    // Enum for different types of stimulus
    typedef enum {READ, WRITE, CONTROL} stim_e;

    // Random variables
    randc stim_e kind;           // Enumerated random variable
    rand bit [31:0] len, src, dst;  // 32-bit random variables
    rand bit congestion_test;    // Random bit for congestion test

    // Constraint block
    constraint c_stim {
        len < 1000;             // Length must be less than 1000
        len > 0;                // Length must be greater than 0

        // Conditional constraint based on congestion_test
        if (congestion_test) {
            // If congestion_test is true, restrict dst and src
            dst inside {[CONGEST_ADDR - 10 : CONGEST_ADDR + 10]};  // dst within a specific range
            src == CONGEST_ADDR;  // src must equal the congestion address
        }
        else {
            // If congestion_test is false, src can take values in specified ranges
            src inside {0, [2:10], [100:107]};  // src can take values from these ranges
        }
    }
endclass : Stim
```

### Explanation:

#### Constant Declaration:
`const bit [31:0] CONGEST_ADDR = 42;` defines a constant value `CONGEST_ADDR` that is used later in the constraints.

#### Enumerated Type:
`typedef enum {READ, WRITE, CONTROL} stim_e;` defines an enumerated type `stim_e` with three possible values: `READ`, `WRITE`, and `CONTROL`.

#### Random Variables:
- `randc stim_e kind;` defines a random cyclic enumerated variable `kind`.
- `rand bit [31:0] len, src, dst;` defines three random 32-bit variables: `len`, `src`, and `dst`.
- `rand bit congestion_test;` defines a random bit variable `congestion_test` that determines the behavior of the constraints.

#### Constraint Block:
- The constraint block `c_stim` defines the conditions that must be satisfied for randomization.
- `len` is constrained to be between 0 and 1000.
- The `if (congestion_test)` condition ensures that when `congestion_test` is true, the `dst` address is within a specific range of `CONGEST_ADDR`, and `src` must be equal to `CONGEST_ADDR`.
- If `congestion_test` is false, `src` is allowed to take values from the specified ranges: 0, [2:10], and [100:107].

### Summary:
- Constraint blocks group multiple constraint expressions that define the legal values for random variables.
- Conditional constraints allow you to create different rules based on the value of other variables (e.g., `congestion_test` in the example).
- Randomization is controlled by these constraints, ensuring that only valid and meaningful stimulus is generated.
