// Mike Carlson's test program for actionscript arrays
// (initialization, 
// Jan. 17th, 2006

// Updated with sort functions, and to use check() macro
// by Mike Carlson Feb. 14th, 2006

rcsid="$Id: array.as,v 1.14 2007/02/28 23:58:26 strk Exp $";

#include "check.as"

var a;
var popped;
a=[551,"asdf",12];

check (a instanceOf Array);

b=[];
b.push(551,"asdf",12);

check ( a != undefined );
check_equals ( typeof(a), "object" );
// reference at sephiroth.it/reference.php says (under "==")
// that two arrays are always considered NOT equal - need to verify
check ( a != b ); 

check_equals ( a.length, 3 );
check_equals ( a[2], 12 );
popped=a.pop();
check_equals ( popped , 12 );
check_equals ( a[2] , undefined );
check_equals ( a[1] , "asdf" );
a[1] = a[0];
check_equals ( a[1] , 551 );
a[0] = 200;
check_equals ( a[0] , 200 );
check_equals ( a.toString() , "200,551");
a.push(7,8,9);
check_equals ( a.length, 5);
check_equals ( a[100] , undefined );
check_equals ( a[5] , undefined );
check_equals ( a[4] , 9 );
check_equals ( a.join() , "200,551,7,8,9" );
a.reverse();
check_equals ( a.join() , "9,8,7,551,200" );
#if OUTPUT_VERSION > 5
check_equals ( Array.prototype.join.apply(a), "9,8,7,551,200" );
check_equals ( a.join.apply(a), "9,8,7,551,200" );
#else
// It seems that up to SWF5 we couldn't do this ...
check_equals ( Array.prototype.join.apply(a), undefined );
check_equals ( a.join.apply(a), undefined );
#endif
check_equals ( a.join("test") , "9test8test7test551test200" );

// Test one of our sorting type members
check_equals ( Array.CASEINSENSITIVE , 1 );
check_equals ( Array.DESCENDING , 2 );
check_equals ( Array.UNIQUESORT , 4 );
check_equals ( Array.RETURNINDEXEDARRAY , 8 );
check_equals ( Array.NUMERIC , 16 );

// Check sort functions
a.sort();
check_equals ( a.toString(), "200,551,7,8,9" );

// test flags
check_equals ( Array.CASEINSENSITIVE, 1 );
check_equals ( Array.DESCENDING, 2 );
check_equals ( Array.UNIQUESORT, 4 );
check_equals ( Array.RETURNINDEXEDARRAY, 8 );
check_equals ( Array.NUMERIC, 16 );

a.push(200,7,200,7,200,8,8,551,7,7);
a.sort( Array.NUMERIC );
check_equals ( a.toString() , "7,7,7,7,7,8,8,8,9,200,200,200,200,551,551" );

a.sort( Array.UNIQUESORT | Array.DESCENDING | Array.NUMERIC);
xcheck_equals (a.toString() , "7,7,7,7,7,8,8,8,9,200,200,200,200,551,551" );

// Test multi-parameter constructor, and keep testing sort cases
var trysortarray = new Array("But", "alphabet", "Different", "capitalization");
trysortarray.sort( Array.CASEINSENSITIVE );
check_equals ( trysortarray.toString() , "alphabet,But,capitalization,Different");
trysortarray.sort();
check_equals ( trysortarray.toString() , "But,Different,alphabet,capitalization" );
// TODO - test sort(Array.RETURNINDEXEDARRAY)

popped=b.pop();
check ( popped == 12 );
popped=b.pop();
check ( popped == "asdf" );
popped=b.pop();
check ( popped == 551 );
// make sure pops on an empty array don't cause problems
popped=b.pop();
check ( popped == undefined );
b.pop(); b.pop();
check_equals ( b.length, 0 );
b.unshift(8,2);
b.push(4,3);
b.pop();
b.shift();
check_equals ( b.toString() , "2,4" );
b.shift();
b.pop();
check_equals ( b.toString() , "" );

// check reverse for empty case
b.reverse();
check_equals ( b.toString() , "" );

// check concat, slice
var bclone = b.concat();
check_equals ( bclone.length, 0 );
check_equals ( b.length, 0 );
var basic = b.concat(0,1,2);
var concatted = basic.concat(3,4,5,6);
check_equals ( concatted.join() , "0,1,2,3,4,5,6" );
check_equals ( concatted[4] , 4 );
check_equals ( basic.toString() , "0,1,2" );
var portion = concatted.slice( 2,-2 );
check_equals ( portion.toString() , "2,3,4" );
portion = portion.slice(1);
check_equals ( portion.toString() , "3,4" );
portion = portion.slice(1, 2);
check_equals ( portion.toString() , "4" );
check_equals ( portion.length, 1);
portion = concatted.slice(-2, -1);
check_equals ( portion.toString(), "5");
portion = concatted.slice(-2);
check_equals ( portion.toString(), "5,6");

// invalid calls
portion = concatted.slice(-18);
check_equals ( portion.toString(), "0,1,2,3,4,5,6");
portion = concatted.slice(-18, 3);
check_equals ( portion.toString(), "0,1,2");
portion = concatted.slice(18);
check_equals ( portion.toString(), "");

// Test single parameter constructor, and implicitly expanding array
var c = new Array(10);
check (a instanceOf Array);
check_equals ( typeof(c), "object" );
check_equals ( c.length, 10 );
check_equals ( c[5] , undefined );
c[1000] = 283;
check_equals ( c[1000] , 283 );
check_equals ( c[1001] , undefined );
check_equals ( c[999] , undefined );
check_equals ( c.length, 1001 );

// Test that the 'length' property is overridable
c[8] = 'eight';
check_equals(c[8], 'eight');
c.length = 2;
check_equals(c.length, 2);
check_equals(c[8], undefined);

// $Log: array.as,v $
// Revision 1.14  2007/02/28 23:58:26  strk
//         * testsuite/actionscript.all/: array.as, Function.as
//           Don't expect failures when checking for missing
//           apply/call in SWF5.
//         * server/as_function.cpp (getFunctionPrototype):
//           Don't register 'apply' and 'call' members if
//           SWF < 6; use builtin_function when registering them.
//         * testsuite/actionscript.all/String.as:
//           Add test for 'substring' with base == length;
//           Fix test for SWF5 (no Function.call or Function.apply
//           there)
//         * server/vm/ASHandlers.cpp (ActionSubString):
// 	  fix case in which base is == length.
//
// Revision 1.13  2007/02/28 13:00:05  strk
//         * server/array.cpp: use builtin_method for builtin
//           methods :) ensure the 'this' pointer passed
//           to builtin methods is valid.
//         * testsuite/actionscript.all/array.as:
//           Add test for calling Array builtin functions
//           using FUnction.call.
//
// Revision 1.12  2007/02/28 07:41:27  strk
//         * server/array.{cpp,h}: allow resize trough
//           setting the 'length' property.
//         * testsuite/actionscript.all/array.as: test
//           that arrays 'length' is settable.
//
// Revision 1.11  2006/11/21 10:53:08  strk
//         * server/array.h: documented ::slice function
//         * server/array.cpp: more fixes.
//         * testsuite/actionscript.all/array.as: added some tests for
//           invalid calls to Array.slice()
//
