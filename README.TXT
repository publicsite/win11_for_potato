Get windoze to run on a potato by generating a vegetable iso. Probably the potato has to have UEFI tho.

Do this from a Debian based distro.

Write the ISO to USB drive.

Steps are as follows:

#1	Clone the repository
#2	cd to the top-level directory
#3	sudo ./pack.sh <Vanilla Windoze iso>
#4	./createImage.sh <Vanilla Windoze iso> #this will create our vegetable iso.
#5	sudo ./thirdparty/create_win_usb.sh *.forpotato.iso /dev/sdX #some flash drive

With thanks to the the people who wrote the bits in thirdparty directory (see cite file).

... Peace to the potatoes.

