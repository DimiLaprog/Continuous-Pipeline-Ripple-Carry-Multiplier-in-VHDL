# Continuous-Pipeline-Ripple-Carry-Multiplier-in-VHDL
Continuous Pipeline Ripple Carry Multiplier in VHDL using Vivado Xilinx : 
The multiplier was implemented in a structural way utilising a basic multiplying cell that includes a sequential full adder. After combining each cell to its corresponding line, the lines can then be connected properly to finally built a 4x4 Continuous-Pipeline-Ripple-Carry-Multiplier-in-VHDL. 
For code: look into code file "MULTIPLICATION".
#
- Board Used: Zybo (xc7z010clg400-1) , Zynq-7000 product family.
- Xilinx Vivado 2018.2.1
## We present in the following order:
1. Circuit Design using pipeline where red lines and dots indicate the positions of extra flip flops to be used in order to achieve pipeline.
2. RTL produced by Vivado
3. Behavioral Simulation
> Note that pipeline produces correct results after 11 Clock Cycles and initial reg values are 0.

4. Critical Path Delay (synthesis)
5. Utilization table (synthesis)


![Multiplier circuit](https://user-images.githubusercontent.com/56197365/113529257-ad1a1700-95cb-11eb-8fcf-243bbedce2eb.JPG)

![RTL](https://user-images.githubusercontent.com/56197365/113529258-adb2ad80-95cb-11eb-93ca-b6869a30570f.JPG)
![RTL2](https://user-images.githubusercontent.com/56197365/113529261-aee3da80-95cb-11eb-9c92-961e6750ccb5.JPG)

![testbench result](https://user-images.githubusercontent.com/56197365/113529263-af7c7100-95cb-11eb-8910-b637289d7d20.JPG)
![Critical Path](https://user-images.githubusercontent.com/56197365/113529254-ac818080-95cb-11eb-88b1-eefb0fb51afd.JPG)
![Utilization](https://user-images.githubusercontent.com/56197365/113529252-abe8ea00-95cb-11eb-8a6d-d5d39eef31ac.JPG)

## Author:
Dimitrios Lampros
