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
#include "Python.h"

extern "C" {
#include "Scierror.h"
#include "gw_pims.h"
}

#include <stdio.h>

using namespace org_modules_external_objects_python;
using namespace org_modules_external_objects;

int sci_pyExecFile(GATEWAY_PARAMETERS)
{
    SciErr sciErr;
    int* piAddr = NULL;

    sciErr = getVarAddressFromPosition(pvApiCtx, 1, &piAddr);
    if (sciErr.iErr)
    {
        printError(&sciErr, 0);
        return 0;
    }

    if (isStringType(pvApiCtx, piAddr))
    {
        if (isScalar(pvApiCtx, piAddr))
        {
            int iRet = 0;
            char *pstFileName;

            iRet = getAllocatedSingleString(pvApiCtx, piAddr, &pstFileName);
            if (iRet)
            {
                freeAllocatedSingleString(pstFileName);
                return iRet;
            }

            try
            {
                const int envId = ScilabPythonEnvironment::start();
                if (envId != -1)
                {

                    PyObject* pyFileObject = PyFile_FromString(pstFileName, "r");
                    PyRun_SimpleFile(PyFile_AsFile(pyFileObject), pstFileName);
                    Py_DECREF(pyFileObject);
                }

                freeAllocatedSingleString(pstFileName);
            }
            catch (std::exception & e)
            {
                Scierror(999, _("%s: An error occured: %s"), fname, e.what());
                return 0;
            }
        }
        else
        {
            Scierror(999, _("%s: Wrong size for input argument #%d: A single string expected.\n"), fname, 1);
        }
    }
    else
    {
        Scierror(999, _("%s: Wrong type for input argument #%d: A single string expected.\n"), fname, 1);
    }
}
