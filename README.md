# Markdown to PDF

This repository contains (an outdated version of) my CV in Markdown, which can be converted into a PDF document using the toolchain described below.
The heavy lifting is done by [Python-Markdown](https://python-markdown.github.io/), a tool for generating HTML from Markdown, and [WeasyPrint](https://weasyprint.org), a tool for generating PDF documents from HTML and CSS.
With a small script that combines the HTML from a Markdown file with a CSS stylesheet, [my CV in Markdown](https://github.com/ljpengelen/markdown-to-pdf/blob/master/cv.md) is converted into [a PDF document](https://github.com/ljpengelen/markdown-to-pdf/blob/master/cv.pdf).

This is just a proof-of-concept at the moment.
Turning this idea into a stand alone tool is straightforward.

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

## Generating the PDF

1. Execute `python cv.py` to convert `cv.md` and `cv.css` into a single file `cv.html`.
1. Execute `weasyprint cv.html cv.pdf` to convert the HTML file into a PDF document.
