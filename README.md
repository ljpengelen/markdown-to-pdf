# Markdown to PDF

This repository contains a simple script that converts Markdown and CSS into PDF documents.
The heavy lifting is done by [Python-Markdown](https://python-markdown.github.io/), a tool for generating HTML from Markdown, and [WeasyPrint](https://weasyprint.org), a tool for generating PDF documents from HTML and CSS.
With this script, [my CV in Markdown](https://github.com/ljpengelen/markdown-to-pdf/blob/master/examples/cv.md) is converted into [a PDF document](https://github.com/ljpengelen/markdown-to-pdf/blob/master/examples/cv.pdf).

## Getting Started

1. Install [pyenv](https://github.com/pyenv/pyenv), a tool for managing [Python](https://www.python.org/) versions.
1. The file `.python-version` in the root folder specifies the Python version required by this toolchain.
  Navigate to the root folder and execute `pyenv install` to install this Python version.
1. Install `cairo`, `pango`, and `gdk-pixbuf`.
  On macOS, these tools can be installed with `brew`.
1. Install [pipenv](https://pypi.python.org/pypi/pipenv) by executing `pip install pipenv`.
  There's an [issue related to language and region settings](https://github.com/kennethreitz/pipenv/issues/538) that you might run into on Macs, but it's easy to resolve.
1. Create a new virtual environment with all dependencies by executing `pipenv install --dev --ignore-pipfile`.
  The flag `ignore-pipfile` is used to indicate that the exact versions of the dependencies as specified in `Pipfile.lock` should be installed.
  The flag `dev` is used to also install development dependencies.

## Activating the virtual environment

Before executing any of the commands below, you need to activate the virtual environment for this toolchain.
You can do so by executing `pipenv shell`.
Your command prompt should now indicate that you've activated the virtual environment.
It can be deactivated by executing `exit`.

## Generating PDFs

The `examples` folder contains a CV and a quotation.

* Execute `python md2pdf.py convert examples/cv.md examples/cv.css` to generate a PDF version of the CV.
* Execute `python md2pdf.py convert examples/quotation.md examples/quotation.css` to generate a PDF version of the quotation.

When writing or designing documents, you can use `python md2pdf.py watch <document_name>.md <stylesheet_name>.css`.
This will watch the given files and generate new output when they change.
Both an HTML document and a PDF document are generated.
The HTML document is generated because it's convenient to be able to play around with the CSS in a browser.

## CSS for print

If you want to design your own documents, take a look at [designing for print with CSS](https://www.smashingmagazine.com/2015/01/designing-for-print-with-css/) by Rachel Andrew.
