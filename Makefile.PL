use strict;
use warnings;
use inc::Module::Install 0.91;
use Module::Install::AuthorRequires;
use Module::Install::AuthorTests;

name 'OpusVL-AppKitX-PreferencesAdmin';
all_from 'lib/OpusVL/AppKitX/PreferencesAdmin.pm';

requires 'Moose';
requires 'namespace::autoclean';
requires 'CatalystX::InjectComponent';

requires 'OpusVL::AppKit';

build_requires 'Catalyst::Runtime' => '5.80015';
build_requires 'Test::WWW::Mechanize::Catalyst';
build_requires 'Test::More' => '0.88';

author_requires 'Test::Pod::Coverage' => '1.04';
author_requires 'Test::Pod' => '1.14';

author_tests 't/author';

resources repository => 'ssh://git/srv/git/OpusVL-AppKitX-PreferencesAdmin';

if ($Module::Install::AUTHOR) {
    system("pod2text lib/OpusVL/AppKitX/PreferencesAdmin.pm > README")
        and die $!;
}

WriteAll();
