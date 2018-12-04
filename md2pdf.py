import codecs
import os
import click
import markdown
from weasyprint import HTML
from werkzeug.serving import run_simple
from werkzeug.wrappers import Response
from werkzeug.wsgi import responder

EXISTING_FILE = click.Path(exists=True, dir_okay=False, resolve_path=True)


def _html(markdown_file_name, css_file_name):
    with codecs.open(markdown_file_name, mode="r", encoding="utf-8") as markdown_file:
        with codecs.open(css_file_name, mode="r", encoding="utf-8") as css_file:
            markdown_input = markdown_file.read()
            css_input = css_file.read()

            html = markdown.markdown(
                markdown_input,
                extensions=["extra", "markdown_include.include", "meta", "tables"],
            )

            return f"""
            <html>
              <head>
                <style>{css_input}</style>
              </head>
              <body>{html}</body>
            </html>
            """


def _app(markdown_file_name, css_file_name):
    @responder
    def respond(_environ, _start_response):
        return Response(_html(markdown_file_name, css_file_name), mimetype="text/html")

    return respond


@click.group()
def cli():
    pass


@cli.command()
@click.argument("md", type=EXISTING_FILE)
@click.argument("css", type=EXISTING_FILE)
def serve(md, css):
    """Converts Markdown file MD and stylesheet CSS, and serves result."""
    run_simple("localhost", 8080, _app(md, css))


@cli.command()
@click.argument("md", type=EXISTING_FILE)
@click.argument("css", type=EXISTING_FILE)
def convert(md, css):
    """Converts Markdown file MD and stylesheet CSS to PDF."""
    html = HTML(string=_html(md, css), base_url=".")
    file_name = os.path.splitext(md)[0] + ".pdf"
    html.write_pdf(file_name)


if __name__ == "__main__":
    cli()
