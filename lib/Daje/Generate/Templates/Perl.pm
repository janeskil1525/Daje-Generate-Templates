package Daje::Generate::Templates::Perl;
use Mojo::Base -base;

our $VERSION = '0.03';

1;

__DATA__

@@ class

package <<name_space>><<classname>>;
use Mojo::Base '<<base_name_space>><<base_class_name>>', -base, -signatures;

# Autogenerated class <<date>>
# Any manual changes to this class will be overwritten next time its generated

<<fields>>

    <<pkey>>
    <<fkey>>
    <<insert>>
    <<update>>
    <<select>>
    <<methods>>


@@ fields_method
has 'fields' => "<<select_fields>>";
has 'primary_key_name' => "<<primary_key>>";
has 'table_name' => "<<table_name>>";

@@ method

sub <<method_name>> (<<parameters>>) {
    <<method_content>>
};

@@ baseclass
package <<base_name_space>>Base;
use Mojo::Base -base, -signatures;

# Autogenerated class <<date>>
# Any manual changes to this class will be overwritten next time its generated

has 'db';

sub load_pk($table, $select, $primary_key_name, $primary_key) {
    my $result->{result} = 1;
    eval {
        my $load = $self->db->select(
            $table,
                [$select],
                {$primary_key_name => $primary_key}
        );
        $result->{data};
        $result->{data} = $load->hash if $load and $load->rows > 0;
    };
    if($@) {
        $result->{result} = 0;
        $result->{data} = "";
        $result->{error} = $@;
    };
    return $result;
};

sub load_fkey($table, $select, $foreign_key_name, $foreign_key) {
    my $result->{result} = 1;
    eval {
        my $load = $self->db->select(
            $table,
                [$select],
            {$foreign_key_name => $foreign_key}
        );
        $result->{data};
        $result->{data} = $load->hashes if $load and $load->rows > 0;
    };
    if($@) {
        $result->{result} = 0;
        $result->{data} = "";
        $result->{error} = $@;
    };
    return $result;
}

sub load_a_list($table, $select, $key_value) {
    my $result->{result} = 1;
     eval {
        my $load = $self->db->select(
            $table,
                [$select],
            {$key_value}
        );
        $result->{data};
        $result->{data} = $load->hashes if $load and $load->rows > 0;
    };
     if($@) {
        $result->{result} = 0;
        $result->{data} = "";
        $result->{error} = $@;
    };

    return $result;
}

sub insert($table, $data) {
    my $result->{result} = 1;
    eval {
        $self->db->insert($table, $data);
    } ;
    if($@) {
        $result->{error} = $@;
        $result->{result} = 0;
    };
    return $result;
}

sub update($table, $data, $keys) {
    my $result->{result} = 1;
    eval {
        $self->db->update($table, $data, $keys);
    };
     if($@) {
        $result->{error} = $@;
        $result->{result} = 0;
    }
    return $result;
}

};

@@ interface
package <<interface>><<classname>>;
use Mojo::Base '<<name_space>><<classname>>', -base, -signatures;

# Autogenerated class <<date>>
# This class is generated once. Any over rides or special methods should be put here




@@ load_from_pkey
sub load_pkey($<<primary_key>>) {

    my $result = $self->load_pk(
        $table_name,
        $fields,
        $primary_key_name,
        $<<primary_key>>
    );
    return $result;
}

@@ load_from_fkey
sub load_<<foreign_key>>($<<foreign_key>> ) {

    my $result = $self->load_fkey(
        $table_name,
        $fields,
        '<<foreign_key>>',
        $<<foreign_key>>
    );
    return $result;
}

@@ load_list
sub load_list($key_value) {
    my $result = $self->load_a_list(
        $table_name,
        $fields,
        $key_value
    );
    return $result;
}

@@ insert_data
sub insert_<<table_name>>($data) {
    my $result = $self->insert($table_name, $data);
    return $result;
}

@@ update_data
sub update_<<table_name>>($data, $keys) {
    my $result = $self->update($table_name, $data, $keys)
    return $result;
}

@@ view_list_interface

package <<interface>><<classname>>;
use Mojo::Base '<<name_space>><<classname>>', -base, -signatures;

# Autogenerated class <<date>>
# This class is generated once. Any over rides or special methods should be put here

@@ view_list_class
package <<name_space>><<classname>>;
use Mojo::Base '<<base_name_space>><<base_class_name>>', -base, -signatures;

# Autogenerated class <<date>>
# Any manual changes to this class will be overwritten next time its generated

<<fields>>
<<pkey>>
<<fkey>>
<<select>>
<<methods>>

@@ view_fields_method
has 'fields' => "<<select_fields>>";
has 'primary_keys' => "<<primary_keys>>";
has 'foreign_keys' => "foreign_keys"
has 'view_name' => "<<view_name>>";

@@ pod_text


#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Daje::Generate::Templates::Perl


=head1 DESCRIPTION

Autogenerated class <<date>>
Any manual changes to this class will be overwritten next time its generated


=head1 REQUIRES

L<feature> 

L<v5.40> 

L<feature> 

L<v5.40> 

L<feature> 

L<v5.40> 

L<Mojo::Base> 


=head1 METHODS


=cut

