class Libpafe < Formula
  desc "Library for SONY PaSoRi (MODEL RC-S310, RC-S320, RC-S330)"
  homepage "http://homepage3.nifty.com/slokar/pasori/libpafe.html"
  url "http://homepage3.nifty.com/slokar/pasori/libpafe-#{version}.tar.gz"
  version "0.0.8"
  sha256 "ba479195a14c1685d7d642658418a94de400eec0b923f86477975ac78224d1b5"

  depends_on "pkg-config" => :build
  depends_on "libusb"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
