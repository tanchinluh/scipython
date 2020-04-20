//
// scipython ( http://forge.scilab.org/index.php/p/pims ) - This file is part of scipython
// Copyright (C) 2012 - Scilab Enterprises - Calixte DENIZET
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//

mode(-1);
lines(0);

function main_builder()

  TOOLBOX_NAME  = "scipython";
  TOOLBOX_TITLE = "Scilab Python Toolbox";
  toolbox_dir   = get_absolute_file_path("builder.sce");

// Check Scilab's version
// =============================================================================

  try
    v = getversion("scilab");
  catch
    error(gettext("Scilab 5.4 or more is required."));
  end

  if (v(1) < 5) | ((v(1) == 5) & (v(2) < 4)) then
    // new API in scilab 5.4
    error(gettext("Scilab 5.4 or more is required."));
  end

// Check modules_manager module availability
// =============================================================================

if ~isdef("tbx_build_loader") then
  error(msprintf(gettext("%s module not installed."), "modules_manager"));
end

// Action
// =============================================================================

tbx_builder_macros(toolbox_dir);
//tbx_builder_src(toolbox_dir);
//tbx_builder_gateway(toolbox_dir);

if (getscilabmode() == 'STD') | (getscilabmode() == 'NW') then
  tbx_builder_help(toolbox_dir);
end

tbx_build_loader(TOOLBOX_NAME, toolbox_dir);
tbx_build_cleaner(TOOLBOX_NAME, toolbox_dir);

endfunction
// =============================================================================
main_builder();
clear main_builder; // remove main_builder on stack
// =============================================================================
