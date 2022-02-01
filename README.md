# AudioPad

Very simple CLI analogue of Soundpad, which, unfortunately, not natively available on GNU/Linux. This is just a set of pactl PulseAudio commands initializing needed modules served in a bash script.
# Activation/Installation
_NOTE: .audiopad script use default input for microphone, so if you want to use other input from that configured by default on your system, edit script or fit your defaults to it._

## Activation and deactivation

If you would use it only sometimes, just run the script once and then you can use it with the path to file that you want to play, it will play it with mpv. Alternatively, you can use it with program of your choice by telling it to use AudioPad_sink as a sink. Also, dont forget to change the input in your desired app to the source created by the script(by default called Remapped Monitor of Null Output.

If you want to use it from time to time, just run the script and you're ready to go. To play something, just tell the program you use for playing video or audio files to use AudioPad_sink as a sink. Commonly, i use mpv with PULSE_SINK=AudioPad_sink option typed before the actual command. Also, don't forget to change input in your desired app to the one created by script(by default called Remapped Monitor of Null Output)

Once you finished using it, run the same script with -u option, that will remove all initialized modules by the script.

## Installation
If you want to make it initialize needed modules on startup, just use script with -d option once, this will add needed lines to your PulseAudio's default.pa. Beware: if you will use it again, it would initialize it twice(write those lines again to your /etc/pulse/default.pa). Also, you can look up the script and copy those lines to /etc/pulse/default.pa by yourself. It doesn't make the source created by AudioPad the default one.

### Plans
- Make monitoring of what you are playing possible
- "Integrating" with v4l2loopback (Seems to be buggy, at least in discord)
  
You still can use it, just download it(information about it can be found on it's repo on github: https://github.com/umlaeute/v4l2loopback). Then tell the app you use for playing videos to use AudioPad_sink as a sink and the video device created by v4l2loopback(/dev/videoX) as a video stream device. I personally use ffmpeg with following options: ffmpeg -re -i path/to/your/file -f pulse -device AudioPad_sink "AudioPad" -f v4l2 (your /dev/videoX created by v4l2loopback). You can list all video devices using v4l2-ctl --list-devices, select the device where it says "Dummy video device" for your desired app.

Concerning bugs, you would need to turn camera on in the app after you started playing a video, or it will be just "loading". Also, you wouldn't be able to play another video unless you restart the program/video sharing. This is true for discord, at least. I dont know how it will behave in other programs, you can test it out yourself.

- Implementing checking the initialization of AudioPad on playing files with this script
- Checking for lines in /etc/pulse/default.pa to prevent double initialization on startup
- Better names for both sink and source
