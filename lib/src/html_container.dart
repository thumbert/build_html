mixin Html {
  /// Returns the HTML representation of the object.
  String toHtml();

  // /// Returns the HTML representation of the object with a specified indentation.
  // String toHtmlWithIndent(String indent);

  // /// Returns the HTML representation of the object with a specified indentation and line breaks.
  // String toHtmlWithIndentAndLineBreaks(String indent, bool lineBreaks);
}

/// An HTML element that can contain other HTML elements.
mixin HtmlContainer {
  void addHtml<T extends Html>(T html);

  HtmlContainer withHtml<T extends Html>(T html) {
    addHtml(html);
    return this;
  }

  // void addParagraph(String text) {
  //   addHtml(Paragraph(text));
  // }
}
