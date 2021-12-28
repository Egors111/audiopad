# AudioPad

Very simple CLI analogue of Soundpad, which, unfortunately, not natively available on GNU/Linux. This is just a set of pactl PulseAudio commands initializing needed modules.

# Activation/Installation
_NOTE: .audiopad script use default input for microphone, so if you want to use other input from that configured by default on your system, edit script or fit your defaults to it._

##Activation and deactivation
If you want to use it from time to time, just run the script and you're ready to go. If you want to play something, just tell the app/command you use to use AudioPad_sink as a sink. Commonly, i use mpv with PULSE_SINK=AudioPad_sink option typed __before the actual command__. Also, dont forget to change input in your desired app to the one created by script(by default called Remapped Monitor of Null Output)

Once you finished using it, run the same script with -u option, that will remove all initialized modules by the script.

##Installation
If you want to constantly use AudioPad(as it also conveniently combining microphone with it), just copy the lines that load all the modules to your /etc/pulse/default.pa somewhere. You can also set it as default input.

### Currently not implemented features
- Monitoring of what you are playing(Working, but you also would hear yourself)
- "Integrating" with v4l2loopback (Seems to be buggy, at least in discord)
- Some kind of "chooser", maybe?
