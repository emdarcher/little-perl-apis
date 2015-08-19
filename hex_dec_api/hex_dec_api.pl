#!/usr/bin/env perl
# little api that converts between hex and dec

use Mojolicious::Lite;

get '/hex-dec/:value' => sub {
    my $c = shift;
    my $value = $c->stash('value');
    my $type = get_num_type($value);
    return $c->render(text => $type) unless ($type eq 'NaN');
    return $c->render(data => '', status => 400);
    
};

sub get_num_type {
    my $num = shift;
    if( $num =~ m/(^0x{1}(\d|[a-fA-F])+$)/ ){
        return 'HEX';
    } elsif ( $num =~ m/^\d+$/){
        return 'DEC';
    } else {
        return 'NaN'; 
    }
};

app->start;
