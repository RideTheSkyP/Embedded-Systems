entity circuit is
  port (a, b, c : in bit; x, y : out bit);
end circuit;


architecture rtl of circuit is
begin
  x <= (not (a or b)) nor (not (b nor c));
  y <= (not (b nor c)) and (not (a xor c));
end rtl;
