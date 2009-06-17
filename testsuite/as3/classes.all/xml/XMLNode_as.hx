// XMLNode_as.hx:  ActionScript 3 "XMLNode" class, for Gnash.
//
// Generated by gen-as3.sh on: 20090514 by "rob". Remove this
// after any hand editing loosing changes.
//
//   Copyright (C) 2009 Free Software Foundation, Inc.
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
import flash.xml.XMLNode;
import flash.xml.XMLNodeType;
import flash.display.MovieClip;
import flash.xml.XMLDocument;
#else
import Xml;
import flash.MovieClip;
#end
import flash.Lib;
import Type;
import Std;
import Reflect;

// import our testing API
import DejaGnu;

// Class must be named with the _as suffix, as that's the same name as the file.
class XMLNode_as {
    static function main() {
	#if flash9
        var x1:XMLNode = new XMLNode(XMLNodeType.ELEMENT_NODE, null);	
	
        // Make sure we actually get a valid class        
        if (Std.is(x1, XMLNode)) {
            DejaGnu.pass("XMLNode class exists");
        } else {
            DejaGnu.fail("XMLNode class doesn't exist");
        }

	// Tests to see if all the properties exist. All these do is test for
	// existance of a property, and don't test the functionality at all. This
	// is primarily useful only to test completeness of the API implementation.

	if (Std.is(x1.attributes, Dynamic)) {
	    DejaGnu.pass("XMLNode.attributes property exists");
 	} else {
	    DejaGnu.fail("XMLNode.attributes property doesn't exist");
 	}
	if (Std.is(x1.childNodes, Array)) {
	    DejaGnu.pass("XMLNode.childNodes property exists");
 	} else {
 	    DejaGnu.fail("XMLNode.childNodes property doesn't exist");
	}
	if (Type.typeof(x1.namespaceURI)==ValueType.TNull) {
	    DejaGnu.pass("XMLNode.namespaceURI property exists");
	} else {
	    DejaGnu.fail("XMLNode.namespaceURI property doesn't exist");
	}
	if (Type.typeof(x1.nodeName)==ValueType.TNull) {
	    DejaGnu.pass("XMLNode.nodeName property exists");
	} else {
	    DejaGnu.fail("XMLNode.nodeName property doesn't exist");
	}
	if (Type.typeof(x1.nodeValue)==ValueType.TNull) {
	    DejaGnu.pass("XMLNode.nodeValue property exists");
	} else {
	    DejaGnu.fail("XMLNode.nodeValue property doesn't exist");
	}
	if (x1.prefix == null) {
	    DejaGnu.pass("XMLNode.prefix property exists");
	} else {
	    DejaGnu.fail("XMLNode.prefix property doesn't exist");
	}

	// Tests to see if all the methods exist. All these do is test for
	// existance of a method, and don't test the functionality at all. This
	// is primarily useful only to test completeness of the API implementation.
	if (Type.typeof(x1.appendChild)==ValueType.TFunction) {
	    DejaGnu.pass("XMLNode::appendChild() method exists");
	} else {
	    DejaGnu.fail("XMLNode::appendChild() method doesn't exist");
	}
	if (Type.typeof(x1.cloneNode)==ValueType.TFunction) {
 	    DejaGnu.pass("XMLNode::cloneNode() method exists");
	} else {
 	    DejaGnu.fail("XMLNode::cloneNode() method doesn't exist");
 	}
	if (Type.typeof(x1.getNamespaceForPrefix)==ValueType.TFunction) {
	    DejaGnu.pass("XMLNode::getNamespaceForPrefix() method exists");
	} else {
	    DejaGnu.fail("XMLNode::getNamespaceForPrefix() method doesn't exist");
	}
	if (Type.typeof(x1.getPrefixForNamespace)==ValueType.TFunction) {
	    DejaGnu.pass("XMLNode::getPrefixForNamespace() method exists");
	} else {
	    DejaGnu.fail("XMLNode::getPrefixForNamespace() method doesn't exist");
	}
	if (Type.typeof(x1.hasChildNodes)==TFunction) {
	    DejaGnu.pass("XMLNode::hasChildNodes() method exists");
 	} else {
 	    DejaGnu.fail("XMLNode::hasChildNodes() method doesn't exist");
 	}
	if (Type.typeof(x1.insertBefore)==TFunction) {
	    DejaGnu.pass("XMLNode::insertBefore() method exists");
	} else {
	    DejaGnu.fail("XMLNode::insertBefore() method doesn't exist");
	}
	if (Type.typeof(x1.removeNode)==TFunction) {
	    DejaGnu.pass("XMLNode::removeNode() method exists");
	} else {
	    DejaGnu.fail("XMLNode::removeNode() method doesn't exist");
	}
	if (Type.typeof(x1.toString)==TFunction) {
	    DejaGnu.pass("XMLNode::toString() method exists");
	} else {
	    DejaGnu.fail("XMLNode::toString() method doesn't exist");
	}
	
	//imported ming tests ported over for flashv9
	var doc:XMLNode = new XMLNode(untyped 3, "text constant");
	
	if (doc != null) {
		DejaGnu.pass("Succesfully created XMLNode of type textnode");
	} else {
		DejaGnu.fail("Couldn't create XMLNode of type textnode (uint 3)");
	}
	
	if (Std.is(doc, XMLNode)) {
		DejaGnu.pass("textnode has the right valuetype");
	} else {
		DejaGnu.fail("textnode doesn't have the right valuetype");
	}
	
	if (Type.typeof(doc.attributes) == ValueType.TObject) {
		DejaGnu.pass("XMLNode.textnode.attributes has the correct type.");
	} else {
		DejaGnu.fail("XMLNode.textnode.attributes isn't type 'object'");
	}
	
	//check that the new object still has the correct functions
	if (Type.typeof(doc.appendChild) == ValueType.TFunction) {
		DejaGnu.pass("XMLNode.textnode.appendChild function exists");
	} else {
		DejaGnu.fail("XMLNode.textnode.appendChild function doesn't exist after constructing an object");
	}
	if (Type.typeof(doc.cloneNode) == ValueType.TFunction) {
		DejaGnu.pass("XMLNode.textnode.cloneNode function exists");
	} else {
		DejaGnu.fail("XMLNode.textnode.cloneNode function doesn't exist after constructing an object");
	}
	if (Type.typeof(doc.hasChildNodes) == ValueType.TFunction) {
		DejaGnu.pass("XMLNode.textnode.hasChildNodes function exists");
	} else {
		DejaGnu.fail("XMLNode.textnode.hasChildNodes function doesn't exist after constructing an object");
	}
	if (Type.typeof(doc.insertBefore) == ValueType.TFunction) {
		DejaGnu.pass("XMLNode.textnode.insertBefore function exists");
	} else {
		DejaGnu.fail("XMLNode.textnode.insertBefore function doesn't exist after constructing an object");
	}
	if (Type.typeof(doc.removeNode) == ValueType.TFunction) {
		DejaGnu.pass("XMLNode.textnode.removeNode function exists");
	} else {
		DejaGnu.fail("XMLNode.textnode.removeNode function doesn't exist after constructing an object");
	}
	if (Type.typeof(doc.toString) == ValueType.TFunction) {
		DejaGnu.pass("XMLNode.textnode.toString function exists");
	} else {
		DejaGnu.fail("XMLNode.textnode.toString function doesn't exist after constructing an object");
	}
	
	//test functionality of properties
	doc.nodeName = "foo";
	if (Std.string(doc.nodeName) == "foo") {
		DejaGnu.pass("XMLNode.nodeName has correct constant value (foo)");
	} else {
		DejaGnu.fail("XMLNode.nodeName doesn't have correct constant value (should be foo)");
	}
	if (Std.string(doc.nodeValue) == "text constant") {
		DejaGnu.pass("XMLNode.nodeValue has correct constant value (textconstant)");
	} else {
		DejaGnu.fail("XMLNode.nodeValue doesn't have correct constant value (should be 'textconstant')");
	}
	
	//give a new nodeValue field
	doc.nodeValue = "bar";
	if (Std.string(doc.nodeValue) == "bar") {
		DejaGnu.pass("XMLNode.nodeValue has correct constant value (bar)");
	} else {
		DejaGnu.fail("XMLNode.nodeValue doesn't have the right value (should be bar)");
	}
	
	//doc doesn't have children yet, should return false and null for tests below
	if (Std.string(doc.hasChildNodes()) == "false") {
		DejaGnu.pass("XMLNode.hasChildNodes is returning proper value");
	} else {
		DejaGnu.fail("XMLNode.hasChildNodes is returning the wrong value (true when should be false)");
	}
	if (Std.string(doc.firstChild) == "null") {
		DejaGnu.pass("XMLNode.firstChild is properly returning null");
	} else {
		DejaGnu.fail("XMLNode.firstChild is not properly returning null");
	}
	if (Std.string(doc.lastChild) == "null") {
		DejaGnu.pass("XMLNode.lastChild is properly returning null");
	} else {
		DejaGnu.fail("XMLNode.lastChild is not properly returning null");
	}
	if (Std.string(doc.parentNode) == "null") {
		DejaGnu.pass("XMLNode.parentNode is properly returning null");
	} else {
		DejaGnu.fail("XMLNode.parentNode is not properly returning null");
	}
	if (Std.string(doc.nextSibling) == "null") {
		DejaGnu.pass("XMLNode.nextSibling is properly returning null");
	} else {
		DejaGnu.fail("XMLNode.nextSibling is not properly returning null");
	}
	if (Std.string(doc.previousSibling) == "null") {
		DejaGnu.pass("XMLNode.previousSibling is properly returning null");
	} else {
		DejaGnu.fail("XMLNode.previousSibling is not properly returning null");
	}
	
	//now test functionality of methods
	var node1:XMLNode = new XMLNode(untyped 1, "node1");
	var node2:XMLNode = new XMLNode(untyped 1, "node2");
	var textnode1:XMLNode = new XMLNode(untyped 3, "first text node");
	var textnode2:XMLNode = new XMLNode(untyped 3, "second text node");
	
	if (Std.string(textnode1.nodeType) == "3") {
		DejaGnu.pass("XMLNode.textnode1 has the correct value");
	} else {
		DejaGnu.fail("XMLNode.textnode1 doesn't have the correct value");
	}
	
	//append some children to node1 (created above)
	node1.appendChild(textnode1);
	node2.appendChild(textnode2);
	node1.appendChild(node2);
	
	if (node1.hasChildNodes() == true) {
		DejaGnu.pass("node1 is properly returning that it has child nodes");
	} else {
		DejaGnu.fail("node1 isn't properly returning that it has child nodes");
	}
	if (Std.string(node1.firstChild.nodeValue) == "first text node") {
		DejaGnu.pass("node1::firstChild is returning the right value");
	} else {
		DejaGnu.fail("node1::firstChild isn't returning the right value");
	}
	if (Type.typeof(node1.lastChild.nodeValue) == ValueType.TNull) {
		DejaGnu.pass("node1::lastChild.nodeValue is returning the right value");
	} else {
		DejaGnu.fail("node1::lastChild.nodeValue is not returning the right value");
	}
	if (node2.lastChild.toString() == "second text node") {
		DejaGnu.pass("node1::lastChild.toString is returning the right value");
	} else {
		DejaGnu.fail("node1::lastChild.toString is not returning the right value");
	}
	
	//create some more nodes and append them
	var node3:XMLNode = new XMLNode(untyped 1, "node3");
	var textnode3:XMLNode = new XMLNode(untyped 3, "third text node");
	node3.appendChild(textnode3);
	node1.appendChild(node3);
	
	//childNodes should be an array
	if (Std.is(node1.childNodes, Array)) {
		DejaGnu.pass("childNodes is an array");
	} else {
		DejaGnu.fail("childNodes isn't an array");
	}
	if (Type.typeof(node1.childNodes.push) == ValueType.TFunction) {
		DejaGnu.pass("XMLNode can push onto the childNodes array");
	} else {
		DejaGnu.fail("XMLNode can't push onto the childNodes array (function not defined)");
	}
	
	//node1 should have three children at this point (textnode1, node2, node 3)
	if (Std.string(node1.childNodes.length) == "3") {
		DejaGnu.pass("node1.childNodes is returning the proper length");
	} else {
		DejaGnu.fail("node1.childNodes is returning the incorrect length");
	}
	
	//now it has 4, but the element declared below is not an XMLNode
	node1.childNodes.push("not a node");
	if (Std.string(node1.childNodes.length) == "4") {
		DejaGnu.pass("node1.childNodes is returning the proper length");
	} else {
		DejaGnu.fail("node1.childNodes is returning the incorrect length");
	}
	if (!Std.is(node1.childNodes[3], XMLNode)) {
		DejaGnu.pass("Gnash properly handled the bad node input to childNodes");
	} else {
		DejaGnu.fail("Gnash didn't properly handle the bad node input to childNodes");
	}
	
	//now it has 5. the latest element is an XMLNode, but it does not become lastChild
	node1.childNodes.push(new XMLNode(untyped 1, "an XMLNode"));
	if (Std.string(node1.childNodes.length) == "5") {
		DejaGnu.pass("node1.childNodes is returning the proper length");
	} else {
		DejaGnu.fail("node1.childNodes is returning the incorrect length");
	}
	if (Std.is(node1.childNodes[4], XMLNode)) {
		DejaGnu.pass("Gnash properly handled the manual input to childNodes");
	} else {
		DejaGnu.fail("Gnash didn't properly handle the manual input to childNodes");
	}
	if (Std.string(node1.lastChild.toString()) == "<node3>third text node</node3>") {
		DejaGnu.pass("node1.lastChild.toString() returned the correct value");
	} else {
		DejaGnu.fail("node1.lastChild.toString() did not return the correct value");
	}
	
	//since child nodes is an array we should be able to access it as such and sort it as well
	if (node1.childNodes[0].toString() == "first text node") {
		DejaGnu.pass("node1.childNodes[0].toString() returned the correct string");
	} else {
		DejaGnu.fail("node1.childNodes[0].toString() did not return the correct string");
	}
	if (node1.childNodes[2].toString() == "<node3>third text node</node3>") {
		DejaGnu.pass("node1.childNodes[2].toString() returned the correct string");
	} else {
		DejaGnu.fail("node1.childNodes[2].toString() did not return the correct string");
	}
	if (node1.childNodes[3].toString() == "not a node") {
		DejaGnu.pass("node1.childNodes[3].toString() returned the correct string");
	} else {
		DejaGnu.fail("node1.childNodes[3].toString() did not return the correct string");
	}
	//sorting here
	Reflect.callMethod(node1.childNodes, Reflect.field(node1.childNodes, "sort"), []);
	//make sure the array sorted correctly
	if (node1.childNodes[0].toString() == "<an XMLNode />") {
		DejaGnu.pass("node1.childNodes[0].toString() returned the correct string");
	} else {
		DejaGnu.fail("node1.childNodes[0].toString() did not return the correct string");
	}
	if (node1.childNodes[2].toString() == "<node3>third text node</node3>") {
		DejaGnu.pass("node1.childNodes[2].toString() returned the correct string");
	} else {
		DejaGnu.fail("node1.childNodes[2].toString() did not return the correct string");
	}
	if (node1.childNodes[3].toString() == "first text node") {
		DejaGnu.pass("node1.childNodes[3].toString() returned the correct string");
	} else {
		DejaGnu.fail("node1.childNodes[3].toString() did not return the correct string");
	}

	//the array should be able to handle any sort of input
	node1.childNodes.push(new Date(2009,03,20,04,20,00));
	if (Std.string(node1.childNodes.length) == "6") {
		DejaGnu.pass("node1.childNodes is returning the proper length");
	} else {
		DejaGnu.fail("node1.childNodes is returning the incorrect length");
	}
	if (Std.is(node1.childNodes[5], Date)) {
		DejaGnu.pass("node1.childNodes[5] is returning correct Date type.");
	} else {
		DejaGnu.fail("node1.childNodes[5] has the wrong type (not Date type).");
	}
	
	//don't try to access childNodes[5] as ActionScript will throw an error
	//apparently gnash will handle this, but while testing with gflashplayer
	//threw an actionscript error
	node1.lastChild.appendChild(new XMLNode(untyped 1, "datenode"));
	
	var o = {
		toString : function() {
			return "o.toString()";
		}
	};
	if (Std.string(node1.childNodes.length) == "6") {
		DejaGnu.pass("node1.childNodes is returning the proper length");
	} else {
		DejaGnu.fail("node1.childNodes is returning the incorrect length");
	}
	//push new o var to the array
	node1.childNodes.push(o);
	if (Std.string(node1.childNodes.length) == "7") {
		DejaGnu.pass("node1.childNodes is returning the proper length");
	} else {
		DejaGnu.fail("node1.childNodes is returning the incorrect length");
	}
	if (node1.childNodes[6].toString() == "o.toString()") {
		DejaGnu.pass("node1.childNodes[6].toString() is returning the proper string");
	} else {
		DejaGnu.fail("node1.childNodes[6].toString() is returning the incorrect string");
	}
	
	//the last child should still be node3
	//haxe doesn't understand the pointers to these nodes, so check to make sure
	//the nodes simply don't have the same contents with Std.string (no nodes have
	//the same contents at this point)
	if (Std.string(node1.lastChild) != Std.string(node1.childNodes[6])) {
		DejaGnu.pass("node1.lastChild is returning the correct node");
	} else {
		DejaGnu.fail("node1.lastChild is returning the wrong node");
	}
	if (node1.lastChild.nodeName == "node3") {
		DejaGnu.pass("node1.lastChild.nodeName is returning the correct node name");
	} else {
		DejaGnu.fail("node1.lastChild.nodeName is returning the wrong node name");
	}
	if (node1.firstChild.toString() == "first text node") {
		DejaGnu.pass("node1.firstChild is returning the correct string");
	} else {
		DejaGnu.fail("node1.firstChild is returning the wrong string");
	}
	
	//last child should only change when a valid node is added to the list
	//and 'fake' elements should disappear
	var node4:XMLNode = new XMLNode(untyped 1, "4node");
	node1.appendChild(node4);
	if (node1.lastChild.toString() == "<4node />") {
		DejaGnu.pass("node1.lastChild is returning the correct string");
	} else {
		DejaGnu.fail("node1.lastChild is returning the wrong string");
	}
	if (Std.string(node1.childNodes.length) == "8") {
		DejaGnu.pass("node1.childNodes is returning the proper length");
	} else {
		DejaGnu.fail("node1.childNodes is returning the incorrect length");
	}
	if (node1.childNodes[node1.childNodes.length - 1].toString() == "<4node />") {
		DejaGnu.pass("node1.childNodes.length-1 is returning the proper string");
	} else {
		DejaGnu.fail("node1.childNodes.length-1 is returning the incorrect string");
	}
	
	//sorting here
	Reflect.callMethod(node1.childNodes, Reflect.field(node1.childNodes, "sort"), []);
	//sorting should only affect the array itself, not lastChild
	if (node1.lastChild.toString() == "<4node />") {
		DejaGnu.pass("node1.lastChild is returning the correct string");
	} else {
		DejaGnu.fail("node1.lastChild is returning the wrong string");
	}
	if (node1.childNodes[node1.childNodes.length - 1].toString() != "first text node") {
		DejaGnu.pass("node1.childNodes[node1.childNodes.length - 1] is returning the correct string");
	} else {
		DejaGnu.fail("node1.childNodes[node1.childNodes.length - 1] is returning the wrong string");
	}
	if (node1.firstChild.nodeValue == "first text node") {
		DejaGnu.pass("node1.firstChild.nodeValue is returning the correct string");
	} else {
		DejaGnu.fail("node1.firstChild.nodeValue is returning the wrong string");
	}
	if (Type.typeof(node1.lastChild.nodeValue) == ValueType.TNull) {
		DejaGnu.pass("node1.lastChild.nodeValue is returning the correct type");
	} else {
		DejaGnu.fail("node1.lastChild.nodeValue is returning the wrong type");
	}
	if (Type.typeof(node1.firstChild.nodeName) == ValueType.TNull) {
		DejaGnu.pass("node1.firstChild.nodeName is returning the correct type");
	} else {
		DejaGnu.fail("node1.firstChild.nodeName is returning the wrong type");
	}
	if (node1.lastChild.nodeName == "4node") {
		DejaGnu.pass("node1.lastChild.nodeName is returning the correct string");
	} else {
		DejaGnu.fail("node1.lastChild.nodeName is returning the wrong string");
	}
	if (node2.previousSibling.nodeValue == "first text node") {
		DejaGnu.pass("node1.previousSibling.nodeValue is returning the correct string");
	} else {
		DejaGnu.fail("node1.previousSibling.nodeValue is returning the wrong string");
	}
	
	//TODO: Test insertNode and removeNode
	
	//node2 shouldn't currently have any attributes (denoted by {} as a string)
	if (Std.string(node2.attributes) == "{}") {
		DejaGnu.pass("node2.attributes is empty (expected)");
	} else {
		DejaGnu.fail("node2.attributes is not empty");
	}
	if(Type.typeof(node2.attributes) == ValueType.TObject) {
		DejaGnu.pass("node2.attributes is returning the correct type");
	} else {
		DejaGnu.fail("node2.attributes is returning the wrong type");
	}
	
	//insert some attributes
	node2.attributes[3] = "a3";
	if (node2.attributes[3] == "a3") {
		DejaGnu.pass("node2.attributes[3] is returning the correct value");
	} else {
		DejaGnu.fail("node2.attributes[3] is returning the wrong value");
	}
	if (node2.attributes[untyped "3"] == "a3") {
		DejaGnu.pass("node2.attributes['3'] is returning the correct value");
	} else {
		DejaGnu.fail("node2.attributes['3'] is returning the wrong value");
	}
	node2.attributes.aattrib = "aa";
	if (node2.attributes.aattrib == "aa") {
		DejaGnu.pass("node2.attributes.aattrib is returning the correct value");
	} else {
		DejaGnu.fail("node2.attributes.aattrib is returning the wrong value");
	}
	if (node2.attributes[untyped "aattrib"] == "aa") {
		DejaGnu.pass("node2.attributes['aattrib'] is returning the correct value");
	} else {
		DejaGnu.fail("node2.attributes['aattrib'] is returning the wrong value");
	}
	if (node2.toString() == '<node2 aattrib="aa" 3="a3">second text node</node2>') {
		DejaGnu.pass("node2.toString() is returning the correct value");
	} else {
		DejaGnu.fail("node2.toString() is returning the wrong value");
	}
	
	//create some more nodes to append attributes to
	var node77:XMLNode = new XMLNode(untyped 1, "tag");
	node77.attributes.aattrib = "at1";
	if (node77.toString() == '<tag aattrib="at1" />') {
		DejaGnu.pass("node77.toString() is returning the correct value");
	} else {
		DejaGnu.fail("node77.toString() is returning the wrong value");
	}
	
	//check the order attributes are applied
	node77.attributes.zattrib = "z";
	node77.attributes.xattrib = "x";
	node77.attributes.cattrib = "c";
	node77.attributes.yattrib = "y";
	node77.attributes.fattrib = "f";
	node77.attributes[5] = "5";
	node77.attributes[untyped "$"] = "$";
	node77.attributes.xattrib = "x2";
	if (node77.toString() == '<tag zattrib="z" yattrib="y" aattrib="at1" cattrib="c" $="$" xattrib="x2" 5="5" fattrib="f" />') {
		DejaGnu.pass("node77.toString() is returning the correct value");
	} else {
		DejaGnu.fail("node77.toString() is returning the wrong value");
	}
	
	//Check namespaces
	
	//Standard namespace
	var x:XMLDocument = new XMLDocument('<tag xmlns="standard" attrib="u">text</tag>');
	var ns:XMLNode = new XMLNode(untyped 1, "tag");
	ns = x.firstChild;
	if (ns.nodeName == "tag") {
		DejaGnu.pass("ns.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeName is returning the wrong value");
	}
	if (ns.attributes[untyped "attrib"] == "u") {
		DejaGnu.pass("ns.nodeName['attrib'] is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeName['attrib'] is returning the wrong value");
	}
	if (ns.attributes[untyped "xmlns"] == "standard") {
		DejaGnu.pass("ns.nodeName['xmlns'] is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeName['xmlns'] is returning the wrong value");
	}
	if (ns.namespaceURI == "standard") {
		DejaGnu.pass("ns.namespaceURI is returning the correct value");
	} else {
		DejaGnu.fail("ns.namespaceURI is returning the wrong value");
	}
	if (ns.getNamespaceForPrefix("") == "standard") {
		DejaGnu.pass("ns.getNamespaceForPrefix('') is returning the correct value");
	} else {
		DejaGnu.fail("ns.getNamespaceForPrefix('') is returning the wrong value");
	}
	if (ns.getPrefixForNamespace("standard") == "") {
		DejaGnu.pass("ns.getPrefixForNamespace('standard') is returning the correct value");
	} else {
		DejaGnu.fail("ns.getPrefixForNamespace('standard') is returning the wrong value");
	}
	ns.attributes[untyped "xmlns"] = "standard2";
	if (ns.namespaceURI == "standard2") {
		DejaGnu.pass("ns.namespaceURI is returning the correct value");
	} else {
		DejaGnu.fail("ns.namespaceURI is returning the wrong value");
	}
	if (ns.getNamespaceForPrefix("") == "standard2") {
		DejaGnu.pass("ns.getNamespaceForPrefix('') is returning the correct value");
	} else {
		DejaGnu.fail("ns.getNamespaceForPrefix('') is returning the wrong value");
	}
	
	//make ns its own firstChild
	ns = ns.firstChild;
	if (Std.string(ns.nodeName) == "null") {
		DejaGnu.pass("ns.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeName is returning the wrong value");
	}
	if (ns.nodeValue == "text") {
		DejaGnu.pass("ns.nodeValue is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeValue is returning the wrong value");
	}
	if (ns.namespaceURI == null) {
		DejaGnu.pass("ns.namespaceURI is returning the correct value");
	} else {
		DejaGnu.fail("ns.namespaceURI is returning the wrong value");
	}
	if (ns.prefix == null) {
		DejaGnu.pass("ns.prefix is returning the correct value");
	} else {
		DejaGnu.fail("ns.prefix is returning the wrong value");
	}
	
	//redefine x with new xml tags
	x = new XMLDocument('<tag xmlns:t="standard"></tag>');
	ns = x.firstChild;
	if (ns.namespaceURI == null) {
		DejaGnu.pass("ns.namespaceURI is returning the correct value");
	} else {
		DejaGnu.fail("ns.namespaceURI is returning the wrong value");
	}
	if (ns.getNamespaceForPrefix("t") == "standard") {
		DejaGnu.pass("ns.getNamespaceForPrefix('t') is returning the correct value");
	} else {
		DejaGnu.fail("ns.getNamespaceForPrefix('t') is returning the wrong value");
	}
	if (ns.getPrefixForNamespace("standard") == "t") {
		DejaGnu.pass("ns.getPrefixForNamespace('standard') is returning the correct value");
	} else {
		DejaGnu.fail("ns.getPrefixForNamespace('standard') is returning the wrong value");
	}
	
	//redefine x with new xml tags
	x = new XMLDocument('<tag xmlns:t="nst"><tag2 xmlns="nss"><tag3 xmlns:r="nsr"></tag3></tag2></tag>');
	var n:XMLNode = new XMLNode(untyped 1, "tag");
	n = x.firstChild;
	
	if (n.nodeName == "tag") {
		DejaGnu.pass("n.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("n.nodeName is returning the wrong value");
	}
	if (n.namespaceURI == null) {
		DejaGnu.pass("ns.namespaceURI is returning the correct value");
	} else {
		DejaGnu.fail("ns.namespaceURI is returning the wrong value");
	}
	if (n.getNamespaceForPrefix("r") == null) {
		DejaGnu.pass("n.getNamespaceForPrefix('r') is returning the correct value");
	} else {
		DejaGnu.fail("n.getNamespaceForPrefix('r') is returning the wrong value");
	}
	if (n.getNamespaceForPrefix("nsr") == null) {
		DejaGnu.pass("n.getNamespaceForPrefix('nsr') is returning the correct value");
	} else {
		DejaGnu.fail("n.getNamespaceForPrefix('nsr') is returning the wrong value");
	}
	if (n.getNamespaceForPrefix("t") == "nst") {
		DejaGnu.pass("n.getNamespaceForPrefix('t') is returning the correct value");
	} else {
		DejaGnu.fail("n.getNamespaceForPrefix('t') is returning the wrong value");
	}
	if (n.getPrefixForNamespace("nst") == "t") {
		DejaGnu.pass("n.getPrefixForNamespace('nst') is returning the correct value");
	} else {
		DejaGnu.fail("n.getPrefixForNamespace('nst') is returning the wrong value");
	}
	
	//make n its own firstChild
	n = n.firstChild;
	if (n.nodeName == "tag2") {
		DejaGnu.pass("n.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("n.nodeName is returning the wrong value");
	}
	if (n.namespaceURI == "nss") {
		DejaGnu.pass("n.namespaceURI is returning the correct value");
	} else {
		DejaGnu.fail("n.namespaceURI is returning the wrong value");
	}
	if (n.getNamespaceForPrefix("r") == null) {
		DejaGnu.pass("n.getNamespaceForPrefix('r') is returning the correct value");
	} else {
		DejaGnu.fail("n.getNamespaceForPrefix('r') is returning the wrong value");
	}
	if (n.getPrefixForNamespace("nsr") == null) {
		DejaGnu.pass("n.getPrefixForNamespace('nsr') is returning the correct value");
	} else {
		DejaGnu.fail("n.getPrefixForNamespace('nsr') is returning the wrong value");
	}
	if (n.getNamespaceForPrefix("t") == "nst") {
		DejaGnu.pass("n.getNamespaceForPrefix('t') is returning the correct value");
	} else {
		DejaGnu.fail("n.getNamespaceForPrefix('t') is returning the wrong value");
	}
	if (n.getPrefixForNamespace("nst") == "t") {
		DejaGnu.pass("n.getPrefixForNamespace('nst') is returning the correct value");
	} else {
		DejaGnu.fail("n.getPrefixForNamespace('nst') is returning the wrong value");
	}
	
	//make n its own firstChild
	n = n.firstChild;
	if (n.nodeName == "tag3") {
		DejaGnu.pass("n.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("n.nodeName is returning the wrong value");
	}
	if (n.namespaceURI == "nss") {
		DejaGnu.pass("n.namespaceURI is returning the correct value");
	} else {
		DejaGnu.fail("n.namespaceURI is returning the wrong value");
	}
	if (n.getNamespaceForPrefix("r") == "nsr") {
		DejaGnu.pass("n.getPrefixForNamespace('nsr') is returning the correct value");
	} else {
		DejaGnu.fail("n.getPrefixForNamespace('nsr') is returning the wrong value");
	}
	if (n.getPrefixForNamespace("nsr") == "r") {
		DejaGnu.pass("n.getPrefixForNamespace('nsr') is returning the correct value");
	} else {
		DejaGnu.fail("n.getPrefixForNamespace('nsr') is returning the wrong value");
	}
	if (n.getNamespaceForPrefix("t") == "nst") {
		DejaGnu.pass("n.getNamespaceForPrefix('t') is returning the correct value");
	} else {
		DejaGnu.fail("n.getNamespaceForPrefix('t') is returning the wrong value");
	}
	if (n.getPrefixForNamespace("nst") == "t") {
		DejaGnu.pass("n.getPrefixForNamespace('nst') is returning the correct value");
	} else {
		DejaGnu.fail("n.getPrefixForNamespace('nst') is returning the wrong value");
	}
	
	// Poorly formed prefix namespaces become standard namespaces
	x = new XMLDocument('<tag xmlns:="nst"><tag2 xmlns="nss"><tag3 xmlns:="nsr"></tag3></tag2></tag>');
	n = x.firstChild.firstChild.firstChild;
	if (n.nodeName == "tag3") {
		DejaGnu.pass("n.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("n.nodeName is returning the wrong value");
	}
	if (n.namespaceURI == "nsr") {
		DejaGnu.pass("n.namespaceURI is returning the correct value");
	} else {
		DejaGnu.fail("n.namespaceURI is returning the wrong value");
	}
	if (n.getPrefixForNamespace("nsr") == "") {
		DejaGnu.pass("n.getPrefixForNamespace('nsr') is returning the correct value");
	} else {
		DejaGnu.fail("n.getPrefixForNamespace('nsr') is returning the wrong value");
	}
	if (n.getPrefixForNamespace("nst") == "") {
		DejaGnu.pass("n.getPrefixForNamespace('nst') is returning the correct value");
	} else {
		DejaGnu.fail("n.getPrefixForNamespace('nst') is returning the wrong value");
	}
	
	//try multiple declarations of standard namespace. this has changed between
	//as2 and as3. in as2 it would only accept "standard" as the namespace (the first
	//tag). in as3 it accepts the last declaration of namespace (standard2 below)
	x = new XMLDocument('<tag xmlns="standard" xmlns="standard2"></tag>');
	ns = x.firstChild;
	if (ns.nodeName == "tag") {
		DejaGnu.pass("ns.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeName is returning the wrong value");
	}
	if (ns.attributes[untyped "xmlns"] == "standard2") {
		DejaGnu.pass("ns.attributes['xmlns'] is returning the correct value");
	} else {
		DejaGnu.fail("ns.attributes['xmlns'] is returning the wrong value");
	}
	if (ns.namespaceURI == "standard2") {
		DejaGnu.pass("ns.namespaceURI is returning the correct value");
	} else {
		DejaGnu.fail("ns.namespaceURI is returning the wrong value");
	}
	
	//set values via attributes now
	x = new XMLDocument('<tag></tag>');
	ns = x.firstChild;
	if (ns.nodeName == "tag") {
		DejaGnu.pass("ns.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeName is returning the wrong value");
	}
	if (ns.attributes[untyped "xmlns"] == null) {
		DejaGnu.pass("ns.attributes['xmlns'] is returning the correct value");
	} else {
		DejaGnu.fail("ns.attributes['xmlns'] is returning the wrong value");
	}
	if (ns.namespaceURI == null) {
		DejaGnu.pass("ns.namespaceURI is returning the correct value");
	} else {
		DejaGnu.fail("ns.namespaceURI is returning the wrong value");
	}
	ns.attributes[untyped "xmlns"] = "nss";
	if (ns.attributes[untyped "xmlns"] == "nss") {
		DejaGnu.pass("ns.attributes['xmlns'] is returning the correct value");
	} else {
		DejaGnu.fail("ns.attributes['xmlns'] is returning the wrong value");
	}
	//note this has changed from AS2-AS3. In AS2 the namespaceURI would remain
	//undefined, but in AS3 the namespaceURI gets the same value as defined in
	//the xmlns (XML Namespace) tag
	if (ns.namespaceURI == "nss") {
		DejaGnu.pass("ns.namespaceURI is returning the correct value");
	} else {
		DejaGnu.fail("ns.namespaceURI is returning the wrong value");
	}
	
	//instantiate x with a prefix and local name
	x = new XMLDocument('<fr:tag/>');
	ns = x.firstChild;
	if (ns.nodeName == "fr:tag") {
		DejaGnu.pass("ns.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeName is returning the wrong value");
	}
	if (ns.localName == "tag") {
		DejaGnu.pass("ns.localName is returning the correct value");
	} else {
		DejaGnu.fail("ns.localName is returning the wrong value");
	}
	if (ns.prefix == "fr") {
		DejaGnu.pass("ns.prefix is returning the correct value");
	} else {
		DejaGnu.fail("ns.prefix is returning the wrong value");
	}
	
	//instantiate x with two prefixes and local name
	x = new XMLDocument('<fr:pr:tag/>');
	ns = x.firstChild;
	if (ns.nodeName == "fr:pr:tag") {
		DejaGnu.pass("ns.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeName is returning the wrong value");
	}
	if (ns.localName == "pr:tag") {
		DejaGnu.pass("ns.localName is returning the correct value");
	} else {
		DejaGnu.fail("ns.localName is returning the wrong value");
	}
	if (ns.prefix == "fr") {
		DejaGnu.pass("ns.prefix is returning the correct value");
	} else {
		DejaGnu.fail("ns.prefix is returning the wrong value");
	}
	
	//instantiate x with a two prefixs (first empty) and local name
	x = new XMLDocument('<:fr:tag/>');
	ns = x.firstChild;
	if (ns.nodeName == ":fr:tag") {
		DejaGnu.pass("ns.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeName is returning the wrong value");
	}
	if (ns.localName == "fr:tag") {
		DejaGnu.pass("ns.localName is returning the correct value");
	} else {
		DejaGnu.fail("ns.localName is returning the wrong value");
	}
	if (ns.prefix == "") {
		DejaGnu.pass("ns.prefix is returning the correct value");
	} else {
		DejaGnu.fail("ns.prefix is returning the wrong value");
	}
	
	//instantiate x with one empty prefix and local name
	x = new XMLDocument('<:tag/>');
	ns = x.firstChild;
	if (ns.nodeName == ":tag") {
		DejaGnu.pass("ns.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeName is returning the wrong value");
	}
	if (ns.localName == "tag") {
		DejaGnu.pass("ns.localName is returning the correct value");
	} else {
		DejaGnu.fail("ns.localName is returning the wrong value");
	}
	if (ns.prefix == "") {
		DejaGnu.pass("ns.prefix is returning the correct value");
	} else {
		DejaGnu.fail("ns.prefix is returning the wrong value");
	}
	
	//instantiate x with prefix and no local name
	x = new XMLDocument('<tag:/>');
	ns = x.firstChild;
	if (ns.nodeName == "tag:") {
		DejaGnu.pass("ns.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeName is returning the wrong value");
	}
	if (ns.localName == "") {
		DejaGnu.pass("ns.localName is returning the correct value");
	} else {
		DejaGnu.fail("ns.localName is returning the wrong value");
	}
	if (ns.prefix == "tag") {
		DejaGnu.pass("ns.prefix is returning the correct value");
	} else {
		DejaGnu.fail("ns.prefix is returning the wrong value");
	}
	
	//instantiate x with local name and no prefix
	x = new XMLDocument('<tag/>');
	ns = x.firstChild;
	if (ns.nodeName == "tag") {
		DejaGnu.pass("ns.nodeName is returning the correct value");
	} else {
		DejaGnu.fail("ns.nodeName is returning the wrong value");
	}
	if (ns.localName == "tag") {
		DejaGnu.pass("ns.localName is returning the correct value");
	} else {
		DejaGnu.fail("ns.localName is returning the wrong value");
	}
	if (ns.prefix == "") {
		DejaGnu.pass("ns.prefix is returning the correct value");
	} else {
		DejaGnu.fail("ns.prefix is returning the wrong value");
	}
	#end
	
	#if !flash9
	//NOTE: haxe doesn't support new XML() initializer
	DejaGnu.note("going to implement the 8 and lower tests when I figure out how haxe deals with this");
	#end
     // Call this after finishing all tests. It prints out the totals.
	 DejaGnu.done();
    }
}

// local Variables:
// mode: C++
// indent-tabs-mode: t
// End:

