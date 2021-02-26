# hx-terminal-colors

For displaying colored console/terminal output with haxe (i.e.[chalk](https://github.com/chalk/chalk)).

## Example

See src/example/Main.hx

```hx
import hx.terminal.colors.Colorizer.inStyle as ins;

... 

  public static function main () {

    var opt_fg = new OptionFlags();
    opt_fg.set(Options.Bold);
    opt_fg.set(Options.Strikethrough);
    opt_fg.set(Options.Underlined);

    var opt_bg = new OptionFlags();
    opt_bg.set(Options.Bright);

    var tag = Colorizer.build({
      fg:  {
        color: Color.Indexed(70), // 256 colors
        options: opt_fg,
      },
      bg: {
        color: Color.Cyan, // 16 colors 
        options: opt_bg,
      }
    });

    var tag2 = Colorizer.build({
      fg: {
        color: Rgb(0, 128, 255), // r(0-255), g(0-255), b(0-255) or 16 million colors
      },
    });

    var opt3 = new OptionFlags();
    opt3.set(Options.Inverse);
    opt3.set(Options.Dim);

    var tag3 = Colorizer.build({
      fg: {
        color: Color.Red,
        options: opt3,
      }
    });

    trace(ins('hx', tag), ins('terminal', tag2), ins('colors', tag3));
  }

```

## API

### Colorizer 

```hx
package hx.terminal.colors;

class Colorizer {
  // build style tag from styles
  public static function build(style: Style): String {

  // apply style tag on string value; will reset style always
  public static function inStyle(value: String, tag:String): String {
}
```

### Style 

```hx
package hx.terminal.colors;

typedef Ground = {
  var ?color: Color; // optional
  var ?options: OptionFlags; // optional
}

typedef Style = {
  // foreground
  var ?fg: Ground; // optional
  // background
  var ?bg: Ground; // optional
}

```

### Colors
```hx 
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
```

### Options & OptionFlags

```hx

package hx.terminal.colors;

enum Options {
  Bold;
  Dim;
  Italic;
  Underlined;
  Inverse;
  Hidden;
  Strikethrough;
  Bright;
}

typedef OptionFlags = haxe.EnumFlags<Options>;

```

## Thanks 
  - Based on [chalk](https://github.com/chalk/chalk) 
  - Based on [ansi-styles](https://github.com/chalk/ansi-styles/blob/b890cf7edccf56215e5948d1cc385fa4e85a8969/index.js)
  - [Terminal Colors by Chris Yeh](https://chrisyeh96.github.io/2020/03/28/terminal-colors.html)