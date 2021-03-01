use std.textio.all;


entity hello is
end hello;

architecture behaviour of hello is
begin
  process
    variable l : line;
    variable r : line;
  begin
    write (l, String'("Hello world!"));
    writeline (output, l);
    readline (input, r);
    writeline (output, r);
    wait;
  end process;
end behaviour;
