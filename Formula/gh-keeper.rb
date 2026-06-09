# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class GhKeeper < Formula
  desc "I only exist to depend on gh so that it doesn't get \"accidentally\" uninstalled"
  homepage "https://github.com/danmactough/homebrew-gh-keeper"
  url "https://github.com/danmactough/homebrew-gh-keeper/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "26e722295d65e05eea07626651941494cd558f9f61df78d7351498494eadfb6d"
  license ""

  depends_on "gh"

  def install
    bin.install "src/run.sh" => "gh-keeper"
  end

  test do
    system "#{bin}/gh-keeper", "danmactough"
  end
end
