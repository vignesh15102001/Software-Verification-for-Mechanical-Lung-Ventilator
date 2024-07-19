# Software Verification for Mechanical Lung Ventilator

## Overview
This project models a mechanical lung ventilator system and verifies its correctness using Dafny. The ventilator helps patients breathe by providing mechanical ventilation and has various states and safety mechanisms to ensure reliable operation.

## Files
- `VentilatorControlSystem.dfy`: Defines the ventilator system with states and methods.
- `Verification.dfy`: Contains verification methods to ensure the ventilator system behaves correctly.

## Repository Link
[Software-Verification-for-Mechanical-Lung-Ventilator](https://github.com/vignesh15102001/Software-Verification-for-Mechanical-Lung-Ventilator)

## Prerequisites
- Dafny: Install from the [Dafny GitHub repository](https://github.com/dafny-lang/dafny)
- Z3 Theorem Prover: Install from the [Z3 GitHub releases page](https://github.com/Z3Prover/z3/releases)

## Instructions
1. **Download and Extract Files**:
   - Clone the repository or download the files from the provided link.
   - Extract the files to a convenient location on your system.

2. **Set Up Dafny and Z3**:
   - Ensure Dafny and Z3 are correctly installed and configured.
   - Set the Z3 executable path if necessary.

3. **Run the Dafny Verification**:
   - Open a command prompt or terminal.
   - Navigate to the directory containing the Dafny files.
   - Run the following command to verify the program:
     ```sh
     dafny verify --solver-path "C:\Program Files\Z3\z3-4.13.0-x64-win\bin\z3.exe" VentilatorControlSystem.dfy Verification.dfy
     ```

## Execution Order
1. **VentilatorControlSystem.dfy**:
   - Defines the ventilator system with states and methods.
   
2. **Verification.dfy**:
   - Contains verification methods to ensure correct ventilator behavior.

## Notes
- Ensure paths to Dafny and Z3 executables are correctly set.
- Refer to the Dafny documentation for any troubleshooting tips.

## Appendix

**Repository Link**: You can run the code in the Dafny CLI or any supported IDE like Visual Studio Code.

[Download the Dafny files here](https://github.com/vignesh15102001/Software-Verification-for-Mechanical-Lung-Ventilator)

**Instructions**:
1. Ensure Dafny and Z3 are installed. (Dafny: [GitHub](https://github.com/dafny-lang/dafny), Z3: [GitHub](https://github.com/Z3Prover/z3/releases))
2. Set the Z3 executable path if necessary.

**Run the code files in the following order**:
1. **VentilatorControlSystem.dfy**
   - Defines the ventilator system with states and methods.
2. **Verification.dfy**
   - Contains verification methods to ensure correct ventilator behavior.

**Commands**:
```sh
dafny verify --solver-path "C:\Program Files\Z3\z3-4.13.0-x64-win\bin\z3.exe" VentilatorControlSystem.dfy Verification.dfy
