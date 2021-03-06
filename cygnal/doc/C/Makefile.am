## Process this fillocatee with automake to generate Makefile.in
# 
#   Copyright (C) 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012
#   Free Software Foundation, Inc.
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

# Building a PDF using Apache FOP only works with fop-0.20.5 for now.

htmldir = ${prefix}/share/doc/gnash
infodir = ${prefix}/share/info
docname = gnash
lang = C
omffile = gnash-C.omf

docdir = $(datadir)/$(PACKAGE)/doc/$(docname)/$(lang)
omf_dest_dir=$(datadir)/omf/$(PACKAGE)
scrollkeeper_localstate_dir = $(localstatedir)/scrollkeeper

# These are the top level files for each manual.
XML_MAIN = \
	gnashuser.xml \
	gnashref.xml

# These are the files needed to build the Gnash user
# manual.
COMMON = \
	introduction.xml \
	security.xml \
	legal.xml \
	app_authors.xml \
	doc_authors.xml \
	fdl-appendix.xml \
	bugreport.xml

USERMAN = \
	usermanual/installation.xml \
	usermanual/revisions.xml \
	usermanual/usage.xml \
	usermanual/gnashrc.xml \
	usermanual/acknowledgments.xml \
	usermanual/conventions.xml

# These are the files needed to build the Gnash reference
# manual.
REFMAN = \
	refmanual/code_dependencies.xml \
	refmanual/configuration.xml \
	refmanual/custompath_configuration.xml \
	refmanual/documentation_dependencies.xml \
	refmanual/feature_configuration.xml \
	refmanual/sources.xml \
	refmanual/testing_dependencies.xml \
	refmanual/cross_compiling.xml	\
	refmanual/building.xml \
	refmanual/install.xml \
	refmanual/codestyle.xml
#	refmanual/packagemanager.xml


EXTRA_DIST = \
	$(USERMAN) \
	$(REFMAN) \
	$(COMMON) \
	$(XML_MAIN) \
	$(MANSRC)  \
	preformatted/gnashuser.html.in preformatted/gprocessor.1.in preformatted/cygnal.1.in preformatted/gnash.1.in preformatted/gnash_ref.info.in preformatted/soldumper.1.in preformatted/flvdumper.1.in preformatted/dumpshm.1.in preformatted/gnashref.html.in preformatted/gnash_user.info.in

#noinst_SCRIPT = gen-doc.sh
# We list the texi and info pages twice, as differing versions of the 
# docbook-utils transform the name at different steps in the process.
# This is an easy way to handle it either way, since we only need it as
# dependency anyway.
dist_man_MANS = gnash.1 gprocessor.1 dumpshm.1 soldumper.1 flvdumper.1 cygnal.1 rtmpget.1
MANSRC = $(dist_man_MANS:.1=.man-xml)
INFOS  = gnash_user.info gnash_ref.info
HTMLS  = $(XML_MAIN:.xml=.html)
PDFS   = $(XML_MAIN:.xml=.pdf)
TEXIS  = gnash_user.texi gnashuser.texi gnash_ref.texi gnashref.texi

all-local: info html man

gnashuser.html gnashuser.pdf gnash_user.info: gnashuser.xml $(USERMAN) $(COMMON)
gnashref.html gnashref.pdf gnash_ref.info: gnashref.xml $(REFMAN) $(COMMON)

# Convienience rules for developers of these manuals. By default
# all output formats are built if the Docbook tools are installed
# and working correctly.
html: $(HTMLS)
pdf:  $(PDFS)
man:  $(dist_man_MANS)
info: $(INFOS)
texi: $(TEXIS)

#
# Gnash uses suffix rules to build all the various supported
# output formats. This section contains all the code that does
# the document convesion from docbook to whatever. Note that
# all of these are conditional, as the tools may not be
# installed on all systems, and on some systems, getting a fully
# working Docbook tools system can problematic. In this case 
# preformatted versions are in the top level packaging/doc
# directory, so we just link to them so they can be installed.
# While it's a bit of a pain in the neck for developers to
# keep the preformatted versions up to date, it's much easier
# for end users because the documentation in xml, html, and info
# formats is always available.
#
SUFFIXES = .xml .html .texi .pdf .info .1 .fo .man-xml .in

if ENABLE_FOP
.xml.pdf:
	-$(FOP) -xsl $(docbook_styles)/fo/docbook.xsl -xml $< -pdf $@
else
if ENABLE_XMLTEX
.xml.fo:
	$(XSLTPROC) --output $@ --nonet $(docbook_styles)/fo/docbook.xsl $<

.fo.pdf:
	$(PDFXMLTEX) -interaction=nonstopmode $<
else
.xml.pdf:
	touch $@
endif
endif


.xml.html:
if ENABLE_HTML
	-$(XSLTPROC) --output $@ --nonet $(docbook_styles)/html/docbook.xsl $<
	@$(RM) $*.txml
else
	@if test -d $(srcdir)/preformatted; then \
	  echo "WARNING: Linking to preformatted version of $@, it could be out of date."; \
	  $(LN_S) -f $(srcdir)/preformatted/$@.in ./$@; \
	else \
	  touch $@; \
	fi
endif

# The first test seems to be the default for Fedora/Redhat/Centos based distributions,
# which use a wrapper script for jade.
# Ubuntu/Debian uses a real perl script that actually does the real work
.xml.texi:
if ENABLE_TEXI
	-if test x$(DB2X_TEXI) != x; then \
	  out=`echo $* | sed -e 's:gnash:gnash_:'`; \
	  $(DB2X_TEXI) --encoding=us-ascii//TRANSLIT --string-param directory-description="Gnash" --string-param output-file=$${out} $<; \
	  $(MAKEINFO) --force $${out}.texi; \
	else \
	  basefile="$*"; \
          $(DB2X_XSLTPROC) -s texi $< --output $${basefile}.txml; \
	  $(DB2X_TEXIXML) --info --encoding=us-ascii//TRANSLIT $${basefile}.txml ; \
	  rm $${basefile}.txml; \
	fi
endif

.texi.info:
if ENABLE_TEXI
	-$(MAKEINFO) --force $<
else	
	touch $@;
endif

.man-xml.1:
if ENABLE_MAN
	-@if test x$(DB2X_MAN) != x; then \
	  $(DB2X_MAN) $?; \
        else \
	  $(DB2X_XSLTPROC) -s man $? -o $*.mxml; \
	  $(DB2X_MANXML) $*.mxml; \
	  $(RM) $*.mxml; \
	fi
else
	@if test -d $(srcdir)/preformatted; then \
	  echo "WARNING: Linking to preformatted version of $@, it could be out of date."; \
	  $(LN_S) -f $(srcdir)/preformatted/$@.in ./$@; \
	else \
	  touch $@; \
	fi
endif

if DOCBOOK
gnash_user.info: gnashuser.texi
gnash_ref.info: gnashref.texi
gnashuser.texi gnash_user.texi: gnashuser.xml
gnashref.texi gnash_user.texi: gnashref.xml
else
gnash_user.info: gnashuser.xml
	@if test -d $(srcdir)/preformatted; then \
	  echo "WARNING: Linking to preformatted version of $@, it could be out of date."; \
	  $(LN_S) -f $(srcdir)/preformatted/gnash_user.info.in ./gnash_user.info; \
	fi
gnash_ref.info: gnashref.xml
	@if test -d $(srcdir)/preformatted; then \
	  echo "WARNING: Linking to preformatted version of $@, it could be out of date."; \
	  $(LN_S) -f $(srcdir)/preformatted/gnash_ref.info.in ./gnash_ref.info; \
	fi
gnashref.html: gnashref.xml
	@if test -d $(srcdir)/preformatted; then \
	  echo "WARNING: Linking to preformatted version of $@, it could be out of date."; \
	  $(LN_S) -f $(srcdir)/preformatted/gnashref.html.in ./gnashref.html; \
	fi
gnashuser.html: gnashref.xml
	@if test -d $(srcdir)/preformatted; then \
	  echo "WARNING: Linking to preformatted version of $@, it could be out of date."; \
	  $(LN_S) -f $(srcdir)/preformatted/gnashuser.html.in ./gnashuser.html; \
	fi
endif

# When we build in a seperate build tree, we need links to the images
# subdirectory to have them be included in the final output.
# images:
# 	@if test ! -d images; then \
# 	   $(LN_S) -f $(top_srcdir)/doc/C/images images; \
# 	fi

lint-user:
	@xmllint $(srcdir)/gnashuser.xml

lint-ref:
	@xmllint $(srcdir)/gnashref.xml

# This target adds the images to the dist file, which is
# produced by the dist-bzip2, dist-gzip, or snapshot targets.
# distdir is a built in target for Automake.
dist-hook:
	test -d "$(distdir)/images/images" || $(mkinstalldirs) "$(distdir)/images"
	for file in $(srcdir)/images/*.png $(srcdir)/images/*.txt; do \
	  basefile="`basename $${file}`"; \
	  if test ! -e $(distdir)/images/$${basefile}; then \
	    $(INSTALL_DATA) $$file $(distdir)/images/; \
	  fi; \
	done

#
# Installing documentation can be a complex process, as we build
# multiple output formats. This section contains all of the 
# Makefile targets that are used to install or uninstall the
# documentation.
#

install-html-hook: $(HTMLS)
	@test -d "$(DESTDIR)$(htmldir)" || $(mkinstalldirs) "$(DESTDIR)$(htmldir)"
	-$(INSTALL_DATA) gnashuser.html $(DESTDIR)$(htmldir)
	-$(INSTALL_DATA) gnashref.html $(DESTDIR)$(htmldir)
	@test -d "$(DESTDIR)$(htmldir)/images" || $(mkinstalldirs) "$(DESTDIR)$(htmldir)/images"
	for file in $(srcdir)/images/*.png; do \
	  basefile=`echo $$file | sed -e  's,^.*/,,'`; \
	  $(INSTALL_DATA) $$file $(DESTDIR)$(htmldir)/images/$$basefile; \
	done

# There are two versions of install-info, with unfortunately different options.
# Rather than test the version at configure time, we do it at runtime instead
# so we can switch versions at installation time.
install-info-hook: $(INFOS)
if ENABLE_INFO
	@test -d "$(DESTDIR)$(infodir)" || $(mkinstalldirs) "$(DESTDIR)$(infodir)"
	-for i in *.info; do \
	  $(INSTALL_DATA) "$$i" $(DESTDIR)$(infodir)/"$$i"; \
	done; \
	type="`file $(INSTALL_INFO) | grep -ic " perl " 2>&1`"; \
	if test $${type} -gt 0; then \
	  $(INSTALL_INFO) --menuentry="\"Gnash User Manual\"" --quiet --description="\"Gnash User Manual\"" --info-dir=$(DESTDIR)$(infodir) $(DESTDIR)$(infodir)/gnash_user.info; \
	  $(INSTALL_INFO) --menuentry="\"Gnash Reference Manual\"" --quiet --description="\"Gnash Reference Manual\"" --info-dir=$(DESTDIR)$(infodir) $(DESTDIR)$(infodir)/gnash_ref.info; \
        else \
	  $(INSTALL_INFO) --entry="\"Gnash User Manual: (gnash_user)	Gnash User Manual\"" --info-dir=$(DESTDIR)$(infodir) $(DESTDIR)$(infodir)/gnash_user.info; \
	  $(INSTALL_INFO) --entry="\"Gnash Reference Manual (gnash_ref)	Gnash Reference Manual\"" --info-dir=$(DESTDIR)$(infodir) $(DESTDIR)$(infodir)/gnash_ref.info; \
	fi
else
	echo "Using preformtted output file,"
	$(LN_S) -f $(srcdir)/preformatted/gnash_user.info.in gnash_user.info
	$(LN_S) -f $(srcdir)/preformatted/gnash_ref.info.in gnash_ref.info
        $(INSTALL_INFO) --entry="\"Gnash User Manual: (gnash_user)	Gnash User Manual\"" --info-dir=$(DESTDIR)$(infodir) $(DESTDIR)$(infodir)/gnash_user.info
	$(INSTALL_INFO) --entry="\"Gnash Reference Manual (gnash_ref)	Gnash Reference Manual\"" --info-dir=$(DESTDIR)$(infodir) $(DESTDIR)$(infodir)/gnash_ref.info
endif

uninstall-info-hook:
if ENABLE_INFO
	-$(INSTALL_INFO) --dir-file=$(DESTDIR)$(infodir)/dir --remove $(DESTDIR)$(infodir)/gnash_user.info
	-$(INSTALL_INFO)  --dir-file=$(DESTDIR)$(infodir)/dir --remove $(DESTDIR)$(infodir)/gnash_ref.info
endif
	-$(RM) $(DESTDIR)$(infodir)/gnash_user.info
	-$(RM) $(DESTDIR)$(infodir)/gnash_ref.info

uninstall-html-hook:
	-$(RM) $(DESTDIR)$(htmldir)/gnashuser.html
	-$(RM) $(DESTDIR)$(htmldir)/gnashref.html
	-$(RM) $(DESTDIR)$(htmldir)/images/*png

# install-data-hook: install-data-hook-omf
# uninstall-local: uninstall-local-doc uninstall-local-omf

install-data-hook: install-info-hook install-html-hook 
uninstall-hook: uninstall-info-hook uninstall-html-hook

#
# GNOME Help support, which currently isn't supported
# by the Gnash GTK GUI.
#

# if GHELP
# all-local: omf
# INSTALL_DATA_HOOK += omf install-data-omf-hook
# UNINSTALL_HOOK += uninstall-omf-hook
# endif

omf: omf_timestamp

omf_timestamp: $(omffile)
	for file in $(omffile); do \
	    $(SCROLLINSTALL) $(docdir)/$(docname).xml $(srcdir)/$$file $$file.out; \
	done
	touch omf_timestamp

install-data-omf-hook:
	$(mkinstalldirs) $(DESTDIR)$(omf_dest_dir)
	for file in $(omffile); do \
	  $(INSTALL_DATA) $$file.out $(DESTDIR)$(omf_dest_dir)/$$file; \
	done
	-$(SCROLLUPDATE) -v -o $(DESTDIR)$(omf_dest_dir)

uninstall-omf-hook:
	-for file in $(omffile); do \
	    $(RM) $(DESTDIR)$(omf_dest_dir)/$$file; \
	done
	-rmdir $(DESTDIR)$(omf_dest_dir)
	-$(SCROLLUPDATE) -v 

CLEANFILES = \
        $(PDFS) \
	$(MANS) \
	$(INFOS) \
        $(HTMLS) \
	gnash-C.omf.out \
	manpage.links  \
	manpage.refs  \
	gnash_ref.texi  \
	gnashref.texi  \
	gnash_user.texi  \
	gnashuser.texi  \
	gnash.fo  \
	gnash.log  \
	gnashuser.txml \
	gnashuser.mxml \
	gnashref.txml \
	gnashref.mxml \
	omf_timestamp


# Always execute these targets as they have no real dependencies.
.PHONY: images install-info-hook uninstall-info-hook install-html-hook uninstall-html-hook uninstall-data-hook install-data-hook

