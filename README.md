# Homebrew Tap - shar-mayank/tools

A collection of useful command-line tools distributed via Homebrew.

## Installation

```bash
brew tap shar-mayank/tools
```

## Available Formulas

### convert2pdf

A command-line tool to convert between Office formats and PDF.

```bash
brew install shar-mayank/tools/convert2pdf
```

**Features:**
- Convert Office documents (DOC, DOCX, PPT, PPTX, XLS, XLSX) to PDF
- Convert PDF to Office formats (DOCX, PPTX)
- Convert TXT, RTF, CSV to PDF or DOCX
- Batch conversion support
- Cross-platform (macOS, Linux)

**Post-installation setup:**
```bash
# Install LibreOffice (required for conversions)
brew install --cask libreoffice

# Install Python dependencies
convert2pdf --setup
```

**Usage:**
```bash
# Convert document to PDF
convert2pdf document.docx

# Convert PDF to Word
convert2pdf report.pdf output.docx

# Batch convert all DOCX files
convert2pdf --batch "*.docx" output_folder/
```

For more information, visit the [convert2pdf repository](https://github.com/shar-mayank/convert2pdf).

## How to Use This Tap

Once tapped, you can install any formula with:

```bash
brew install <formula>
```

Or directly without tapping first:

```bash
brew install shar-mayank/tools/<formula>
```

## Updating

To update formulas from this tap:

```bash
brew update
brew upgrade
```

## Issues

If you encounter any issues with the formulas in this tap, please report them at the respective project repositories.

## License

Each formula is licensed according to its respective project. See individual formula files for details.
