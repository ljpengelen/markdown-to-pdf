import codecs
import markdown

with codecs.open("cv.md", mode="r", encoding="utf-8") as input_file:
    text = input_file.read()

    html = """
    <html>
      <head>
        <link rel="stylesheet" href="cv.css">
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
        "cv.html", "w", encoding="utf-8", errors="xmlcharrefreplace"
    ) as output_file:
        output_file.write(html)
