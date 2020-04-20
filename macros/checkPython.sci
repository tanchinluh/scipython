//
// scipython ( http://forge.scilab.org/index.php/p/pims ) - This file is part of scipython
// Copyright (C) 2013 - Scilab Enterprises - Simon MARCHETTO
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//

function [pythonExternInstall, pythonBinPath, pythonLibPath] = checkPython()
    pythonExternInstall = %f;
    pythonPath = [];
    pythonLibPath = [];

    // get Python version
    // use a trick as unix_g("python -V") does not return anything (bug)
    [pythonVersion, err, errMsg] = unix_g("python -c ""exec(\""import platform\nprint(platform.python_version())\"")""");

    os = getos();
    if ~err & ~isempty(pythonVersion) & ~isempty(strstr(pythonVersion, "2.7")) then
        if os == "Windows" then
            [pythonBinPath, err, errMsg] = unix_g("where python");
        else
            [pythonBinPath, err, errMsg] = unix_g("which python");
        end
        if size(pythonBinPath, 'r') > 1 then
            pythonBinPath = pythonBinPath(1);
        end

        if ~err then
            [numpyPath, err, errMsg] = unix_g("python -c ""exec(\""import numpy\nprint(numpy.get_include())\"")""");
            pythonExternInstall = ~err;
        end
    end

    if pythonExternInstall then
        if os == "Linux" then
            [pythonLibDir, err, errMsg] = unix_g("python -c ""exec(\""from distutils import sysconfig;\nprint(sysconfig.get_config_var(''LIBDIR''))\"")""");
            pythonExternInstall = ~err;
        else
            pythonLibDir = dirname(pythonBinPath);
        end
    end

    if ~pythonExternInstall then
        thirdPartyPath = fullfile(getSciPythonPath(), "thirdparty", os);
        if os == "Windows" then
            pythonBinPath = fullfile(thirdPartyPath, "python.exe");
            pythonLibDir = thirdPartyPath;
        else
            pythonBinPath = fullfile(thirdPartyPath, "bin", "python2.7");
            pythonLibDir = fullfile(thirdPartyPath, "lib");
        end
    end

    if os == "Windows" then
        pythonLibPath = fullfile(pythonLibDir, "python27.dll");
    else
        pythonLibPath = fullfile(pythonLibDir, "libpython2.7.so");
    end
endfunction
