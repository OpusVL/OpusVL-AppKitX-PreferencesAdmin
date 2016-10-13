package OpusVL::AppKitX::PreferencesAdmin::FormFu::Validator::UniquePreference;

use Moose;

extends 'HTML::FormFu::Validator';
with 'OpusVL::AppKitX::PreferencesAdmin::Validator::UniquePreference';

has prf_model => (
    is => 'ro',
    isa => 'Str',
);

sub validate_value 
{
    my ($self, $value, $params) = @_;

    my $c = $self->form->stash->{context};
    my $error = $self->validate($self->name, $value, $params, { 
        label => $self->parent->label 
    });
    return 1 unless $error;
    die HTML::FormFu::Exception::Validator->new({
        message => $error
    });
}

sub resultset
{
    my $self = shift;
    my $name = shift;

    my $c = $self->form->stash->{context};
    return $c->model($self->prf_model)->resultset($name);
}

1;

=head1 NAME 

OpusVL::AppKitX::PreferencesAdmin::Validator::UniquePreference - FormFu validator for uniqueness of preference

=head1 DESCRIPTION

Validates that a preference is not already set up on a model

=head1 METHODS

=head2 validate_value

Validates that the provided preference name does not already exist on the provided model.

=head2 resultset

Fetches the named resultset from this validator's model. This assumes the model
is DBIC. I don't know why this is here.
