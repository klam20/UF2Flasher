#This is a shell script for automating UF2 flashing

#The syntax to run this is ./flash.sh [path to board usb media] [path to uf2 src file]
#CAUTION: pay attention to capitlization of file pathing
#For instance, XIAO-SENSE  


#Parameter Checks, do we have the board and UF2 src file path?
if [ $# -lt 2 ]; then
    echo "The syntax to run this is ./flash.sh [path to board usb media] [path to uf2 src file]"
    echo "Usually the path to the board will be in the media directory /media/$(whoami)/"
    echo "While the UF2 is located somewhere in your project's build folder"
    echo "CAUTION: pay attention to capitlization of file pathing"
    echo "Exiting..."
    exit 1
fi

#Perform checks that the target board and UF2 src file are legit
path_to_board_usb_dir=$1
path_to_uf2_src_file=$2
echo "Checking that provided directories/files are valid..."

#Board USB directory first
find $path_to_board_usb_dir -type d
if [ $? -ne 0 ]; then
    echo "Bad directory for board USB"
    echo "Check if you are in bootloader mode? Usually requires a reset sequence of the board"
    exit 1
fi

#Then the UF2 file next
find $path_to_uf2_src_file
if [ $? -ne 0 ]; then
    echo "Bad file path for UF2 source file"
    exit 1
fi

#Once they are legit confirm one last time before performing the file copy

echo "Confirm that you want to flash $path_to_uf2_src_file to $path_to_board_usb_dir [Y/N]"
read -n 1 REPLY
echo "" #Adds a newline

if [[ $REPLY == "Y" || $REPLY == "y" ]]; then
    # Perform the file copy
    cp $path_to_uf2_src_file $path_to_board_usb_dir
    if [ $? -ne 0 ]; then
        echo "Bad copy operation..."
        exit 1
    fi
    echo "Successful copy"
    echo "Exiting..."
    exit 0
else
    echo "Exiting..."
    exit 1
fi



