# Android makefile
## Run 'make' in order to build this module with dependecies
## written by Enrico Casini

LOCAL_PATH := $(call my-dir)/../..

# List of dependencies

include $(CLEAR_VARS)
LOCAL_MODULE := util
LOCAL_SRC_FILES := android/obj/local/armeabi/libutil.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../../util/cpp
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := sqlite3droid
LOCAL_SRC_FILES := android/obj/local/armeabi/libsqlite3droid.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../../externals/SQLite
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libjpegdroid
LOCAL_SRC_FILES := android/obj/local/armeabi/libjpegdroid.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../../externals/libjpeg
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := tinyxpath
LOCAL_SRC_FILES := android/obj/local/armeabi/libtinyxpath.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../../externals/TinyXPath
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := msgpack 
LOCAL_SRC_FILES := android/obj/local/armeabi/libmsgpack.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../../externals/msgpack
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := lcppdc
LOCAL_SRC_FILES := android/obj/local/armeabi/liblcppdc.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../../misc/cpp/lcppdc
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := chunking
LOCAL_SRC_FILES := android/obj/local/armeabi/libchunking.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../../misc/cpp/chunking
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := AckController.cpp \
    BandwidthSensitiveController.cpp \
    BandwidthSharing.cpp \
    BasicWorldState.cpp \
    ChunkingAdaptor.cpp \
    ChunkRetrievalController.cpp \
    ConfigFileReader.cpp \
    ConnectivityHistory.cpp \
    Controllable.cpp \
    ControllerFactory.cpp \
    DataCache.cpp \
    DataCacheExpirationController.cpp \
    DataCacheInterface.cpp \
    DataCacheReplicationController.cpp \
    DataRequestHandler.cpp \
    DefaultDataCacheExpirationController.cpp \
    DefaultDataCacheReplicationController.cpp \
    DefaultForwardingController.cpp \
    DefaultSearchController.cpp \
    DisseminationService.cpp \
    DisseminationServiceProxyAdaptor.cpp \
    DisseminationServiceProxyCallbackHandler.cpp \
    DisseminationServiceProxy.cpp \
    DisseminationServiceProxyServer.cpp \
    DisServiceDataCacheQuery.cpp \
    DisServiceMsg.cpp \
    DisServiceMsgHelper.cpp \
    DisServiceScheduler.cpp \
    DisServiceStats.cpp \
    DisServiceStatusMonitor.cpp \
    DisServiceStatusNotifier.cpp \
    DSSFLib.cpp \
    ForwardingController.cpp \
    History.cpp \
    HistoryFactory.cpp \
    Listener.cpp \
    ListenerNotifier.cpp \
    Message.cpp \
    MessageId.cpp \
    MessageInfo.cpp \
    MessageReassembler.cpp \
    MessageRequestScheduler.cpp \
    NetworkTrafficMemory.cpp \
    NodeId.cpp \
    NodeInfo.cpp \
    PeerState.cpp \
    PersistentDataCache.cpp \
    PropertyStoreInterface.cpp \
    PullReplicationController.cpp \
    PushReplicationController.cpp \
    PushToConvoyDataCacheReplicationController.cpp \
    RateEstimator.cpp \
    ReceivedMessages.cpp \
    ReceivedMessagesInterface.cpp \
    RequestsState.cpp \
    Services.cpp \
    SQLMessageHeaderStorage.cpp \
    SQLMessageStorage.cpp \
    SQLPropertyStore.cpp \
    SQLTransmissionHistory.cpp \
    SearchController.cpp \
    Searches.cpp \
    StorageInterface.cpp \
    Subscription.cpp \
    SubscriptionAdvTable.cpp \
    SubscriptionFactory.cpp \
    SubscriptionForwardingController.cpp \
    SubscriptionList.cpp \
    SubscriptionState.cpp \
    TargetBasedReplicationController.cpp \
    TransmissionHistoryInterface.cpp \
    TransmissionService.cpp \
    TransmissionServiceListener.cpp \
    TopologyWorldState.cpp \
    TopologyForwardingController.cpp \
    Utils.cpp \
    WorldState.cpp \
    WorldStateForwardingController.cpp \
    XLayerWrapper.cpp

# OLD: MessagePropagationServiceInterface.cpp MessagePropagationServiceListener.cpp
# DisService Proxy sources: DisseminationServiceProxy.cpp DisseminationServiceProxyAdaptor.cpp    
# DisseminationServiceProxyCallbackHandler.cpp DisseminationServiceProxyServer.cpp

LOCAL_MODULE    := disservice
LOCAL_CPPFLAGS	:= -fexceptions -DUNIX -DLINUX -DANDROID -DLITTLE_ENDIAN_SYSTEM -DUSE_SQLITE -DENABLE_MUTEX_LOGGING
LOCAL_LDLIBS := -lz -ldl

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/../../../util/cpp \
    $(LOCAL_PATH)/../../../util/cpp/net \
    $(LOCAL_PATH)/../../../util/cpp/graph \
    $(LOCAL_PATH)/../../../externals/SQLite \
    $(LOCAL_PATH)/../../../externals/libjpeg \
    $(LOCAL_PATH)/../../../externals/TinyXPath \
    $(LOCAL_PATH)/../../../externals/msgpack/include \
    $(LOCAL_PATH)/../../../misc/cpp/lcppdc \
    $(LOCAL_PATH)/../../../misc/cpp/chunking
    
#	$(LOCAL_PATH)/../../android/externals/openssl/jni/include \
#	$(LOCAL_PATH)/../../android/externals/openssl/jni/crypto

LOCAL_SHARED_LIBRARIES := \
    sqlite3droid \
    libjpegdroid \
    chunking \
    tinyxpath \
    msgpack \
    lcppdc \
    util

include $(BUILD_SHARED_LIBRARY)
#include $(BUILD_STATIC_LIBRARY)
