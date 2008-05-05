// styles.cpp	-- Thatcher Ulrich <tu@tulrich.com> 2003

// This source code has been donated to the Public Domain.  Do
// whatever you want with it.

// Fill and line style types.


#include "styles.h"
#include "impl.h"
#include "log.h"
#include "render.h"
#include "stream.h"
#include "movie_definition.h"
#include "swf.h"
#include "GnashException.h"

namespace gnash {


//
// line_style
//

	
line_style::line_style()
    :
    m_width(0),
    m_color(),
    _scaleVertically(true),
    _scaleHorizontally(true),
    _pixelHinting(false),
		_noClose(false),
		_startCapStyle(CAP_ROUND),
		_endCapStyle(CAP_ROUND),
		_joinStyle(JOIN_ROUND),
		_miterLimitFactor(1.0f)
{
}

void
line_style::read_morph(stream* in, int tag_type, movie_definition *md,
	line_style *pOther)
{
	if (tag_type == SWF::DEFINEMORPHSHAPE)
	{
		in->ensureBytes(2 + 2);
		m_width = in->read_u16();
		pOther->m_width = in->read_u16();
		m_color.read(in, tag_type);
		pOther->m_color.read(in, tag_type);
		return;
	}

	// MorphShape 2 from here down.
	in->ensureBytes(4 + 2);

	m_width = in->read_u16();
	pOther->m_width = in->read_u16();

	// TODO: Same as in read(...), use these.
	// 0 -- Round caps, 1 -- No caps, 2 -- square caps
	_startCapStyle = (cap_style_e) in->read_uint(2);
	// 0 -- Round join, 1 -- Bevel join, 2 -- Miter join
	_joinStyle = (join_style_e) in->read_uint(2);
	bool has_fill = in->read_bit();
	_scaleHorizontally = ! in->read_bit();
	_scaleVertically = ! in->read_bit();
	_pixelHinting = in->read_bit();

	static_cast<void> (in->read_uint(5));
	_noClose = in->read_bit();
	_endCapStyle = (cap_style_e) in->read_uint(2); // As caps above.

	if (_joinStyle == JOIN_MITER)  // style 2
	{
		in->ensureBytes(2);
		_miterLimitFactor = in->read_short_ufixed();
	}
	if (has_fill)
	{
		// TODO: Throwing this away is not the right thing.
		// What is?
		// A fill style is here.
		// Answer (Udo): Should be passed to renderer somehow.
		fill_style f, g;
		f.read(in, tag_type, md, &g);
		m_color = f.get_color();
		pOther->m_color = g.get_color();
	}
	else
	{
		m_color.read(in, tag_type);
		pOther->m_color.read(in, tag_type);
	}
}

void
line_style::read(stream* in, int tag_type, movie_definition *md)
{
    if (!(tag_type == SWF::DEFINESHAPE4 || tag_type == SWF::DEFINESHAPE4_))
	{
		in->ensureBytes(2);
		m_width = in->read_u16();
		m_color.read(in, tag_type);
		return;
	}

	// TODO: Unfinished. Temporary to allow define shape 4 to work in many
	// cases, but does not work correctly in all cases.
	in->ensureBytes(2+2);
	m_width = in->read_u16();

	// 0 -- Round caps, 1 -- No caps, 2 -- square caps
	_startCapStyle = (cap_style_e) in->read_uint(2);
	// 0 -- Round join, 1 -- Bevel join, 2 -- Miter join
	_joinStyle = (join_style_e) in->read_uint(2);
	bool has_fill = in->read_bit();
	_scaleHorizontally = ! in->read_bit();
	_scaleVertically = ! in->read_bit();
	_pixelHinting = in->read_bit();
	static_cast<void> (in->read_uint(5));
	_noClose = in->read_bit();
	_startCapStyle = (cap_style_e) in->read_uint(2); // As caps above.

	if (_joinStyle == JOIN_MITER)  // style 2
	{
		in->ensureBytes(2);
		_miterLimitFactor = in->read_short_ufixed();
	}
	if (has_fill)
	{
		// TODO: Throwing this away is not the right thing.
		// What is?
		// A fill style is here.
		fill_style f;
		f.read(in, tag_type, md);
		m_color = f.get_color();
	}
	else
	{
		m_color.read(in, tag_type);
	}
}

void
line_style::set_lerp(const line_style& ls1, const line_style& ls2, float ratio)
{
	m_width = (boost::uint16_t)frnd(flerp(ls1.getThickness(), ls2.getThickness(), ratio));
	m_color.set_lerp(ls1.get_color(), ls2.get_color(), ratio);
	if ( ls1._scaleVertically != ls2._scaleVertically )
	{
		LOG_ONCE( log_error("UNTESTED: Dunno how to interpolate line styles with different vertical thickness scaling") );
	}
	if ( ls1._scaleHorizontally != ls2._scaleHorizontally )
	{
		LOG_ONCE( log_error("UNTESTED: Dunno how to interpolate line styles with different horizontal thickness scaling") );
	}
}


// end of namespace
}


// Local Variables:
// mode: C++
// End:
