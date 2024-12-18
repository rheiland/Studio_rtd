# Configuration file for the Sphinx documentation builder.

# -- Project information

project = 'PhysiCell Studio'
copyright = '2024, Randy Heiland, Daniel Bergman, Marco Ruscone, Heber Rocha, Vincent Noel, Paul Macklin. Thanks to the entire MathCancer Lab (past and present members) at Indiana University, the broader PhysiCell community, and many undergraduate students who have made valuable contributions. A special thanks to Aydan Bondurant (Fall 2024) who contributed the automated build for these readthedocs.'
author = 'Heiland'

release = '0.1'
version = '0.1.0'

# -- General configuration

extensions = [
    'sphinx.ext.doctest',
    'sphinx.ext.autodoc',
    'sphinx.ext.autosummary',
    'sphinx.ext.intersphinx',
]

intersphinx_mapping = {
    'python': ('https://docs.python.org/3/', None),
    'sphinx': ('https://www.sphinx-doc.org/en/master/', None),
}
intersphinx_disabled_domains = ['std']

templates_path = ['_templates']

html_static_path = ["_static"]

# -- Options for HTML output

html_theme = 'sphinx_rtd_theme'

# -- Options for EPUB output
epub_show_urls = 'footnote'

master_doc = 'index'