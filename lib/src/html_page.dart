import 'package:build_html/src/html_container.dart';
import 'package:build_html/src/html_child.dart';

enum ScriptType {
  async,
  defer,
  plain;

  @override
  String toString() {
    switch (this) {
      case ScriptType.async:
        return 'async';
      case ScriptType.defer:
        return 'defer';
      case ScriptType.plain:
        return '';
    }
  }
}

enum HtmlVersion {
  html4,
  html5,
  xhtml1_0,
  xhtml1_1;

  String docType() {
    switch (this) {
      case HtmlVersion.html4:
        return '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
      case HtmlVersion.html5:
        return '<!DOCTYPE html>';
      case HtmlVersion.xhtml1_0:
        return '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">';
      case HtmlVersion.xhtml1_1:
        return '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">';
    }
  }

  String htmlAttrs() {
    switch (this) {
      case HtmlVersion.html4:
        return ' xmlns="http://www.w3.org/1999/xhtml"';
      case HtmlVersion.html5:
        return '';
      case HtmlVersion.xhtml1_0:
        return ' xmlns="http://www.w3.org/1999/xhtml"';
      case HtmlVersion.xhtml1_1:
        return ' xmlns="http://www.w3.org/1999/xhtml"';
    }
  }
}

class HtmlPage extends HtmlChild with HtmlContainer, Html {
  HtmlPage({this.version = HtmlVersion.html5}) {
    head = '';
    body = '';
  }

  final HtmlVersion version;
  late String head;
  late String body;

  void addHeadLink(
    String href,
    String rel,
    List<(String, String)> attributes,
  ) {
    var link = '<link href="$href" rel="$rel"';
    for (var (key, value) in attributes) {
      link += ' $key="$value"';
    }
    link += '/>';
    head += link;
  }

  void addHtmlHead<T extends Html>(T html) {
    head += html.toHtml();
  }

  @override
  void addHtml<T extends Html>(T html) {
    body += html.toHtml();
  }

  void addMeta(List<(String, String)> attributes) {
    var meta = '<meta';
    for (var (key, value) in attributes) {
      meta += ' $key="$value"';
    }
    meta += '/>';
    head += meta;
  }

  void addScriptLink(String src, ScriptType type) {
    body += '<script $type src="$src"></script>';
  }

  void addStyle(String css, {List<(String, String)> attributes = const []}) {
    var style = '<style';
    for (var (key, value) in attributes) {
      style += ' $key="$value"';
    }
    style += '>$css</style>';
    head += style;
  }

  HtmlPage withHeadLink(
    String href,
    String rel, {
    List<(String, String)> attributes = const <(String, String)>[],
  }) {
    addHeadLink(href, rel, attributes);
    return this;
  }

  HtmlPage withHtmlHead<T extends Html>(T html) {
    addHtmlHead(html);
    return this;
  }

  HtmlPage withMeta(List<(String, String)> attributes) {
    addMeta(attributes);
    return this;
  }

  HtmlPage withStyle(
    String css, {
    List<(String, String)> attributes = const <(String, String)>[],
  }) {
    addStyle(css, attributes: attributes);
    return this;
  }

  @override
  String toHtml() {
    return "${version.docType()}<html${version.htmlAttrs()}><head>$head</head><body>$body</body></html>";
  }
}
