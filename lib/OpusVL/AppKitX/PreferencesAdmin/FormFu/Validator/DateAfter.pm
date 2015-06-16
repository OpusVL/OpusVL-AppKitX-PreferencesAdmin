package OpusVL::AppKitX::PreferencesAdmin::FormFu::Validator::DateAfter;

use Moose;

extends 'HTML::FormFu::Validator';
has other_date => (is => 'rw', isa => 'Str');

sub validate_value 
{

    my ($self, $value, $params) = @_;

    return 1 unless $value;
    my $extra = "";
    if($self->name =~ /(_\d+)/)
    {
        # quick kludge to make it work on repeatable elements.
        $extra = $1;
    }
    my $other_value = $params->{$self->other_date . $extra};
    return 1 unless $other_value;
    unless($value >= $other_value)
    {
        die HTML::FormFu::Exception::Validator->new({
            message => 'Date must follow'
        });
    }
    return 1;
}

1;

=head1 NAME

OpusVL::AppKitX::PreferencesAdmin::FormFu::Validator::DateAfter

=head1 DESCRIPTION

=head1 METHODS

=head2 validate_value

=head1 ATTRIBUTES

=head2 other_date


=head1 LICENSE AND COPYRIGHT

Copyright 2012 OpusVL.

This software is licensed according to the "IP Assignment Schedule" provided with the development project.

=cut
