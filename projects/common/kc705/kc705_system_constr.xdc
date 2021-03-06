
# constraints

set_property -dict  {PACKAGE_PIN  AB7   IOSTANDARD  LVCMOS15} [get_ports sys_rst]

# clocks

set_property -dict  {PACKAGE_PIN  AD12  IOSTANDARD  DIFF_SSTL15} [get_ports sys_clk_p]
set_property -dict  {PACKAGE_PIN  AD11  IOSTANDARD  DIFF_SSTL15} [get_ports sys_clk_n]

create_clock -name sys_clk      -period  5.00 [get_ports sys_clk_p]

# ddr

set_property -dict  {PACKAGE_PIN  AF11  IOSTANDARD SSTL15} [get_ports {ddr3_1_p[0]}]
set_property -dict  {PACKAGE_PIN  AE8   IOSTANDARD SSTL15} [get_ports {ddr3_1_p[1]}]
set_property -dict  {PACKAGE_PIN  AE11  IOSTANDARD SSTL15} [get_ports {ddr3_1_n[0]}]
set_property -dict  {PACKAGE_PIN  AE10  IOSTANDARD SSTL15} [get_ports {ddr3_1_n[1]}]
set_property -dict  {PACKAGE_PIN  AC10  IOSTANDARD SSTL15} [get_ports {ddr3_1_n[2]}]

set_property slave_banks {32 34} [get_iobanks 33]

# ethernet

set_property -dict  {PACKAGE_PIN  L20   IOSTANDARD  LVCMOS25} [get_ports mii_rst_n]
set_property -dict  {PACKAGE_PIN  W19   IOSTANDARD  LVCMOS25} [get_ports mii_col]
set_property -dict  {PACKAGE_PIN  R30   IOSTANDARD  LVCMOS25} [get_ports mii_crs]
set_property -dict  {PACKAGE_PIN  R23   IOSTANDARD  LVCMOS25} [get_ports mdio_mdc]
set_property -dict  {PACKAGE_PIN  J21   IOSTANDARD  LVCMOS25} [get_ports mdio_mdio_io]
set_property -dict  {PACKAGE_PIN  U27   IOSTANDARD  LVCMOS25} [get_ports mii_rx_clk]
set_property -dict  {PACKAGE_PIN  R28   IOSTANDARD  LVCMOS25} [get_ports mii_rx_dv]
set_property -dict  {PACKAGE_PIN  V26   IOSTANDARD  LVCMOS25} [get_ports mii_rx_er]
set_property -dict  {PACKAGE_PIN  U30   IOSTANDARD  LVCMOS25} [get_ports mii_rxd[0]]
set_property -dict  {PACKAGE_PIN  U25   IOSTANDARD  LVCMOS25} [get_ports mii_rxd[1]]
set_property -dict  {PACKAGE_PIN  T25   IOSTANDARD  LVCMOS25} [get_ports mii_rxd[2]]
set_property -dict  {PACKAGE_PIN  U28   IOSTANDARD  LVCMOS25} [get_ports mii_rxd[3]]
set_property -dict  {PACKAGE_PIN  M28   IOSTANDARD  LVCMOS25} [get_ports mii_tx_clk]
set_property -dict  {PACKAGE_PIN  M27   IOSTANDARD  LVCMOS25} [get_ports mii_tx_en]
set_property -dict  {PACKAGE_PIN  N27   IOSTANDARD  LVCMOS25} [get_ports mii_txd[0]]
set_property -dict  {PACKAGE_PIN  N25   IOSTANDARD  LVCMOS25} [get_ports mii_txd[1]]
set_property -dict  {PACKAGE_PIN  M29   IOSTANDARD  LVCMOS25} [get_ports mii_txd[2]]
set_property -dict  {PACKAGE_PIN  L28   IOSTANDARD  LVCMOS25} [get_ports mii_txd[3]]

set_false_path -through [get_ports mii_rst_n]
set_property SLEW FAST [get_ports mii_txd*]
set_property SLEW FAST [get_ports mii_tx_en]

create_clock -add -name phy_rx_clk -period 8.000 [get_nets mii_rx_clk]
create_clock -period 40.000 -name phy_tx_clk [get_ports mii_tx_clk]

set_false_path -from [get_clocks phy_rx_clk] -to [get_clocks *]
set_false_path -from [get_clocks phy_tx_clk] -to [get_clocks *]
set_false_path -from [get_clocks *] -to [get_clocks phy_rx_clk]
set_false_path -from [get_clocks *] -to [get_clocks phy_tx_clk]

# uart

set_property -dict  {PACKAGE_PIN  M19   IOSTANDARD  LVCMOS25} [get_ports uart_sin]
set_property -dict  {PACKAGE_PIN  K24   IOSTANDARD  LVCMOS25} [get_ports uart_sout]

# fan

set_property -dict  {PACKAGE_PIN  L26   IOSTANDARD  LVCMOS25} [get_ports fan_pwm]

# lcd

set_property -dict  {PACKAGE_PIN  AB10  IOSTANDARD  LVCMOS15} [get_ports gpio_lcd[6]]
set_property -dict  {PACKAGE_PIN  Y11   IOSTANDARD  LVCMOS15} [get_ports gpio_lcd[5]]
set_property -dict  {PACKAGE_PIN  AB13  IOSTANDARD  LVCMOS15} [get_ports gpio_lcd[4]]
set_property -dict  {PACKAGE_PIN  Y10   IOSTANDARD  LVCMOS15} [get_ports gpio_lcd[3]]
set_property -dict  {PACKAGE_PIN  AA11  IOSTANDARD  LVCMOS15} [get_ports gpio_lcd[2]]
set_property -dict  {PACKAGE_PIN  AA10  IOSTANDARD  LVCMOS15} [get_ports gpio_lcd[1]]
set_property -dict  {PACKAGE_PIN  AA13  IOSTANDARD  LVCMOS15} [get_ports gpio_lcd[0]]

set_property -dict  {PACKAGE_PIN  Y29   IOSTANDARD  LVCMOS25} [get_ports gpio_sw[0]]
set_property -dict  {PACKAGE_PIN  W29   IOSTANDARD  LVCMOS25} [get_ports gpio_sw[1]]
set_property -dict  {PACKAGE_PIN  AA28  IOSTANDARD  LVCMOS25} [get_ports gpio_sw[2]]
set_property -dict  {PACKAGE_PIN  Y28   IOSTANDARD  LVCMOS25} [get_ports gpio_sw[3]]
set_property -dict  {PACKAGE_PIN  AA12  IOSTANDARD  LVCMOS15} [get_ports gpio_sw[4]]
set_property -dict  {PACKAGE_PIN  AG5   IOSTANDARD  LVCMOS15} [get_ports gpio_sw[5]]
set_property -dict  {PACKAGE_PIN  AB12  IOSTANDARD  LVCMOS15} [get_ports gpio_sw[6]]
set_property -dict  {PACKAGE_PIN  AC6   IOSTANDARD  LVCMOS15} [get_ports gpio_sw[7]]
set_property -dict  {PACKAGE_PIN  G12   IOSTANDARD  LVCMOS25} [get_ports gpio_sw[8]]

set_property -dict  {PACKAGE_PIN  AB8   IOSTANDARD  LVCMOS15} [get_ports gpio_led[0]]
set_property -dict  {PACKAGE_PIN  AA8   IOSTANDARD  LVCMOS15} [get_ports gpio_led[1]]
set_property -dict  {PACKAGE_PIN  AC9   IOSTANDARD  LVCMOS15} [get_ports gpio_led[2]]
set_property -dict  {PACKAGE_PIN  AB9   IOSTANDARD  LVCMOS15} [get_ports gpio_led[3]]
set_property -dict  {PACKAGE_PIN  AE26  IOSTANDARD  LVCMOS25} [get_ports gpio_led[4]]
set_property -dict  {PACKAGE_PIN  G19   IOSTANDARD  LVCMOS25} [get_ports gpio_led[5]]
set_property -dict  {PACKAGE_PIN  E18   IOSTANDARD  LVCMOS25} [get_ports gpio_led[6]]
set_property -dict  {PACKAGE_PIN  F16   IOSTANDARD  LVCMOS25} [get_ports gpio_led[7]]

# iic

set_property -dict  {PACKAGE_PIN  P23   IOSTANDARD  LVCMOS25} [get_ports iic_rstn]
set_property -dict  {PACKAGE_PIN  K21   IOSTANDARD  LVCMOS25  DRIVE 8 SLEW SLOW} [get_ports iic_scl]
set_property -dict  {PACKAGE_PIN  L21   IOSTANDARD  LVCMOS25  DRIVE 8 SLEW SLOW} [get_ports iic_sda]

# hdmi

set_property -dict  {PACKAGE_PIN  K18   IOSTANDARD  LVCMOS25} [get_ports hdmi_out_clk]
set_property -dict  {PACKAGE_PIN  J18   IOSTANDARD  LVCMOS25} [get_ports hdmi_hsync]
set_property -dict  {PACKAGE_PIN  H20   IOSTANDARD  LVCMOS25} [get_ports hdmi_vsync]
set_property -dict  {PACKAGE_PIN  H17   IOSTANDARD  LVCMOS25} [get_ports hdmi_data_e]
set_property -dict  {PACKAGE_PIN  B23   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[0]]
set_property -dict  {PACKAGE_PIN  A23   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[1]]
set_property -dict  {PACKAGE_PIN  E23   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[2]]
set_property -dict  {PACKAGE_PIN  D23   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[3]]
set_property -dict  {PACKAGE_PIN  F25   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[4]]
set_property -dict  {PACKAGE_PIN  E25   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[5]]
set_property -dict  {PACKAGE_PIN  E24   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[6]]
set_property -dict  {PACKAGE_PIN  D24   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[7]]
set_property -dict  {PACKAGE_PIN  F26   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[8]]
set_property -dict  {PACKAGE_PIN  E26   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[9]]
set_property -dict  {PACKAGE_PIN  G23   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[10]]
set_property -dict  {PACKAGE_PIN  G24   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[11]]
set_property -dict  {PACKAGE_PIN  J19   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[12]]
set_property -dict  {PACKAGE_PIN  H19   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[13]]
set_property -dict  {PACKAGE_PIN  L17   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[14]]
set_property -dict  {PACKAGE_PIN  L18   IOSTANDARD  LVCMOS25} [get_ports hdmi_data[15]]

# spdif

set_property -dict  {PACKAGE_PIN  J17   IOSTANDARD  LVCMOS25} [get_ports spdif]

# clocks

create_clock -name cpu_clk      -period 10.00 [get_pins i_system_wrapper/system_i/axi_ddr_cntrl/ui_addn_clk_0]
create_clock -name m200_clk     -period  5.00 [get_pins i_system_wrapper/system_i/axi_ddr_cntrl/ui_clk]
create_clock -name hdmi_clk     -period  6.73 [get_pins i_system_wrapper/system_i/axi_hdmi_clkgen/clk_0]
create_clock -name spdif_clk    -period 50.00 [get_pins i_system_wrapper/system_i/sys_audio_clkgen/clk_out1]

set_clock_groups -asynchronous -group {cpu_clk}
set_clock_groups -asynchronous -group {m200_clk}
set_clock_groups -asynchronous -group {hdmi_clk}
set_clock_groups -asynchronous -group {spdif_clk}

