class Limen < Formula
  desc "Terminal launcher TUI for tmux and SSH"
  homepage "https://github.com/KofTwentyTwo/limen"
  version "0.1.0"
  license "GPL-3.0-only"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/KofTwentyTwo/limen/releases/download/v#{version}/limen-macos-arm64"
      sha256 "efd5b6ffeeaf978fdd21de5f1389f184733a34ce75f0f29ab9e48e6c1ffb557c"
    end

    on_intel do
      url "https://github.com/KofTwentyTwo/limen/releases/download/v#{version}/limen-macos-amd64"
      sha256 "e056b8baf897be2b532721b7cce611d177525f1749e8cb17f81611d3f17e361c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KofTwentyTwo/limen/releases/download/v#{version}/limen-linux-arm64"
      sha256 "65f8381903f6a17509737d4272fd4f22b0e21cd82390cefc4f6870cb4285fb7c"
    end

    on_intel do
      url "https://github.com/KofTwentyTwo/limen/releases/download/v#{version}/limen-linux-amd64"
      sha256 "c9f38de6c503a2b81f5ffaf5e4e10f2c1818cf79500d77b6974871005e8336e1"
    end
  end

  def install
    binary = Dir["limen-*"].first
    chmod 0755, binary
    bin.install binary => "limen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/limen --version")
  end
end
