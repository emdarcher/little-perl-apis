#!/usr/bin/env perl
# little api that converts between hex and dec

use Mojolicious::Lite;

get '/hex-dec/:value' => sub {
    my $c = shift;
    my $value = $c->stash('value');
    if( $value =~ m/(^0x{1}(\d|[a-fA-F])+$)/ ){
        return $c->render(text => 'HEX');
    } elsif ( $value =~ m/^\d+$/){
        return $c->render(text => 'DEC');
    } else {
        return $c->render(data => '', status => 400); 
    }
};

app->start;
