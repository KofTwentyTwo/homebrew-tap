class Nuncio < Formula
  desc "Sovereign Mail & Calendar Suite for Power Users, Teams, and Autonomous Agents"
  homepage "https://nuncio.mx"
  version "1.0.0"
  license "MIT OR Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/KofTwentyTwo/nuncio/releases/download/v1.0.0/nuncio-aarch64-apple-darwin.tar.gz"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
    if Hardware::CPU.intel?
      url "https://github.com/KofTwentyTwo/nuncio/releases/download/v1.0.0/nuncio-x86_64-apple-darwin.tar.gz"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/KofTwentyTwo/nuncio/releases/download/v1.0.0/nuncio-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
  end

  def install
    bin.install "nuncio-cli" => "nuncio"
    bin.install "nuncio-cli"
    bin.install "nuncio-tui"
    bin.install "nuncio-mcp"
    bin.install "nunciod"
  end

  test do
    assert_match "nuncio", shell_output("#{bin}/nuncio --version")
  end
end
