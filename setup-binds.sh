echo "Setting up discovery env"

DISCOVERY_SCRIPTS="/c/OpenOCD/scripts/"

alias discovery_build="cargo build --target thumbv7em-none-eabihf"

function discovery_debug_server {
	local current_directory=$PWD
	cd /tmp
	local scripts="/c/OpenOCD/scripts/"

	# Does the same thing as cargo run/target remote :3333/load/set print asm-demangle on/set style sources off/break main/continue
	local script='openocd -s $DISCOVERY_SCRIPTS -f $DISCOVERY_SCRIPTS/interface/stlink.cfg -f $DISCOVERY_SCRIPTS/target/stm32f3x.cfg -c "bindto 0.0.0.0"'
	echo $script
	eval $script

	cd $current_directory
}

function discovery_debug {
	# Pass the name of the binary that you want to run
    # I find mine under ~/workspace/discovery/target/thumbv7em-none-eabihf/debug/
	echo "Starting binary found at $1"
	gdb -q -ex "target remote :3333" $1
}

function discovery_verify {
    # todo
	echo "todo"
}