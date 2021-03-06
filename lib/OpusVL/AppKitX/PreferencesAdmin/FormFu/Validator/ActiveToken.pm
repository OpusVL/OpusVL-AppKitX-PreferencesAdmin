package OpusVL::AppKitX::PreferencesAdmin::FormFu::Validator::ActiveToken;

use Moose;

extends 'HTML::FormFu::Validator';

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

    if($token)
    {
        unless ($token->active)
        {
            die HTML::FormFu::Exception::Validator->new({
                message => $dict->localize('`Token` not active'),
            });
        }
    }

    return 1;
}


1;


=head1 NAME

OpusVL::AppKitX::PreferencesAdmin::FormFu::Validator::ActiveToken - Validates that a Token is active.

=head1 DESCRIPTION

I don't know what this does. Please document.

=head1 METHODS

=head2 validate_value

Please document
