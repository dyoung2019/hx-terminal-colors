package hx.terminal.colors;

class Colorizer {
  static function getStandardColor(color: Color): Int {
    switch color {
      case Black:
        return 0;
      case Red:
        return 1;
      case Green: 
        return 2;
      case Yellow:
        return 3;
      case Blue:
        return 4;
      case Magenta:
        return 5;
      case Cyan: 
        return 6;
      case White: 
        return 7;
      case _:
        return 0;
    }
  }

  static function mapOptions(options: OptionFlags) {
    var parameters: Array<Int>= [];
    if (options.has(Options.Bold)) {
      parameters.push(1);
    }

    if (options.has(Options.Dim)) {
      parameters.push(2);
    }

    if (options.has(Options.Italic)) {
      parameters.push(3);
    }

    if (options.has(Options.Underlined)) {
      parameters.push(4);
    }

    if (options.has(Options.Inverse)) {
      parameters.push(7);
    }
    
    if (options.has(Options.Hidden)) {
     parameters.push(8);
    }

    if (options.has(Options.Strikethrough)) {
      parameters.push(9);
     }
    
    return parameters;
  }

  public static function buildGround(initialOffset: Int, ground: Ground): Array<Int> {
    var baseColor: Int = initialOffset;

    var options = ground.options;

    var parameters = (options != null)
      ? mapOptions(options)
      : [];

    switch ground.color {
      case Rgb(r, g, b): {
        baseColor += 38;
        parameters.push(baseColor);
        parameters.push(2);
        parameters.push(r);
        parameters.push(g);
        parameters.push(b);
      }
      case Indexed(i): {
        baseColor += 38;
        parameters.push(baseColor);
        parameters.push(5);
        parameters.push(i);
      }
      case _: {
        baseColor += 30;
        baseColor += getStandardColor(ground.color);  
        if (options.has(Options.Bright)) {  
          baseColor += 60;
        }
        parameters.push(baseColor);
      }
    }

    return parameters;
  }

  static function buildTag(offset: Int, style: Ground) : String {
    if (style != null) {
      return '\x1b[' + buildGround(offset, style).join(';') + 'm';
    } else {
      return '';
    }
  }

  public static function build(style: Style): String {
    var fg = style.fg;
    var bg = style.bg;
    return buildTag(0, fg) + buildTag(10, bg);
  }

  public static function inStyle(value: String, tag:String): String {
    var RESET_TAG = '\x1b[0m';
    return tag + value + RESET_TAG;
  }
}