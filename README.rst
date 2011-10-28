Diazo_ (the software formerly known as XDV) is a theming engine that takes
a set of rules and theme and generates XSLT transformations that will
insert content of your choice into the theme.

In order to use the files in this repository, you will need:

- A recent version of Diazo_.
- mod_transform_html_, a modified version of mod_transform_.

If you're using an RPM based Linux distribution, you can grab the
mod_transform_html package  from the `SEAS package repository`_.

Notable limitations
===================

- Arguments to the `virtual` argument of mod_include's `include` directive
  may not contain a scheme or hostname.  So you can't do this:

        <replace css:theme="#sidebar"
          css:content="#content" href="http://www.example.com"/>

  If you really want to include content from a remote site, you'll need to
  arrange proxy access via `ProxyPass` or a `RewriteRule`.

.. _diazo: http://diazo.org/
.. _mod_transform_html: https://launchpad.net/mod-transform
.. _mod_transform: http://www.outoforder.cc/projects/apache/mod_transform/
.. _seas package repository: http://linux.seas.harvard.edu/seas/6/

