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
function build_cpp()
    origPath = pwd();
    cppPath = get_absolute_file_path("builder_cpp.sce");
    cd(cppPath);

    CFLAGS = ilib_include_flag(cppPath);

    thirdPartyPath = fullpath(cppPath + "/../../thirdparty");
    os = getos();
    thirdPartyPath = fullfile(thirdPartyPath, os);

    CFLAGS = CFLAGS + " " + ilib_include_flag(fullfile(thirdPartyPath, "include"));
pause
    if os == "Windows" then
        src_cpp = ls("*.cpp");

        CFLAGS = CFLAGS + " " + ilib_include_flag(fullpath(SCI + "/modules/external_objects/includes"));
        CFLAGS = CFLAGS + " " + ilib_include_flag(fullfile(thirdPartyPath, "Lib/site-packages/numpy/core/include"));
        CFLAGS = CFLAGS + " -DPIMS_EXPORTS";

        LDFLAGS = fullfile(SCI, "bin/external_objects.lib");
        LDFLAGS = LDFLAGS + " " + fullfile(thirdPartyPath, "libs", "python27.lib");
    elseif os == "Linux" then
        src_cpp = ls(cppPath + "/*.cpp");

        CFLAGS = CFLAGS + " " + ilib_include_flag(fullpath(SCI + "../../../include/scilab"));
        CFLAGS = CFLAGS + " " + ilib_include_flag(fullfile(thirdPartyPath, "lib/python2.7/site-packages/numpy/core/include"));
        LDFLAGS = "-L" + fullfile(thirdPartyPath, "lib") + " -lpython2.7"
    end

    tbx_build_src("pims_cpp", src_cpp, "cpp", cppPath, "", LDFLAGS, CFLAGS);
    cd(origPath);
endfunction

build_cpp();
clear build_cpp;
