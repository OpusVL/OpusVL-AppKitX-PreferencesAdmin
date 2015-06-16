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
