## Android makefile
## Run ./build_util_android in order to build this module with dependecies
## written by Enrico Casini

LOCAL_PATH := $(call my-dir)/../..

include $(CLEAR_VARS)
LOCAL_MODULE := ssl
LOCAL_SRC_FILES := android/obj/local/armeabi/libssl.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../android/externals/openssl/jni/include
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := crypto
LOCAL_SRC_FILES := android/obj/local/armeabi/libcrypto.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../android/externals/openssl/jni/crypto
include $(PREBUILT_SHARED_LIBRARY)

## android/sysinfo/sysinfo.S \

include $(CLEAR_VARS)
LOCAL_SRC_FILES := AVList.cpp \
	Base64.cpp \
	Base64Transcoders.cpp \
	BufferedReader.cpp \
	BufferedWriter.cpp \
	BufferReader.cpp \
	BufferWriter.cpp \
	CommHelper.cpp \
	CommHelper2.cpp \
	comm/Serial.cpp \
	comm/Serial2Net.cpp \
	comm/SerialReader.cpp \
	comm/SerialWriter.cpp \
	CompressedReader.cpp  \
	CompressedWriter.cpp \
	ConditionVariable.cpp \
	ConfigManager.cpp \
	CRC.cpp \
	Cron.cpp \
	DatagramSocket.cpp \
	DataRelayer.cpp \
	Dime.cpp \
	EndianHelper.cpp \
	EventMonitor.cpp \
	EventNotifier.cpp \
	FastMutex.cpp \
	FIFOQueue.cpp \
	File.cpp \
	FileReader.cpp \
	FileUtils.cpp \
	FileWriter.cpp \
	GeoUtils.cpp \
	graph/Graph.cpp \
	graph/MSPAlgorithm.cpp \
	graph/StringHashgraph.cpp \
	graph/StringHashthing.cpp \
	graph/Thing.cpp \
	HTTPClient.cpp \
	HTTPHelper.cpp \
	InetAddr.cpp \
	ISAACRand.cpp \
	LineOrientedReader.cpp \
	Logger.cpp \
	LoggingMutex.cpp \
	ManageableThread.cpp \
	MD5.cpp \
	MulticastUDPDatagramSocket.cpp \
	Mutex.cpp \
	media/BMPImage.cpp \
	net/ManycastForwardingNetworkInterface.cpp \
	net/ManycastNetworkMessageReceiver.cpp \
	net/MessageFactory.cpp \
	net/NetUtils.cpp \
	net/NetworkHeaders.cpp \
	net/NetworkInterface.cpp \
	net/NetworkMessage.cpp \
	net/NetworkMessageReceiver.cpp \
	net/NetworkMessageService.cpp \
	net/NetworkMessageV1.cpp \
	net/NetworkMessageV2.cpp \
	net/Reassembler.cpp \
	net/TSNRangeHandler.cpp \
	net/WakeOnLAN.cpp \
	NLFLib.cpp \
	NullWriter.cpp \
	ObjectDefroster.cpp \
	ObjectFreezer.cpp \
	OSThread.cpp \
	Pipe.cpp \
	ProcessExecutor.cpp \
	ProxyDatagramSocket.cpp \
	PushbackLineOrientedReader.cpp \
	RangeDLList.cpp \
	Reader.cpp \
	RollingBoundedBitmap.cpp \
	security/CryptoUtils.cpp \
	security/SecureReader.cpp \
	security/SecureWriter.cpp \
	SemClass.cpp \
	SettingsFileManager.cpp \
	SimpleCommHelper2.cpp \
	SoapMessage.cpp \
	Socket.cpp \
	SocketReader.cpp \
	SocketWriter.cpp \
	StackAllocator.cpp \
	Statistics.cpp \
	StrClass.cpp \
	StringHashset.cpp \
	StringStringHashtable.cpp \
	StringTokenizer.cpp \
	TClass.cpp \
	TCPSocket.cpp \
	Thread.cpp \
	ThreadPool.cpp \
	TimeBoundedStringHashset.cpp \
	UDPDatagramSocket.cpp \
	URLParser.cpp \
	UUID.cpp \
	UUIDGenerator.cpp \
	Writer.cpp \
	ZipFileReader.cpp

# SOURCES with PROBLEMS: Base64.cpp FileUtils.cpp

LOCAL_MODULE    := util
LOCAL_CPPFLAGS	:= -fexceptions -frtti -DUNIX -DLINUX -DANDROID -DLITTLE_ENDIAN_SYSTEM -DENABLE_MUTEX_LOGGING
LOCAL_CFLAGS := -fsigned-char
LOCAL_LDLIBS := -lz 

#LOCAL_C_INCLUDES += \
#	$(LOCAL_PATH)/../../android/externals/openssl/jni/ \
#	$(LOCAL_PATH)/../../android/externals/openssl/jni/include \
#	$(LOCAL_PATH)/../../android/externals/openssl/jni/crypto

LOCAL_SHARED_LIBRARIES := \
	ssl \
	crypto 

include $(BUILD_SHARED_LIBRARY)
#include $(BUILD_STATIC_LIBRARY)
