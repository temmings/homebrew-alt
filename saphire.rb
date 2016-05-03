require 'formula'

def migemo?
  ARGV.include? "--with-migemo"
end

class Saphire < Formula
  homepage 'http://sourceforge.jp/projects/sash/'
  url 'http://dl.sourceforge.jp/sash/54458/saphire-3.6.5.tgz'
  sha256 '5dcd0ea3828a375004be7545a76b319713c6a17dcbc34189fb044ce63279d087'

  depends_on 'readline'
  depends_on 'oniguruma'
  depends_on 'cmigemo' => :optional

  def install
    readline = Formula.factory('readline').prefix
    args = [
      "--prefix=#{prefix}",
      "--with-readline-dir=#{readline}",
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
    system "#{bin}/saphire -c 'puts HelloWorld'"
  end
end
