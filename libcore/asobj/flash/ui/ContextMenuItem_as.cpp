// as_object.cpp:  ActionScript "ContextMenuItem" class, for Gnash.
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

#ifdef HAVE_CONFIG_H
#include "gnashconfig.h"
#endif

#include "ui/ContextMenuItem_as.h"
#include "log.h"
#include "fn_call.h"
#include "Global_as.h"
#include "smart_ptr.h" // for boost intrusive_ptr
#include "builtin_function.h" // need builtin_function
#include "Object.h" 

namespace gnash {

// Forward declarations
namespace {
    as_value contextmenuitem_ctor(const fn_call& fn);
    as_value contextmenuitem_copy(const fn_call& fn);
    void attachContextMenuItemInterface(as_object& o);
    as_object* getContextMenuItemInterface();

}

// extern (used by Global.cpp)
void
contextmenuitem_class_init(as_object& where, const ObjectURI& uri)
{
    static boost::intrusive_ptr<as_object> cl;

    if (!cl) {
        Global_as* gl = getGlobal(where);
        as_object* proto = getContextMenuItemInterface();
        cl = gl->createClass(&contextmenuitem_ctor, proto);
    }

    // Register _global.ContextMenuItem
    where.init_member(getName(uri), cl.get(), as_object::DefaultFlags,
            getNamespace(uri));
}

namespace {

void
attachContextMenuItemInterface(as_object& o)
{
    const int flags = PropFlags::dontEnum |
                      PropFlags::dontDelete |
                      PropFlags::onlySWF7Up;

    Global_as* gl = getGlobal(o);
    o.init_member("copy", gl->createFunction(contextmenuitem_copy), flags);
}

as_object*
getContextMenuItemInterface()
{
    static boost::intrusive_ptr<as_object> o;
    if ( ! o ) {
        o = new as_object(getObjectInterface());
        attachContextMenuItemInterface(*o);
        VM::get().addStatic(o.get());
    }
    return o.get();
}

as_value
contextmenuitem_copy(const fn_call& fn)
{
    boost::intrusive_ptr<as_object> ptr = ensureType<as_object>(fn.this_ptr);

    as_value caption, separatorBefore, visible, enabled, onSelect;
    string_table& st = getStringTable(fn);

    ptr->get_member(st.find("caption"), &caption);
    ptr->get_member(st.find("separatorBefore"), &separatorBefore);
    ptr->get_member(st.find("visible"), &visible);
    ptr->get_member(NSV::PROP_ON_SELECT, &onSelect);
    ptr->get_member(NSV::PROP_ENABLED, &enabled);

    as_object* c = new as_object(getContextMenuItemInterface());
    c->set_member(st.find("caption"), caption);
    c->set_member(st.find("separatorBefore"), separatorBefore);
    c->set_member(st.find("visible"), visible);
    c->set_member(NSV::PROP_ON_SELECT, onSelect);
    c->set_member(NSV::PROP_ENABLED, enabled);
    
    return as_value(c);
}


as_value
contextmenuitem_ctor(const fn_call& fn)
{
    as_object* obj = new as_object(getContextMenuItemInterface());

    string_table& st = getStringTable(fn);

    obj->set_member(st.find("caption"), fn.nargs ? fn.arg(0) : as_value());
    obj->set_member(NSV::PROP_ON_SELECT, fn.nargs > 1 ? fn.arg(1) : as_value());
    obj->set_member(st.find("separatorBefore"), fn.nargs > 2 ?
            fn.arg(2) : false);
    obj->set_member(NSV::PROP_ENABLED, fn.nargs > 3 ? fn.arg(3) : true);
    obj->set_member(st.find("visible"), fn.nargs > 4 ? fn.arg(4) : true);

    return obj; 
}

} // anonymous namespace 
} // gnash namespace

// local Variables:
// mode: C++
// indent-tabs-mode: t
// End:

