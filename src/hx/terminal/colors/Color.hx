package hx.terminal.colors;

enum Color {
  // 16 standard colors (8 std. + 8 brighter shades)
  Black;
  Red;
  Green;
  Yellow;
  Blue;
  Cyan;
  Magenta;
  White;
  // 256 colors
  Indexed(i: Int);
  // r(0-255), g(0-255), b(0-255) or 16 million colors
  Rgb(r: Int, g: Int, b: Int);
}