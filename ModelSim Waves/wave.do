onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /frogdis_tb/clock
add wave -noupdate /frogdis_tb/reset
add wave -noupdate -expand -group inputs /frogdis_tb/d
add wave -noupdate -expand -group inputs /frogdis_tb/l
add wave -noupdate -expand -group inputs /frogdis_tb/r
add wave -noupdate -expand -group inputs /frogdis_tb/u
add wave -noupdate /frogdis_tb/col
add wave -noupdate /frogdis_tb/row
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
WaveRestoreZoom {700 ps} {1700 ps}
