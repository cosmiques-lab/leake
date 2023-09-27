#!/bin/bash

installer(){
	echo "#!/bin/bash" > leake_install.sh
	echo "" >> leake_install.sh

	for r in $(cat dependency.sh)
	do
		first=$(echo $r | cut -c 1-1)
		if [[ !($first = "." || $first = "#") ]];
		then
			file_name=$r

			$(cat $file_name | sed '1d' >> leake_install.sh)
			echo "" >> leake_install.sh
		fi
	done

	cat leake.sh | sed '1,4d' >> leake_install.sh

	$(cp -r leake_install.sh /usr/bin/leake)

	if [[ !($? = 1) ]];
	then
		$(chmod +x /usr/bin/leake)
	else
		msg_error_cannot_install
		exit
	fi

	$(cp -r ../src/ /opt/leake/)
	$(rm -r ../../leake/)

	$(cd /home)
}

uninstall(){
	if [[ -f "/usr/bin/leake" ]];
	then
		$(rm -r /usr/bin/leake)

		if [[ $? = 1 ]];
		then
			msg_error_cannot_remove
			exit
		fi
	fi

	if [[ -d /opt/leake ]];
	then
		$(rm -r /opt/leake/)

		if [[ $? = 1 ]];
		then
			msg_error_uninstall_generic
			exit
		fi
	fi
}
