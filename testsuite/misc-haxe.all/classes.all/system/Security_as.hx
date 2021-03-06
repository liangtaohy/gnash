// Security_as3.hx:  ActionScript 3 "Security" class, for Gnash.
//
// Generated by gen-as3.sh on: 20090514 by "rob". Remove this
// after any hand editing loosing changes.
//
//   Copyright (C) 2009, 2010 Free Software Foundation, Inc.
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
//

// This test case must be processed by CPP before compiling to include the
//  DejaGnu.hx header file for the testing framework support.

#if flash9
import flash.display.MovieClip;
#else
import flash.MovieClip;
#end

import flash.Lib;
import Type;

//Si: Modified
import Std;
import flash.system.Security;

// import our testing API
import DejaGnu;

// Class must be named with the _as3 suffix, as that's the same name as the file.
class Security_as {

	static var undef = untyped __global__["undefined"];

    static function main() {

        // Make sure we actually get a valid class        
        if (Type.typeof(Security)==TObject) {
            DejaGnu.pass("Security class exists");
        } else {
            DejaGnu.fail("Security class doesn't exist");
        }
// Tests to see if all the properties exist. All these do is test for
// existance of a property, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.

// Test exactSettings
// For all versions

#if flash9
	if (Type.typeof(Security.exactSettings) == TBool) {
	    DejaGnu.pass("Security.exactSettings property exists");
	} else {
	    DejaGnu.fail("Security.exactSettings property doesn't exist");
	}
#end

#if flash8
	// For pp, Security.sandboxType returns a string, hence the xfail 
	// when run in the pp
	if (Type.typeof(Security.sandboxType) == ValueType.TNull) {
	    DejaGnu.pass("Security.sandboxType property exists");
	} else {
	    DejaGnu.xfail("Security.sandboxType property doesn't exist");
	}
#end

#if flash9
	if (Std.is(Security.sandboxType, String) ) {
	    DejaGnu.pass("Security.sandboxType property exists");
	} else {
	    DejaGnu.fail("Security.sandboxType property doesn't exist");
	}
#end

// Tests to see if all the methods exist. All these do is test for
// existance of a method, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	

	if (Type.typeof(Security.allowDomain) == TFunction) {
	    DejaGnu.pass("Security::allowDomain() method exists");
	} else {
	    DejaGnu.fail("Security::allowDomain() method doesn't exist");
	}
    var ret = Security.allowDomain("cnn.com");

#if !flash6
	if (Type.typeof(Security.allowInsecureDomain) == TFunction) {
	    DejaGnu.pass("Security::allowInsecureDomain() method exists");
	} else {
	    DejaGnu.fail("Security::allowInsecureDomain() method doesn't exist");
	}
#end
	if (Type.typeof(Security.loadPolicyFile) == TFunction) {
	    DejaGnu.pass("Security::loadPolicyFile() method exists");
	} else {
	    DejaGnu.fail("Security::loadPolicyFile() method doesn't exist");
	}

#if flash9
	if (Type.typeof(Security.showSettings)==TFunction) {
	    DejaGnu.pass("Security::showSettings() method exists");
	} else {
	    DejaGnu.fail("Security::showSettings() method doesn't exist");
	}
#end

// AIR only
// 	if (Security.APPLICATION == null) {
// 	    DejaGnu.pass("Security::APPLICATION() method exists");
// 	} else {
// 	    DejaGnu.fail("Security::APPLICATION() method doesn't exist");
// 	}

#if flash9
	if (Std.is(Security.LOCAL_TRUSTED,String) ) {
	    DejaGnu.pass("Security::LOCAL_TRUSTED() property exists");
	} else {
	    DejaGnu.fail("Security::LOCAL_TRUSTED() property doesn't exist");
	}
	if (Std.is(Security.LOCAL_WITH_FILE,String) ) {
	    DejaGnu.pass("Security::LOCAL_WITH_FILE() property exists");
	} else {
	    DejaGnu.fail("Security::LOCAL_WITH_FILE() method doesn't exist");
	}
	if (Std.is(Security.LOCAL_WITH_NETWORK,String) ) {
	    DejaGnu.pass("Security::LOCAL_WITH_NETWORK() property exists");
	} else {
	    DejaGnu.fail("Security::LOCAL_WITH_NETWORK() property doesn't exist");
	}
	if (Std.is(Security.REMOTE,String)) {
	    DejaGnu.pass("Security::REMOTE() property exists");
	} else {
	    DejaGnu.fail("Security::REMOTE() property doesn't exist");
	}
	if (Type.typeof(Security.disableAVM1Loading) == TBool ){
	    DejaGnu.pass("Security::disableAVM1Loading property xists");
	} else {
	    DejaGnu.fail("Security::disableAVM1Loading property doesn't exist");
	}
#end
        // Call this after finishing all tests. It prints out the totals.
        DejaGnu.done();
    }
}

// local Variables:
// mode: C++
// indent-tabs-mode: t
// End:

