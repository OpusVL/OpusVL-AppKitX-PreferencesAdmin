package OpusVL::AppKitX::PreferencesAdmin::Controller::PreferencesAdmin;

use Moose;
use namespace::autoclean;
BEGIN { extends 'Catalyst::Controller'; };
with 'OpusVL::AppKit::RolesFor::Controller::GUI';

__PACKAGE__->config
(
    appkit_name                 => 'PreferencesAdmin',
    # appkit_icon                 => 'static/images/flagA.jpg',
    appkit_myclass              => 'OpusVL::AppKitX::PreferencesAdmin',
    # appkit_method_group         => 'Extension A',
    # appkit_method_group_order   => 2,
    # appkit_shared_module        => 'ExtensionA',
);

# sub home
#     :Path
#     :Args(0)
#     :NavigationHome
#     :AppKitFeature('Extension A')
# {
#     my ($self, $c) = @_;
# }

=head1 NAME

OpusVL::AppKitX::PreferencesAdmin::Controller:PreferencesAdmin - 

=head1 DESCRIPTION

=head1 METHODS

=head1 BUGS

=head1 AUTHOR

=head1 COPYRIGHT and LICENSE

Copyright (C) 2015 OpusVL

This software is licensed according to the "IP Assignment Schedule" provided with the development project.

=cut

