-- main.adb

with AVR; use AVR;
with AVR.MCU;
with AVR.Real_Time.Delays; pragma Unreferenced (AVR.Real_Time.Delays);

procedure Main is

   LED : Boolean renames MCU.PORTB_Bits (0);

begin
   MCU.CLKPR := 16#80#; -- pozwala przez 4 cykle wpisac dzielnik
   MCU.CLKPR := 16#00#; -- wpisuje dzielnik rowny 1

   MCU.DDRB_Bits := (others => DD_Output);

   loop
      LED := High;
      delay 0.1;
      LED := Low;
      delay 0.1;
   end loop;
end Main;
