class Usagestat < Formula
  desc "Scriptable CLI for local agent usage data"
  homepage "https://github.com/Hashim-K/usagestat"
  version "1.0.1"
  license "MIT"
  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hashim-K/usagestat/releases/download/v#{version}/usagestat-linux-aarch64.tar.gz"
      sha256 "6c850a17c0aaf2c55b8faa44a4827f2fa63d98235970314e42fbfe2f915f2e06"
    else
      url "https://github.com/Hashim-K/usagestat/releases/download/v#{version}/usagestat-linux-x86_64.tar.gz"
      sha256 "c6999f50dabd03a595edae6d908a5f588b0e1feb6a69588656612cb0532e96e5"
    end
  end

  def install
    bin.install "usagestat"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/usagestat --version")
  end
end
