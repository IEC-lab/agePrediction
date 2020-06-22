#########################################################################
# File Name: create_lmdb.sh
# Created Time: 2016年07月05日 星期二 16时42分43秒
#########################################################################
#!/bin/bash

echo "Create lmdb dataset "
SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
DATA_DIR=/home/lc/DRF/data/megaage_256_256
TOOLS_DIR=/home/lc/caffe-drf/build/tools

# set RESIZE to resize images to 224x224.
RESIZE=true
if $RESIZE; then
	RESIZE_HEIGHT=224
	RESIZE_WIDTH=224
else
	RESIZE_HEIGHT=0
	RESIZE_WIDTH=0
fi

#GLOG_logtostderr=1 $TOOLS_DIR/convert_imageset \
#	--shuffle \
#    --resize_height=$RESIZE_HEIGHT \
#    --resize_width=$RESIZE_WIDTH \
#	$DATA_DIR/ \
#	$SCRIPT_DIR/train.txt \
#	$SCRIPT_DIR/train.lmdb
#
GLOG_logtostderr=1 $TOOLS_DIR/convert_imageset \
	--shuffle \
	$DATA_DIR/ \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
	$SCRIPT_DIR/test.txt \
	$SCRIPT_DIR/test.lmdb
echo "Done."
