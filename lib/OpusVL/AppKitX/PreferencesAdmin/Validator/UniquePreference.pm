package OpusVL::AppKitX::PreferencesAdmin::Validator::UniquePreference;

use Moose::Role;

sub validate 
{
    my ($self, $name, $value, $params, $args) = @_;

    return '' unless $value;
    my $label = $args->{label} || 'Field'; 
    unless($name =~ /global_fields_(.*)/)
    {
        # this validator should only be applied to 
        # the global fields.
        return 'The field has been setup incorrectly by the developer.';
    }
    my $pref_name = $1;
    my $type_id = $params->{prf_owner_type_id};
    return '' if($type_id == -1); # not implemented for transaction params yet
    my $field = $self->resultset('PrfDefault')->find({ name => $pref_name, prf_owner_type_id => $type_id });
    my $rs = $self->resultset('PrfPreference');
    my $id = $params->{id};

    if($id)
    {
        my $me = $rs->current_source_alias;
        $rs = $rs->search({ "$me.prf_owner_id" => { '!=', $id } });
    }
    my $query = {
        'prf_preferences.prf_owner_type_id' => $type_id,
        'prf_preferences.name' => $pref_name,
    };
    if($field->data_type eq 'email')
    {
        $query->{"-and"} = [ 
            \[ 'lower("prf_preferences"."value") = ?' , [ dummy => lc($value) ] ] 
        ];
    }
    else
    {
        $query->{'prf_preferences.value'} = $value;
    }
    my $existing = $rs->search($query);

    if($existing->count)
    {
        return $label . ' must be unique';
    }
    return '';
}

1;
