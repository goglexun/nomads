/*
 * Server.java
 *
 * This file is part of the IHMC Util Library
 * Copyright (c) 1993-2014 IHMC.
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

package us.ihmc.ds.fgraph.test;

import us.ihmc.ds.fgraph.FGraph;

/**
 * Server
 * 
 * @author Marco Carvalho (mcarvalho@ihmc.us)
 * @version $Revision: 1.2 $ Created on Jul 13, 2004 at 11:34:52 PM $Date: 2014/11/06 22:00:40 $ Copyright (c) 2004, The
 *          Institute for Human and Machine Cognition (www.ihmc.us)
 */
public class Server
{
    public static void main(String[] args)
    {
        try {
            FGraph fgraph = FGraph.getServer(7495);

        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
