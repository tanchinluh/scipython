//
// scipython ( http://forge.scilab.org/index.php/p/pims ) - This file is part of scipython
// Copyright (C) 2017 - Scilab Enterprises
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//
function builder_gw_cpp()
    gwPath = get_absolute_file_path("builder_gateway_cpp.sce");
    origPath = pwd();
    cd(gwPath);
    gw_table = [
        "pyImport", "sci_pyImport";
        "pyAutounwrap", "sci_pyAutounwrap";
        "pyGetMethods", "sci_pyGetMethods";
        "pyGetFields", "sci_pyGetFields";
        "pyDeff", "sci_pyDeff";
        "pyRepr", "sci_pyRepr";
        "pyExists", "sci_pyExists";
        "pyGetField", "sci_pyGetField";
        "pyRemove", "sci_pyRemove";
        "pyUnwrap", "sci_pyUnwrap";
        "pyWrap", "sci_pyWrap";
        "pyAllowModuleReloading", "sci_pyAllowModuleReloading";
        "pyGetInfos", "sci_pyGetInfos";
        "pyGetPath", "sci_pyGetPath";
        "pyAddToPath", "sci_pyAddToPath";
        "pyTuple", "sci_pyTuple";
        "pyDict", "sci_pyDict";
        "pyList", "sci_pyList";
        "pySet", "sci_pySet";
        "pyGetName", "sci_pyGetName";
        "pyEvalStr", "sci_pyEvalStr";
        "pyWrapAsRef", "sci_pyWrapAsRef";
        "pyUnwrapRem", "sci_pyUnwrapRem";
        "pyByCopy", "sci_pyByCopy";
        "pyUseNumpy", "sci_pyUseNumpy";
        "pyUseScilabIndex", "sci_pyUseScilabIndex";
        "pyGetEnvId", "sci_pyGetEnvId";
        "pyKill", "sci_pyKill";
        "pyTrace", "sci_pyTrace";
        "pyAddVar", "sci_pyAddVar";
        "pyGetVar", "sci_pyGetVar";
        "pyShowPrivate", "sci_pyShowPrivate";
        "pyAttachModule", "sci_pyAttachModule";
        "pyGetAttr", "sci_pyGetAttr";
        "pyBuiltin", "sci_pyBuiltin";
        "pyMain", "sci_pyMain";
        "pyInvoke", "sci_pyInvoke";
        "pyNpWrap", "sci_pyNpWrap";
        "pyExecFile", "sci_pyExecFile"];

    CFLAGS = ilib_include_flag(gwPath);
    CFLAGS = CFLAGS + " " + ilib_include_flag(fullpath(gwPath + "../../src/cpp"));

    thirdPartyPath = fullpath(gwPath + "/../../thirdparty");
    os = getos();
    thirdPartyPath = fullfile(thirdPartyPath, os);

    CFLAGS = CFLAGS + " " + ilib_include_flag(fullfile(thirdPartyPath, "include"));

    if os == "Windows" then
        gw_src_cpp = ls("sci_*.cpp");

        CFLAGS = CFLAGS + " " + ilib_include_flag(fullpath(SCI + "/modules/external_objects/includes"));
        CFLAGS = CFLAGS + " " + ilib_include_flag(fullfile(thirdPartyPath, "Lib/site-packages/numpy/core/include"));

        LDFLAGS = """" + fullpath(gwPath + "../../src/cpp/libpims_cpp.lib") + """" ;
        LDFLAGS = LDFLAGS + " " + """" + fullfile(SCI, "bin/external_objects.lib")+ """" ;
        LDFLAGS = LDFLAGS + " " + """" + fullfile(thirdPartyPath, "libs", "python27.lib")+ """" ;
    elseif os == "Linux" then
        gw_src_cpp = ls(gwPath + "/sci_*.cpp");

        CFLAGS = CFLAGS + " " + ilib_include_flag(fullpath(SCI + "../../../include/scilab"));
        CFLAGS = CFLAGS + " " + ilib_include_flag(fullfile(thirdPartyPath, "lib/python2.7/site-packages/numpy/core/include"));

        LDFLAGS = "";
    end
    WITHOUT_AUTO_PUTLHSVAR = %t;
    tbx_build_gateway("gw_pims_c", gw_table, gw_src_cpp, gwPath, "", LDFLAGS, CFLAGS);
    cd(origPath);
endfunction

builder_gw_cpp();
clear builder_gw_cpp;
