symbol L_Bumper = pin2
symbol R_Bumper = pin1

StartUp:
b5 = 0
b6 = 0
do
readadc 0,b4

if b4 > b5 then
b5 = b4
end if

b6 = b6+1
pause 500
loop until b6 = 16
b5 = b5+25
wait 2
pins = %11000011
goto main

main: 
random w0

readadc 0,b4

if b4 > b5 then gosub BackUp


if L_Bumper = 1 or R_Bumper = 1 then
pause 250
	if L_Bumper = 1 and R_Bumper = 1 then 
	gosub BackUp
	else if L_Bumper = 1 then 
	gosub TurnR
	else if R_Bumper = 1 then 
	gosub TurnL
	end if
end if

goto main:

Backward_C:
pins = %00111100
return

Stop_C:
pins = %00000000
return

Random_C:
if w0 < 500 or w0 > 3000 then

	do
		w0=w0+w1
		random w0
'		if w0 >= 10000 then
'		w0 = w0/10
'		end if
		w1 = w0/2-10000+1000
	loop until w0 >= 500 and w0 <= 3000
end if
return

TurnR:
gosub Stop_C
gosub Random_C
gosub Backward_C
pause 250
pins = %00001100
pause w0
pins = %11000011
return

TurnL:
gosub Stop_C
gosub Random_C
gosub Backward_C
pause 250
pins = %00110000
pause w0
pins = %11000011
return

BackUp:
gosub Stop_C
gosub Random_C
gosub Backward_C
pause 500
pins = %11001100
pause w0
pins = %11000011
return

