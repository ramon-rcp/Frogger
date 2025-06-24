onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /frogger_tb/clock
add wave -noupdate {/frogger_tb/dut/SW[9]}
add wave -noupdate -expand /frogger_tb/dut/cars
add wave -noupdate -expand -group lvl1 /frogger_tb/dut/carlvl1/carRow
add wave -noupdate -expand -group lvl2 /frogger_tb/dut/carlvl2/carRow
add wave -noupdate -expand -group lvl3 /frogger_tb/dut/carlvl3/carRow
add wave -noupdate -expand -group addcar /frogger_tb/dut/rhigh/c
add wave -noupdate -expand -group addcar {/frogger_tb/dut/rhigh/s[8]}
add wave -noupdate -expand -group addcar {/frogger_tb/dut/rhigh/s[7]}
add wave -noupdate -expand -group {led display} /frogger_tb/dut/Driver/RST
add wave -noupdate -expand -group {led display} /frogger_tb/dut/Driver/EnableCount
add wave -noupdate -expand -group {led display} /frogger_tb/dut/Driver/Counter
add wave -noupdate -expand -group {led display} /frogger_tb/dut/Driver/RowSelect
add wave -noupdate -expand -group {led display} /frogger_tb/dut/Driver/GPIO_1
add wave -noupdate -expand -group {led display} /frogger_tb/dut/Driver/RedPixels
add wave -noupdate -expand -group {led display} /frogger_tb/dut/Driver/GrnPixels
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {151 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 211
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1523 ps}
