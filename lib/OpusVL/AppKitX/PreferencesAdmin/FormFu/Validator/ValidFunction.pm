package OpusVL::AppKitX::PreferencesAdmin::FormFu::Validator::ValidFunction;

use Moose;

extends 'HTML::FormFu::Validator';

has function => (is => 'rw', isa => 'Str');

sub validate_value 
{
    my ($self, $value, $params) = @_;

    return 1 unless $value;

    my $c = $self->form->stash->{context};
    my $token = $c->model('TokenDB::Token')->find({ name => $value }); 
    my $dict = $c->model('Dict');

    my $create_on_topup = $c->config->{create_on_topup};

    unless ($token || $create_on_topup)
    {
        die HTML::FormFu::Exception::Validator->new({
            message => $dict->localize('`Token` not valid'),
        });
    }

    if ($token && $token->profile->broker)
    {
        # lets see if the broker can perform the function.
        my $broker = $c->model($token->profile->broker);
        unless($broker->supports_method($self->function))
        {
            die HTML::FormFu::Exception::Validator->new({
                message => $dict->localize('`Token` does not allow this action.'),
            });
        }
    }

    return 1;
}

1;

=head1 NAME

OpusVL::AppKitX::PreferencesAdmin::FormFu::Validator::ValidFunction - Validates that a Token can perform the given function.

=head1 DESCRIPTION

I don't know what this does besides what the abstract says

=head1 METHODS

=head2 validate_value

Please document.
