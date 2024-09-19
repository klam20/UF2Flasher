# UF2Flasher
A command line script to automate UF2 flashing

## Description
**UF2Flasher** is a simple bash script that facilitates flashing an MCU using the UF2 DFU method. The script accepts two paths: the source path of the UF2 file and the target path where the MCU is connected. It then performs a copy operation to transfer the file.


## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/UF2Flasher.git
   cd UF2Flasher

## Usage
The syntax to run this is ./flash.sh [path to board usb media] [path to uf2 src file].

Usually the path to the board will be in the media directory /media/your-username/(board here).

While the UF2 is located somewhere in your project's build folder.
