class Nuncio < Formula
  desc "Sovereign Mail, Calendar & Contacts Suite with 100% Multi-Shell Parity"
  homepage "https://nuncio.mx"
  url "https://github.com/KofTwentyTwo/nuncio/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/KofTwentyTwo/nuncio.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/nuncio-cli")
    system "cargo", "install", *std_cargo_args(path: "crates/nuncio-tui")
    system "cargo", "install", *std_cargo_args(path: "crates/nuncio-mcp")
    system "cargo", "install", *std_cargo_args(path: "crates/nunciod")
  end

  test do
    assert_match "nuncio", shell_output("#{bin}/nuncio-cli --version")
    assert_match "Nuncio", shell_output("#{bin}/nuncio-cli banner")
  end
end
