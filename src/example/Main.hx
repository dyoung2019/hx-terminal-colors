package example;

import hx.terminal.colors.Colorizer;
import hx.terminal.colors.OptionFlags;
import hx.terminal.colors.Options;
import hx.terminal.colors.Color;
import hx.terminal.colors.Colorizer.inStyle as ins;

class Main {
  public static function main () {

    var opt_fg = new OptionFlags();
    opt_fg.set(Options.Bold);
    opt_fg.set(Options.Strikethrough);
    opt_fg.set(Options.Underlined);

    var opt_bg = new OptionFlags();
    opt_bg.set(Options.Bright);

    var tag = Colorizer.build({
      fg:  {
        color: Color.Indexed(70),
        options: opt_fg,
      },
      bg: {
        color: Color.Cyan,
        options: opt_bg,
      }
    });

    var tag2 = Colorizer.build({
      fg: {
        color: Rgb(0, 128, 255),
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
}