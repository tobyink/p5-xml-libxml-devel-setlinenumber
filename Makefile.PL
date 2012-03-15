use 5.010001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'XML::LibXML::Devel::SetLineNumber',
    VERSION_FROM      => 'lib/XML/LibXML/Devel/SetLineNumber.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/XML/LibXML/Devel/SetLineNumber.pm', # retrieve abstract from module
       AUTHOR         => 'Toby Inkster <tai@(none)>') : ()),
    LIBS    => '-L/usr/local/lib -L/usr/lib -lxml2 -lm',
    INC     => '-I/usr/include/libxml2/ -I/usr/local/include -I/usr/include -I.',
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    OBJECT            => '$(O_FILES)', # link all the C files too
);
