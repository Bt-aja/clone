#!/bin/bash

# Sync with configs
source a.conf
source build/envsetup.sh

sendMessage() {
MESSAGE=$1

curl -s "https://api.telegram.org/bot${BOT_API_KEY}/sendmessage" --data "text=$MESSAGE&chat_id=$CHAT_ID" 1> /dev/null

echo -e;
}

sendMessage "Starting build"

# Start Build
#lunch $ROM\_$DEVICE-userdebug && mka bacon | tee build.log	# Enable this for standard "mka bacon"
lunch aosp_ginkgo-userdebug && make bacon -j8	# Enable and edit this if ROM has specific "make command" (make corvus, mka aex, etc)
# catch lunch error
if [ $? -eq 0 ]
then

		echo "Build Completed! Uploading to Drive.."
		sendMessage "Build Completed! Uploading to drive.."

                        #since build iz done lets upload
			OUTPUT_FILE=$(grep -o -P '(?<=Package\ Complete).*(?=.zip)' build.log)'.zip'
	#		OUTPUT_FILE=$(grep -o -P '(?<=Zip: ).*(?=.zip)' build.log)'.zip'
			OUTPUT_LOC=$(echo $OUTPUT_FILE | cut -f2 -d":")
			echo $OUTPUT_LOC

			#upload to gdrive
			sendMessage "Uploading to Gdrive..."
			gdrive upload $OUTPUT_LOC | tee upload.log

			#get file id
			sed -e 's/.*Uploaded\(.*\)at.*/\1/' upload.log >> id.txt
			sendMessage "Upload Finished."
			sed -e '1d' id.txt >> final.txt
			FILE_ID=$(cat final.txt)

			#set permission to sharing
			gdrive share $FILE_ID

			#finally output the sharing url
			URL='https://drive.google.com/open?id='$FILE_ID
			SHARE="$(echo -e "${URL}" | tr -d '[:space:]')"
			echo $SHARE >> url.txt

			#MESSAGE=$(cat url.txt)
			echo $SHARE
			sendMessage $SHARE

			BEELD_FINISHED=true
			#clean up
			rm upload.log final.txt id.txt url.txt

else
	sendMessage "Build Failed!"
	echo "Build Failed!"
fi

rm url.log

		# Some Extra Summary to share
		MD5=`md5sum $FILE_OUTPUT | awk '{ print $1 }'`
		SIZE=`ls -sh $FILE_OUTPUT | awk '{ print $1 }'`

#if [ $DEVICE ]; then
read -r -d '' SUMMARY << EOM
ROM: $ZIPNAME
Build: $BUILD_TYPE
LINK: $SHARE
NOTES: $NOTES
MD5: $MD5
EOM

                curl -s "https://api.telegram.org/bot${BOT_API_KEY}/sendmessage" --data "text=$SUMMARY&chat_id=$CHAT_ID" 1> /dev/null

echo -e;

#fi


exit 1
