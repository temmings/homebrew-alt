require 'formula'

def migemo?
  ARGV.include? "--with-migemo"
end

class Saphire < Formula
  homepage 'http://sourceforge.jp/projects/sash/'
  url 'http://dl.sourceforge.jp/sash/54458/saphire-3.6.5.tgz'
  md5 '0c2c595c6ba616ded997bdbfb68e5e1c'

  depends_on 'readline'
  depends_on 'oniguruma'
  depends_on 'cmigemo' if migemo?

  def options
    [
      ['--with-migemo', "Enable C/migemo support"],
    ]
  end

  def install
    readline = Formula.factory('readline').prefix
    args = [
      "--prefix=#{prefix}",
      "--with-readline-dir=#{readline}",
      "--with-onig-dir=#{HOMEBREW_PREFIX}"
    ]

    if migemo?
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
