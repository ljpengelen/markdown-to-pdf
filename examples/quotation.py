import codecs
import markdown

with codecs.open("quotation.md", mode="r", encoding="utf-8") as input_file:
    text = input_file.read()

    html = """
    <html>
      <head>
        <link rel="stylesheet" href="quotation.css">
      </head>
      <body>
    """

    html += markdown.markdown(
        text, extensions=["extra", "markdown_include.include", "meta", "tables"]
    )

    html += """
      </body>
    </html>
    """

    with codecs.open(
        "quotation.html", "w", encoding="utf-8", errors="xmlcharrefreplace"
    ) as output_file:
        output_file.write(html)
