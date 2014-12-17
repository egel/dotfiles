#!/bin/sh
# conkygraphics.sh
# by Crinos512
# Usage:
#  ${execp ~/.conky/conkyparts/conkygraphics.sh}
#
echo "Graphics: \${color1}\${hr 1}\${color}"
echo "  \${color2}\${exec lspci | grep VGA | tail -c+36}\${color}"
echo "  Driver Version: \${color2}NVIDIA \${exec nvidia-settings -q nVidiaDriverVersion -t}\${color}\${alignr}Screen: \${color2}\${exec nvidia-settings -q FrontEndResolution -t}\${color} @ \${color2}\${exec nvidia-settings -q RefreshRate3 -t}\${color}"

exit 0