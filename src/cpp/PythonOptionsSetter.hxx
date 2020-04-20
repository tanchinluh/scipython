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

/*--------------------------------------------------------------------------*/

#ifndef __PYTHONOPTIONSSETTER_HXX__
#define __PYTHONOPTIONSSETTER_HXX__

#include "ScilabOptionsSetter.hxx"
#include "dynlib_pims_src.h"

using namespace org_modules_external_objects;

namespace org_modules_external_objects_python
{

class PythonOptionsHelper;

class PIMS_SRC_IMPEXP PythonOptionsSetter : public ScilabOptionsSetter
{

public:

    static const unsigned int USENUMPY;
    static const unsigned int SHOWPRIVATE;
    static const unsigned int ATTACHMODULE;

    PythonOptionsSetter(PythonOptionsHelper & _helper, unsigned int _type);
    ~PythonOptionsSetter() { }

    void set(const bool state);

    bool get() const;
};
}

#endif // __PYTHONOPTIONSSETTER_HXX__
