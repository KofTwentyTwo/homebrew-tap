class NotionSql < Formula
  desc "Run SQL-style CRUD statements against Notion databases"
  homepage "https://github.com/KofTwentyTwo/notion-sql"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/KofTwentyTwo/notion-sql/releases/download/v0.1.0/notion-sql-aarch64-apple-darwin.tar.xz"
      sha256 "cc0ceb649c1b8a35ce605ee23d195778b8b0a5e466a396f56f31c54866a28119"
    end
    if Hardware::CPU.intel?
      url "https://github.com/KofTwentyTwo/notion-sql/releases/download/v0.1.0/notion-sql-x86_64-apple-darwin.tar.xz"
      sha256 "4acd287577beadebc34e78517e20fbf54b5c6fc79c33fcadf35185fdf7adc4f0"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/KofTwentyTwo/notion-sql/releases/download/v0.1.0/notion-sql-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "79795964947ce45e4d2787151130451794b1b9923ff18c2db3f89308a30e6014"
    end
    if Hardware::CPU.intel?
      url "https://github.com/KofTwentyTwo/notion-sql/releases/download/v0.1.0/notion-sql-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8ecedf8c24ea4db6637f7d689106fd2eba69b3081957e5ab542a0b446a3e583b"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
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
