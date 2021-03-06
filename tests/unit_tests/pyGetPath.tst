// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - Scilab Enterprises - Sylvestre Ledru
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

nbElement=size(pyGetPath(),"*");
assert_checktrue(nbElement > 1);

tmpDir = getlongpathname(TMPDIR);
pyAddToPath(tmpDir);
assert_checkequal(nbElement+1, size(pyGetPath(),"*"));
assert_checktrue(size(find(pyGetPath()==tmpDir),"*") >= 1);
listPath=pyGetPath();
assert_checkequal(listPath($), tmpDir);
