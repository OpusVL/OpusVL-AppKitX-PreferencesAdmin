package OpusVL::AppKitX::PreferencesAdmin::FormFu::Validator::UniquePreference;

use Moose;

extends 'HTML::FormFu::Validator';
with 'OpusVL::AppKitX::PreferencesAdmin::Validator::UniquePreference';

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

    # XXX We can't reuse this code until we've got a way of parameterising this
    # Or until we move away from FormFu, which might avoid the requirement.
    my $c = $self->form->stash->{context};
    return $c->model('Users')->resultset($name);
}

1;
