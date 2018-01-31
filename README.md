[![Build Status](https://travis-ci.org/KITrobotics/Latex_Template.svg?branch=master)](https://travis-ci.org/KITrobotics/Latex_Template)

# Latex_Template
Latex Template from Institute for Anthropomatics and Robotics (IAR) - Intelligent Process Automation and Robotics Lab (IPR) (Karlsruhe Institute of Technology - KIT) for thesis and reports.

## Usage

The main document of this template is `thesis.tex` file providing document configuration and structure. To start one should first compile this document without any errors to be sure that all Latex packages are installed.

### Document type and language

After successful compiling choose the language and thesis type in the first line of `thesis.tex` document.

E.g. for Bachelor thesis written in English it should write:
```
\documentclass[english,bachelor]{IPRthesis}
```

E.g. for Master thesis written in German it should write:
```
\documentclass[german,master]{IPRthesis}
```

### Content

After that, edit the same file by entering a title of the thesis, who the author, supervisor and reviewers are.

To add some content in the file edit files in the folder `Content`.

### Bibliography

To add the bibliography use `Bibliography/thesis.bib` file. To add custom Bibliography files add them into `Bibliography` folder and edit `\Bibliography` command near the end of the `thesis.tex` file, e.g.
```
\Bibliography{Bibliography/thesis,Bibliography/custom_file}
```

### Finalizing document

After filling all the content one can generate *final*, submit- and print-ready, version by using option `final`, e.g.
```
\documentclass[english,bachelor,final]{IPRthesis}
```

Besides that one should generate declaration file for signing by using option `declaration`, e.g.
```
\documentclass[english,bachelor,declaration]{IPRthesis}
```
