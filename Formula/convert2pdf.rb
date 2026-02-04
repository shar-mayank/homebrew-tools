class Convert2pdf < Formula
  desc "Command-line tool to convert between Office formats and PDF"
  homepage "https://github.com/shar-mayank/convert2pdf"
  url "https://github.com/shar-mayank/convert2pdf/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e55770b0c4969e9bc09e5934e87b42452bdb5f53dba39dc7c0d1cb1c3629dda2"
  license "MIT"
  head "https://github.com/shar-mayank/convert2pdf.git", branch: "main"

  depends_on "python@3"

  def install
    bin.install "convert2pdf"
    bash_completion.install "completions/convert2pdf.bash" => "convert2pdf"
    zsh_completion.install "completions/convert2pdf.zsh" => "_convert2pdf"
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
    assert_match "convert2pdf version 1.0.0", shell_output("#{bin}/convert2pdf --version")
    assert_match "Usage:", shell_output("#{bin}/convert2pdf --help")
    assert_predicate bin/"convert2pdf", :executable?
  end
end
