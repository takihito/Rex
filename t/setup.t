use strict;
use Test::More tests => 5;

BEGIN { use_ok 'Rex' }

my $rex = Rex->new( namespace => 'rex', redis_server=>$ENV{REDIS_SERVER} );

is($rex->namespace,'rex');
isa_ok($rex->redis,'Redis');
ok( $rex->redis->set('key1','hoge') );
is( $rex->redis->get('key1') ,'hoge' );

