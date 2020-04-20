/*
 * scipython ( http://forge.scilab.org/index.php/p/pims ) - This file is part of scipython
 * Copyright (C) 2012 - Scilab Enterprises - Calixte DENIZET
 *
 * This file must be used under the terms of the CeCILL.
 * This source file is licensed as described in the file COPYING, which
 * you should have received as part of this distribution.  The terms
 * are also available at
 * http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 *
 */

#include "ScilabPythonEnvironment.hxx"
#include "ScilabGateway.hxx"

extern "C" {
#include "Scierror.h"
#include "gw_pims.h"
}

using namespace org_modules_external_objects_python;
using namespace org_modules_external_objects;

int sci_pyMap(GATEWAY_PARAMETERS)
{
    try
    {
        const int envId = ScilabPythonEnvironment::start();
        ScilabPythonBuiltinInvoker invoker = ScilabPythonEnvironment::getInstance().getBuiltinInvoker("map");
        return ScilabGateway::invoke(fname, envId, invoker, pvApiCtx);
    }
    catch (std::exception & e)
    {
        Scierror(999, "%s: An error occured: %s", fname, e.what());
        return 0;
    }
}
