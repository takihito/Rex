use strict;
use Test::More tests => 1;

BEGIN { use_ok 'Rex' }

my $rex = Rex->new( namespace => 'rex', redis_server=>$ENV{REDIS_SERVER}, copy_set => 0 );

__END__
$rex->delete_index({ type => 'all', key  => 'php' });

