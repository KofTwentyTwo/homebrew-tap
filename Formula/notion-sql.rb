class NotionSql < Formula
  desc "Run SQL-style CRUD statements against Notion databases"
  homepage "https://github.com/KofTwentyTwo/notion-sql"
  version "1.0.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/KofTwentyTwo/notion-sql/releases/download/v1.0.1/notion-sql-aarch64-apple-darwin.tar.xz"
      sha256 "79443651b4d81ade368fdb9abe8c2df4e30dadebf325e411ceeff4524e2a05da"
    end
    if Hardware::CPU.intel?
      url "https://github.com/KofTwentyTwo/notion-sql/releases/download/v1.0.1/notion-sql-x86_64-apple-darwin.tar.xz"
      sha256 "21a1f232a1daeaeb500754b512e7eed56561b5886b2c70cd617350d7f0e08a70"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/KofTwentyTwo/notion-sql/releases/download/v1.0.1/notion-sql-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ad4b481d6eda4b308b91436bb7b14cb92539d6802e29963acf09f7069dba2a9f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/KofTwentyTwo/notion-sql/releases/download/v1.0.1/notion-sql-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bd36914a73aa94ca57d31008f2623016c4e93bd4d78f86a170353b7e3e52a721"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "notion-sql" if OS.mac? && Hardware::CPU.arm?
    bin.install "notion-sql" if OS.mac? && Hardware::CPU.intel?
    bin.install "notion-sql" if OS.linux? && Hardware::CPU.arm?
    bin.install "notion-sql" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
