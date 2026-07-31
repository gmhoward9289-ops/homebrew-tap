# Homebrew formula for roost. The master copy lives in the roost repo at
# packaging/roost.rb and is copied here on release; edit it there, not here.
#
# After tagging a release, refresh the checksum with:
#   curl -sL https://github.com/gmhoward9289-ops/roost/archive/refs/tags/v0.4.tar.gz | shasum -a 256
class Roost < Formula
  include Language::Python::Shebang

  desc "top for Claude Code: live sessions, context use, and their subagents"
  homepage "https://github.com/gmhoward9289-ops/roost"
  url "https://github.com/gmhoward9289-ops/roost/archive/refs/tags/v0.4.tar.gz"
  sha256 "87f1c68bc6d1b3c383ebec53e8e4a8d9ad197fd54b1a29abe70e2942dd625dda"
  license "MIT"

  depends_on "python@3.13"

  def install
    bin.install "roost.py" => "roost"
    # The shipped shebang is `/usr/bin/env python3`, which would resolve to
    # whatever python happens to be first on PATH -- including a virtualenv the
    # user activated for something else. Pin it to the formula's interpreter.
    rewrite_shebang detected_python_shebang(use_python_from_path: false), bin/"roost"
    man1.install "roost.1"
  end

  test do
    assert_match "roost #{version}", shell_output("#{bin}/roost --version")
    # -1 renders a frame and exits; with no Claude Code sessions present it
    # still has to produce the empty-state line rather than fail.
    assert_match(/roost|session/i, shell_output("#{bin}/roost -1 --no-color"))
  end
end
