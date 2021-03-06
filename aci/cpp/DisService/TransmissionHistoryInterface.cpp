/*
 * TransmissionHistoryInterface.cpp
 *
 * This file is part of the IHMC DisService Library/Component
 * Copyright (c) 2006-2014 IHMC.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 3 (GPLv3) as published by the Free Software Foundation.
 *
 * U.S. Government agencies and organizations may redistribute
 * and/or modify this program under terms equivalent to
 * "Government Purpose Rights" as defined by DFARS 
 * 252.227-7014(a)(12) (February 2014).
 *
 * Alternative licenses that allow for use within commercial products may be
 * available. Contact Niranjan Suri at IHMC (nsuri@ihmc.us) for details.
 */

#include "TransmissionHistoryInterface.h"

#include "DisServiceDefs.h"
#include "SQLTransmissionHistory.h"

#include "Logger.h"

using namespace IHMC_ACI;
using namespace NOMADSUtil;

TransmissionHistoryInterface * TransmissionHistoryInterface::_pInstance = NULL;

TransmissionHistoryInterface::TransmissionHistoryInterface()
{
}

TransmissionHistoryInterface::~TransmissionHistoryInterface()
{
}

TransmissionHistoryInterface * TransmissionHistoryInterface::getTransmissionHistory (const char *pszStorageFile)
{
    if (_pInstance != NULL) {
        return _pInstance;
    }
    SQLTransmissionHistory *pInstance = new SQLTransmissionHistory (pszStorageFile);
    int rc = pInstance->init();
    if (rc < 0) {
        checkAndLogMsg ("TransmissionHistoryInterface::getTransmissionHistory", Logger::L_SevereError,
                        "could not inizialize SQLTransmissionHistory. Error code: %d\n", rc);
        delete pInstance;
    }
    _pInstance = pInstance;
    return _pInstance;
}


