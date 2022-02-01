# Version with combined microphone
# Variables defining amount of modules to be loaded and from what module to start loading
im=3
is=1
# Commands for initializing modules
lmodule1="pactl load-module module-null-sink sink_name=AudioPad_sink"
lmodule2="pactl load-module module-loopback sink=AudioPad_sink"
lmodule3="pactl load-module module-remap-source source_name=AudioPad_sink master=AudioPad_sink.monitor"

if [ "$1" == "-u" ]; then
# Unload modules
pactl unload-module module-remap-source
pactl unload-module module-loopback
pactl unload-module module-null-sink
echo "Successfully uninitialized AudioPad"

elif [ "$1" == "" ]; then
# Load modules
while [ $is -le $im ];
do
eval \$lmodule$is
let is++
done
echo "Successfully initialized AudioPad"

elif [ "$1" == "-d" ]; then
# Make modules initialized by PulseAudio configuration file. Em stands for Echo (a) Module and used for formatting.
sudo -s << EOF
echo " " >> /etc/pulse/default.pa
echo "### Initialize AudioPad by default" >> /etc/pulse/default.pa
EOF
while [ $is -le $im ]
do
em="lmodule${is}"
let is++
sudo -s << EOF
echo "${!em#* }" >> /etc/pulse/default.pa
EOF
done
echo "Made AudioPad initialize by default!"

else
#Play selected song with mpv
PULSE_SINK=AudioPad_sink mpv ${1}
fi

