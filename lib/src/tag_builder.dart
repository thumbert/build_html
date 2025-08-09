class TagBuilder {
  final String tagName;
  final Map<String, String> _attributes = {};
  final Set<String> _classes = {};
  final List<dynamic> _children = []; // can be TagBuilder or String
  bool _selfClosing = false;

  TagBuilder(this.tagName);

  TagBuilder attr(String name, String value) {
    _attributes[name] = value;
    return this;
  }

  TagBuilder className(String className) {
    _classes.add(className);
    return this;
  }

  TagBuilder classes(Iterable<String> classNames) {
    _classes.addAll(classNames);
    return this;
  }

  TagBuilder text(String text) {
    _children.add(_escape(text));
    return this;
  }

  TagBuilder child(TagBuilder child) {
    _children.add(child);
    return this;
  }

  TagBuilder children(Iterable<TagBuilder> children) {
    _children.addAll(children);
    return this;
  }

  TagBuilder selfClose() {
    _selfClosing = true;
    return this;
  }

  String toHtml() {
    final buffer = StringBuffer();
    buffer.write('<$tagName');

    if (_classes.isNotEmpty) {
      buffer.write(' class="${_classes.join(' ')}"');
    }
    _attributes.forEach((k, v) {
      buffer.write(' $k="${_escape(v)}"');
    });

    if (_selfClosing && _children.isEmpty) {
      buffer.write(' />');
      return buffer.toString();
    }

    buffer.write('>');
    for (var child in _children) {
      if (child is TagBuilder) {
        buffer.write(child.toHtml());
      } else if (child is String) {
        buffer.write(child);
      }
    }
    buffer.write('</$tagName>');
    return buffer.toString();
  }

  static String _escape(String text) {
    return text
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;');
  }
}

class HtmlBuilder extends TagBuilder {
  HtmlBuilder() : super('html');
}