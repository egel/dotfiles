#!/bin/bash

declare -a _index
declare -a _mount_point

for x in $(hal-find-by-property --key storage.bus --string usb)
do
	if (hal-device "$x" |grep "storage\.drive_type = 'disk'" > /dev/null);
	then
		_bminor=$(hal-device "$x" |grep "block\.minor" |sed -e "s/'//g" |cut -d\  -f5)
		_index[$_bminor]=$_bminor
		_vendor[$_bminor]=$(hal-device "$x" |grep "info\.vendor" |sed -e "s/'//g" |cut -d\  -f5)
		_product[$_bminor]=$(hal-device "$x" |grep "info\.product" |sed -e "s/'//g" |cut -d\  -f5)
		_info_udi=$(hal-device "$x" |grep "info\.udi" |sed -e "s/'//g" |cut -d\  -f5)
		_udi=$(hal-find-by-property --key info.parent --string $(echo "$_info_udi"))
		_device=$(hal-device "$_udi" |grep "block\.device" |sed -e "s/'//g" |cut -d\  -f5)
		y=$(df -h |grep $(echo "$_device"))
		if [ "$y" ]
		then
			set $y
			_device[$_bminor]="$1"
			_mount_point[$_bminor]="$6"
			_space_used[$_bminor]="$3"
			_space_free[$_bminor]="$4"
			_percent_used[$_bminor]="$5"
			_space_available[$_bminor]="$2"
		fi
	fi
done

if [ ${#_mount_point[@]} -gt 0 ];
then
	for x in "${_index[@]}"
	do
		if [ "${_mount_point[$x]}" ]
		then
		echo
		echo -e "\${font :size=7}${_vendor[$x]} ${_product[$x]} :"
		echo -e "\${tab 16}device\${tab 64}= ${_device[$x]}"
		echo -e "\${tab 16}mount point\${tab 64}= ${_mount_point[$x]/\/media}"
		echo -e "\${tab 16}space used\${tab 64}= ${_space_used[$x]}"
		echo -e "\${tab 16}space free\${tab 64}= ${_space_free[$x]}"
		echo -e "\${tab 16}percent used\${tab 64}= ${_percent_used[$x]}"
		echo -e "\${tab 16}space available\${tab 64}= ${_space_available[$x]}\$font"
		fi
	done
fi
exit 0
