/*
* Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
* Copyright (C) Scilab Enterprises - 2012 - Antoine ELIAS
*
* This file must be used under the terms of the CeCILL.
* This source file is licensed as described in the file COPYING, which
* you should have received as part of this distribution.  The terms
* are also available at
* http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
*
*/

/*--------------------------------------------------------------------------*/
#ifndef __DYNLIB_PIMS_SRC_H__
#define __DYNLIB_PIMS_SRC_H__

#ifdef _MSC_VER
#ifdef PIMS_EXPORTS
#define PIMS_SRC_IMPEXP __declspec(dllexport)
#else
#define PIMS_SRC_IMPEXP __declspec(dllimport)
#endif
#else
#define PIMS_SRC_IMPEXP
#endif

#endif /* __DYNLIB_PIMS_SRC_H__ */
/*--------------------------------------------------------------------------*/
