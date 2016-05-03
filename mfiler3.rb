require 'formula'

class Mfiler3 < Formula
  homepage 'http://sourceforge.jp/projects/mfiler3/'
  url 'http://dl.sourceforge.jp/mfiler3/54457/mfiler3-4.4.9.tgz'
  sha256 'f12a31f8fc1e7a35e100ad818087158194d5740b2e03787bf8bea646a758c1f2'

  depends_on 'oniguruma'
  depends_on 'saphire'
  depends_on 'pidof'
  depends_on 'cmigemo' => :optional

  def install
    args = [
      "--prefix=#{prefix}",
      "--with-saphire-dir=#{HOMEBREW_PREFIX}",
      "--with-onig-dir=#{HOMEBREW_PREFIX}"
    ]

    if build.with? "cmigemo"
      args << "--with-migemo"
      args << "--with-migemo-dir=#{HOMEBREW_PREFIX}"
    end

    system "./configure", *args
    system "make"
    system "make install"
  end

  def test
    system "#{bin}/mfiler3 --version"
  end
end
