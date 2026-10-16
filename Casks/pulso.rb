cask "pulso" do
  version "0.1.0"
  sha256 "c304be87ad38a15f833edf09c7ce13c8319003decc49ae267773074c7a1a7ba6"

  url "https://github.com/jorgenchu/pulso/releases/download/v#{version}/Pulso-#{version}.dmg"
  name "Pulso"
  desc "Monitor del sistema para la barra de menús"
  homepage "https://github.com/jorgenchu/pulso"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Pulso.app"

  uninstall quit: "com.jorgenchu.pulso"

  zap trash: "~/Library/Preferences/com.jorgenchu.pulso.plist"

  caveats <<~EOS
    Pulso aún no está notarizado por Apple. La primera vez que lo abras, macOS no te
    dejará: ve a Ajustes del Sistema › Privacidad y seguridad y pulsa «Abrir igualmente».
  EOS
end
