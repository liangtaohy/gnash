// 
//   Copyright (C) 2005, 2006, 2007 Free Software Foundation, Inc.
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <dirent.h>
#include <iostream>
#include <stdarg.h>
#include <cstring>
#include <sys/stat.h>

extern "C"{
#include <unistd.h>
#ifdef HAVE_GETOPT_H
#include <getopt.h>
#endif
#ifndef __GNUC__
extern int optind, getopt(int, char *const *, const char *);
extern char *optarg;
#endif
}

#include "log.h"
#include "rc.h"
#include "amf.h"
#include "sol.h"

using namespace std;
using namespace gnash;

namespace {
gnash::LogFile& dbglogfile = gnash::LogFile::getDefaultInstance();
gnash::RcInitFile& rcfile = gnash::RcInitFile::getDefaultInstance();
}

static void usage (void);
void dump_ctrl(void *ptr);
int
main(int argc, char *argv[])
{
    unsigned int          i;
    int                   c;
    bool                  localdir = false;
    bool                  listdir = false;
    int                   size  = 0;
    string                filespec, realname, tmpname;
    struct dirent         *entry;
    vector<const char *>  dirlist;
    
    // Enable native language support, i.e. internationalization
#ifdef ENABLE_NLS
    setlocale (LC_MESSAGES, "");
    bindtextdomain (PACKAGE, LOCALEDIR);
    textdomain (PACKAGE);
#endif
    /* This initializes the DBG_MSG macros */ 
    while ((c = getopt (argc, argv, "hvfl")) != -1) {
        switch (c) {
          case 'h':
            usage ();
            break;
            
	  case 'v':
              dbglogfile.setVerbosity();
	      log_msg (_("Verbose output turned on"));
	      break;
              
	  case 'f':
	      log_msg (_("forcing local directory access only"));
              localdir = true;
	      break;

	  case 'l':
	      log_msg (_("List .sol files in the default directory"));
              listdir = true;
	      break;

          default:
            usage ();
            break;
        }
    }
    
    
    // If no command line arguments have been supplied, do nothing but
    // print the  usage message.
    if (argc < 2) {
        usage();
        exit(0);
    }

    // get the file name from the command line
    if (optind < argc) {
        filespec = argv[optind];
        log_msg("Will use \"%s\" for sol files location", filespec.c_str());
    }
    
    // List the .sol files in the default directory
    if (listdir) {
        const char *dirname;
        if ((localdir) || (filespec[0] == '/') || (filespec[0] == '.')) {
            if (filespec.size() == 0) {
                dirname = "./";
            } else {
                dirname = filespec.c_str();
            }
        } else {
            dirname = rcfile.getSOLSafeDir().c_str();
        }
        DIR *library_dir = NULL;
        library_dir = opendir (dirname);
        if (library_dir != NULL) {
            // By convention, the first two entries in each directory are
            // for . and .. (``dot'' and ``dot dot''), so we ignore those. The
            // next directory read will get a real file, if any exists.
            entry = readdir(library_dir);
            entry = readdir(library_dir);
        }
        if (library_dir != NULL) {
            for (i=0; entry>0; i++) {
                entry = readdir(library_dir);
                if (entry != NULL) {
                    string::size_type pos;
                    if (strstr(entry->d_name, ".sol")) {
                        cout << "Found SOL: " << entry->d_name << endl;
                    }
                }
            }
        }
        exit(0);
    }
    
    string newspec;
    if ((localdir) || (filespec[0] == '/') || (filespec[0] == '.')) {
        newspec = filespec;
    } else {
        newspec = rcfile.getSOLSafeDir();
        newspec += filespec;
    }
    
    amf::SOL sol;
    
    if (sol.readFile(newspec)) {
        log_msg("SOL file \"%s\" read in", newspec.c_str());
    } else {
        log_error("SOL file \"%s\" does not exist!", newspec.c_str());
    }

    sol.dump();
}

/// \brief  Display the command line arguments
static void
usage (void)
{
    cerr << _("This program dumps the internal data of a .sol file")
         << endl;
    cerr << _("Usage: soldumper [h] filename") << endl;
    cerr << _("-h\tHelp") << endl;
    exit (-1);
}

// Local Variables:
// mode: C++
// indent-tabs-mode: t
// End:
