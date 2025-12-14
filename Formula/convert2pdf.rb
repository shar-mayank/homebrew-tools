class Convert2pdf < Formula
  desc "Command-line tool to convert between Office formats and PDF"
  homepage "https://github.com/shar-mayank/convert2pdf"
  url "https://github.com/shar-mayank/convert2pdf/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "3af26db77fe23577c9ff8027fdd2ba41a6801485de246322acc18649ab712857"
  license "MIT"
  version "1.0.1"
  head "https://github.com/shar-mayank/convert2pdf.git", branch: "main"

  depends_on "python@3"

  def install
    # Install the main script
    bin.install "convert2pdf"

    # Install shell completions
    bash_completion.install "completions/convert2pdf.bash" => "convert2pdf"
    zsh_completion.install "completions/convert2pdf.zsh" => "_convert2pdf"

    # Install requirements.txt for --setup command
    pkgshare.install "requirements.txt"
  end

  def caveats
    <<~EOS
      convert2pdf requires additional setup:

      1. Install LibreOffice for Office-to-PDF conversions:
           brew install --cask libreoffice

      2. Install Python dependencies:
           convert2pdf --setup
         Or manually:
           pip3 install pdf2docx PyPDF2 python-pptx "numpy<2.0"
    EOS
  end

  test do
    # Version test
    assert_match "convert2pdf version 1.0.1", shell_output("#{bin}/convert2pdf --version")

    # Help test
    assert_match "Usage:", shell_output("#{bin}/convert2pdf --help")

    # Test that the script is executable
    assert_predicate bin/"convert2pdf", :executable?
  end
end
