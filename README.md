# NXPDualCoreTest
***Assesing LPCExpresso for dual core debugging on the LPC55S69***

This project implements LED flashing to demonstrate the multicore debugging on the NXP LPC55S69. The LPC55S69 EVK is used.

Each core flashes a different colour LED, the main core (core 0) flashes the Red led of the RGB LED at a specific rate and core1 the Green LED at a different rate. The overlap allows the LED to appear orange at times.

I found the debuggin to be a little bit unreliable. After consulting the forum I discovered there is a bug in Rev A1 of the LPC55S69 that needs the flash driver reset hanlding to be changed (see below)
Sometimes I had to restart the IDE to get the Redlink Server to run properly. But once running you have a very nice capability to  simulataneously debug both cores, you can set breakpoints in any core and single step through

The LPC55S69 includes 2 X M33 cores, core 0 is the master and is reponsible for setting up of the core1 code in SRAM and releasing the core out of reset. I could not debug both cores with an external debugger, since the external tools only ever showed one MCU on the JTAG chain and no dual cores. 

This demo is based on the included exmaples from the SDK for the LPC55S69. 

Useful references to read to help understand dual core debugging:

[NXP Dual core debugging](https://www.nxp.com/docs/en/application-note/AN12358.pdf)

[NXP dual core debugging](https://community.nxp.com/community/mcuxpresso/mcuxpresso-ide/blog/2019/02/26/lpc55xx-multicore-applications-with-mcuxpresso-ide)

[Silicon A1 rev bug](https://community.nxp.com/thread/515129)


***Issues with debugging***
_Note these things:_
* You must prepare the EVK in CMSIS-DAP debug mode and use the Debug Link (P6) USB connector - (use LPCScrypt)
* You must have both projects in the workspace, compile core1 then core 0, core 0 will include core 1
* This demo uses the MCMGR mode to start the second core
* Debuggin can be a little bit unreliable. Make sure you set core 0 Debug configuration as follows: 
  * Select Core 0 project
  * Select Run-> Debug configurartions - Choose the LinkServer Debugger Tab
  * Scroll down to "Flash driver resert handling and choose "VECTRESET"
  * Use the Quickstart panel to launch the Debug, forst select core 0 project
  * if you get errors after launching the debug, you ay need to force the core to 0, elect Run-> Debug configurartions - Choose the LinkServer Debugger Tab, scroll down to Advanced settings and in the  "Override core index" type 0



