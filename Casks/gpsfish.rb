cask :v1 => 'gpsfish' do
  version '20130831.1.0'
  sha256 '71439cd4767a69a4ea18c81204f4acee4ff7613d3f452661472b0dbc6f86c23e'

  url "http://gps.tanaka.ecc.u-tokyo.ac.jp/gpsshogi/download/gpsfish-#{version}.dmg"
  name 'GPSFish'
  homepage 'http://gps.tanaka.ecc.u-tokyo.ac.jp/gpsshogi/index.php?GPSShogiEn'
  license :gpl

  binary 'gpsfish.app/Contents/MacOS/gpsfish'

  # gpsfish is referenced absolute path: /Applications
  artifact "gpsfish.app/data", :target => "/Applications/gpsfish.app/data"

  uninstall :delete => [
                        '/Applications/gpsfish.app',
                       ]
end
