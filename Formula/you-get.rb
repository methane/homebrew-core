class YouGet < Formula
  include Language::Python::Virtualenv

  desc "Dumb downloader that scrapes the web"
  homepage "https://you-get.org/"
  url "https://github.com/soimort/you-get/releases/download/v0.4.1060/you-get-0.4.1060.tar.gz"
  sha256 "a1cc8754ec877a2a200ab76ca37c5c506d762d535945fdbfdf3263388dcd8db0"
  head "https://github.com/soimort/you-get.git", :branch => "develop"

  bottle do
    cellar :any_skip_relocation
    sha256 "5d5dc094704864855e3e46646a59f97de9c74b3714ffd840499e702ef1dff840" => :high_sierra
    sha256 "a281f41dd3a2c63c90c70ec5416dc0fa7fd5f73b064501abd45692601bbe6152" => :sierra
    sha256 "c938ac9f5907548b4d953180066a30ad468b51fbfe10cc2e54b4cdd244d439aa" => :el_capitan
  end

  depends_on "python"

  depends_on "rtmpdump" => :optional

  def install
    virtualenv_install_with_resources
  end

  def caveats
    "To use post-processing options, `brew install ffmpeg` or `brew install libav`."
  end

  test do
    system bin/"you-get", "--info", "https://youtu.be/he2a4xK8ctk"
  end
end
