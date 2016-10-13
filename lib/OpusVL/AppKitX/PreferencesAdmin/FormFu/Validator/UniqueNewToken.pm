package OpusVL::AppKitX::PreferencesAdmin::FormFu::Validator::UniqueNewToken;

use Moose;

extends 'HTML::FormFu::Validator';

sub validate_value 
{
    my ($self, $value, $params) = @_;

    return 1 unless $value;

    my $c = $self->form->stash->{context};
    my $token = $c->model('TokenDB::Token')->active->find({ name => $value }); 
    my $dict = $c->model('Dict');

    if($token)
    {
        die HTML::FormFu::Exception::Validator->new({
            message => $dict->localize("`Serial_Number` already issued"),
        });
    }
    return 1;
}

1;

=head1 NAME

OpusVL::AppKitX::PreferencesAdmin::FormFu::Validator::UniqueNewToken - Validates
that the token is not already in the TokenDB.

=head1 DESCRIPTION

I don't really know what the TokenDB does so I don't understand the semantics of
this class. Please document.

=head1 METHODS

=head2 validate_value

Performs said validation.
