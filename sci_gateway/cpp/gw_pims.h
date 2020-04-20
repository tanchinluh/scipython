/*
 * Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2012 - Scilab Enterprises - Calixte DENIZET
 *
 * This file must be used under the terms of the CeCILL.
 * This source file is licensed as described in the file COPYING, which
 * you should have received as part of this distribution.  The terms
 * are also available at
 * http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 *
 */

/*--------------------------------------------------------------------------*/
#ifndef __GW_PIMS_H__
#define __GW_PIMS_H__
/*--------------------------------------------------------------------------*/

#include "version.h"

#if SCI_VERSION_MAJOR >= 6
#define GATEWAY_PARAMETERS char* fname, void *pvApiCtx
#else
#define GATEWAY_PARAMETERS char* fname, unsigned long fname_len
#endif

int sci_pyImport(GATEWAY_PARAMETERS);
int sci_pyAutounwrap(GATEWAY_PARAMETERS);
int sci_pyGetMethods(GATEWAY_PARAMETERS);
int sci_pyGetFields(GATEWAY_PARAMETERS);
int sci_pyDeff(GATEWAY_PARAMETERS);
int sci_pyRepr(GATEWAY_PARAMETERS);
int sci_pyExists(GATEWAY_PARAMETERS);
int sci_pyGetField(GATEWAY_PARAMETERS);
int sci_pyRemove(GATEWAY_PARAMETERS);
int sci_pyUnwrap(GATEWAY_PARAMETERS);
int sci_pyWrap(GATEWAY_PARAMETERS);
int sci_pyAllowModuleReloading(GATEWAY_PARAMETERS);
int sci_pyGetInfos(GATEWAY_PARAMETERS);
int sci_pyGetPath(GATEWAY_PARAMETERS);
int sci_pyAddToPath(GATEWAY_PARAMETERS);
int sci_pyTuple(GATEWAY_PARAMETERS);
int sci_pyDict(GATEWAY_PARAMETERS);
int sci_pyList(GATEWAY_PARAMETERS);
int sci_pySet(GATEWAY_PARAMETERS);
int sci_pyGetName(GATEWAY_PARAMETERS);
int sci_pyEvalStr(GATEWAY_PARAMETERS);
int sci_pyWrapAsRef(GATEWAY_PARAMETERS);
int sci_pyUnwrapRem(GATEWAY_PARAMETERS);
int sci_pyByCopy(GATEWAY_PARAMETERS);
int sci_pyUseNumpy(GATEWAY_PARAMETERS);
int sci_pyUseScilabIndex(GATEWAY_PARAMETERS);
int sci_pyGetEnvId(GATEWAY_PARAMETERS);
int sci_pyKill(GATEWAY_PARAMETERS);
int sci_pyTrace(GATEWAY_PARAMETERS);
int sci_pyAddVar(GATEWAY_PARAMETERS);
int sci_pyGetVar(GATEWAY_PARAMETERS);
int sci_pyShowPrivate(GATEWAY_PARAMETERS);
int sci_pyAttachModule(GATEWAY_PARAMETERS);
int sci_pyGetAttr(GATEWAY_PARAMETERS);
int sci_pyBuiltin(GATEWAY_PARAMETERS);
int sci_pyMain(GATEWAY_PARAMETERS);
int sci_pyInvoke(GATEWAY_PARAMETERS);
int sci_pyNpWrap(GATEWAY_PARAMETERS);
int sci_pyExecFile(GATEWAY_PARAMETERS);
/*--------------------------------------------------------------------------*/
#endif /* __GW_PIMS_H__ */
