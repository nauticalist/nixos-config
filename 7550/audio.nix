{ config, ... }:

{
  # Enable sound.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    media-session.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };
}