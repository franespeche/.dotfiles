function ps() {
	msg "sudo pacman -S $1"
	sudo pacman -S $1
}
