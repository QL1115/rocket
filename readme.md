# Rocket

This is the undergoing refactor project of rocket core.

## Refactor Procedure
Here are some notes for refactoring:  
- There will be two projects: `rocket` and `diplomatic`, `rocket` will depend on `chisel3`, `tilelink` projects, `diplomatic` is the source code originally pulled from rocket-chip, and it will depend on rocket-chip for using diplomacy and cde.  
- There won't be any unrelated change during this refactoring.  
- Upstream rocket core from rocket-chip bug fixes will be cherry-picked to this project.

## Architecture
```
./cosim
├── elaborate
│   └── src
│       ├── Convert.scala
│       ├── CosimConfig.scala: Configuration for rocket core
│       ├── DUT.scala
│       ├── GrandCentral.scala
│       ├── Main.scala
│       ├── TestBench.scala: Integrates DUT and VerificationModule
│       └── VerificationModule.scala: Use C++ to test DUT in System Verilog
└── emulator: C++ files

./diplomatic/
├── resources
└── src
    └── rocket: Rocket core separated from rocket chip, still using CDE and Diplomacy

./rocket: This rocket core only depends on chisel3 and Tile Link
```

## Commands (Ubuntu 20.04)
1. **Download the project**
    ```shell
    git clone https://github.com/QL1115/rocket.git
    cd rocket
    ```
2. **Install mill 0.10.0, protobuf-compiler, antlr4, clang**
    ```shell
    sudo apt-get update
    sudo sh -c "curl -L https://github.com/com-lihaoyi/mill/releases/download/0.10.0/0.10.0 > /usr/local/bin/mill && chmod +x /usr/local/bin/mill"
    sudo apt-get install antlr4
    sudo apt-get protobuf-compiler
    sudo apt-get install clang
    ```
3. **set environment variable RISCV_TESTS_ROOT**
    ```shell
    export RISCV_TESTS_ROOT=<path_to_rocket_installation>/riscv_tests_root/
    ```
4. **Compile the project**
    ```shell
    make init
    make bsp
    make compile
    ```
**After make compile completes, you can find the generated System Verilog files in the `./out/cosim/mfccompile/<32/64>/compile.dest` folder.**