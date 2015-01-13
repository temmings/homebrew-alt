require 'formula'

class Mfiler3 < Formula
  homepage 'http://sourceforge.jp/projects/mfiler3/'
  url 'http://dl.sourceforge.jp/mfiler3/54457/mfiler3-4.4.9.tgz'
  md5 '3f4942565b260e898d7ea60fb9474f95'

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
