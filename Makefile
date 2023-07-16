init:
	git submodule update --init

bsp:
	mill -i mill.bsp.BSP/install

compile:
	mill -i -j 0 __.compile

# riscv64tests:
# 	mill -i -j 0 tests.riscvtests.run[rv64]

# riscv32tests:
# 	mill -i -j 0 tests.riscvtests.run[rv32]

clean:
#	git clean -fd
	rm -rf ./out
