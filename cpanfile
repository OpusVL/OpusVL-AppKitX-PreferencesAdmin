requires 'Moose';
requires 'namespace::autoclean';
requires 'CatalystX::InjectComponent';

requires 'OpusVL::AppKit';

on build => sub {
    requires 'Catalyst::Runtime' => '5.80015';
    requires 'Test::WWW::Mechanize::Catalyst';
    requires 'Test::More' => '0.88';
};

on develop => sub {
    requires 'Test::Pod::Coverage' => '1.04';
    requires 'Test::Pod' => '1.14';
};
