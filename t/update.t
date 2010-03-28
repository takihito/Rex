use strict;
use Test::More tests => 1;

BEGIN { use_ok 'Rex' }

my $rex = Rex->new( namespace => 'rex', redis_server=>$ENV{REDIS_SERVER}, copy_set => 0 );

__END__
$rex->create_index({ type => 'all', key  => 'php', list => [1, 2, 3, 5] });
my $list = $rex->update_index({ type => 'all', key  => 'php', value => 4, position => 4 });
$list = $rex->search({ type => 'all', key  => 'perl', limit => 0, offset => 20 });

