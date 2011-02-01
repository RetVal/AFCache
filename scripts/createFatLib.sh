#!/bin/sh
XCODE_BUILD_DIR="build"

xcodebuild -target AFCache -sdk iphoneos4.2 "ARCHS=armv6 armv7" clean build
xcodebuild -target AFCache -sdk iphonesimulator4.2 "ARCHS=i386 x86_64" "VALID_ARCHS=i386 x86_64" clean build
lipo -output release/libAFCache.a -create $XCODE_BUILD_DIR/Release-iphoneos/libAFCache.a $XCODE_BUILD_DIR/Release-iphonesimulator/libAFCache.a

./updateAPI.sh
cp CHANGES release/