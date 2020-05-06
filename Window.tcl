package require crc16

source procedures.tcl

wm title . ModBus_COM2

. config -bg grey80

#������� ���� �����
frame .window -width 700 -height 400 -bg grey80
#��������� �������� ������
pack propagate .window false
#��������� ��� 
pack .window

label .window.top -width 20 -height 20 -bg grey70
pack .window.top -side top
set buttons(open_com_modbus) [button .window.top.open_modbus -text MBOpen -width 8 -height 3 -command "open_com_modbus"]
set buttons(close_com_modbus) [button .window.top.close_modbus -text MBClose -width 8 -height 3 -command "close_com_modbus"]
set buttons(listenOn) [button .window.top.listenOn -text listenOn -width 8 -height 3 -command "listen_On"]
set buttons(listenOff) [button .window.top.listenOff -text listenOff -width 8 -height 3 -command "listen_Off"]
grid $buttons(open_com_modbus) $buttons(close_com_modbus) $buttons(listenOn) $buttons(listenOff) -sticky w

#������� ����� � ����
label .window.center -width 98 -height 46 -bg grey60
#��������� �������� ������
pack propagate .window.center false
#��������� ��� 
pack .window.center -side left

#���� Modbus �������
foreach {field_modbus label_modbus} {Otvet_modbus ����� Zapros_modbus ������} { 
label .window.center.l$field_modbus -text $label_modbus -anchor w 
entry .window.center.e$field_modbus -textvariable state($field_modbus) -width 45 -justify center -relief sunken
grid .window.center.l$field_modbus .window.center.e$field_modbus -sticky news 
}
set state(Otvet_modbus) "--modbus--"
set state(Zapros_modbus) "--modbus--"
#set buttons(open_com_modbus) [button .window.center.open_modbus -text MBOpen -width 8 -height 3 -command "open_com_modbus"]
#set buttons(close_com_modbus) [button .window.center.close_modbus -text MBClose -width 8 -height 3 -command "close_com_modbus"]
set buttons(send_modbus) [button .window.center.send_modbus -text ModbusSend -width 10 -height 3 -command "send_modbus"]
grid $buttons(send_modbus) -column 1 -row 2 -rowspan 2
#grid $buttons(open_com_modbus) $buttons(close_com_modbus) -sticky w


#������� ����� � ���� �����
label .window.botom -bg grey70
#��������� �������� ������
pack propagate .window.botom false
#��������� ��� 
pack .window.botom -side right

#���� Modbus �������
foreach {field_modbus_ label_modbus_} {Otvet_modbus_ �����_���� Zapros_modbus_ ������_������} { 
label .window.botom.l$field_modbus_ -text $label_modbus_ -anchor w 
entry .window.botom.e$field_modbus_ -textvariable state($field_modbus_) -width 45 -justify center -relief sunken
grid .window.botom.l$field_modbus_ .window.botom.e$field_modbus_ -sticky news 
}
set state(Otvet_modbus_) "modbus_"
set state(Zapros_modbus_) "modbus_"
