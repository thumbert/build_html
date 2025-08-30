import 'package:build_html/build_html.dart';
import 'package:build_html/src/attributes.dart';

enum ScriptType {
  async,
  defer,
  plain;

  @override
  String toString() {
    switch (this) {
      case ScriptType.async:
        return 'async ';
      case ScriptType.defer:
        return 'defer ';
      case ScriptType.plain:
        return '';
    }
  }
}

class Link implements Html {
  Link({required this.href, required this.rel, required this.attr});
  final String href;
  final String rel;
  final Attributes attr;
  @override
  String toHtml() {
    return '<link href="$href" rel="$rel"${attr.toString()}>';
  }
}

class Meta implements Html {
  Meta({required this.attr});
  final Attributes attr;
  @override
  String toHtml() {
    return '<meta${attr.toString()}>';
  }
}

class ScriptLink implements Html {
  ScriptLink({
    required this.src,
    required this.attr,
    this.type = ScriptType.plain,
  });
  final String src;
  final Attributes attr;
  final ScriptType type;
  @override
  String toHtml() {
    return '<script ${type}src="$src"${attr.toString()}></script>';
  }
}

class ScriptLiteral implements Html {
  ScriptLiteral({required this.code});
  final String code;
  @override
  String toHtml() {
    return '<script>$code</script>';
  }
}

class Style implements Html {
  Style({required this.css, required this.attr});
  final String css;
  final Attributes attr;
  @override
  String toHtml() {
    return '<style${attr.toString()}>$css</style>';
  }
}

class Title implements Html {
  Title({required this.content});
  final String content;
  @override
  String toHtml() {
    return '<title>$content</title>';
  }
}
