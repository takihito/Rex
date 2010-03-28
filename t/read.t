use strict;
use Test::More tests => 1;

BEGIN { use_ok 'Rex' }

my $rex = Rex->new( namespace => 'rex', redis_server=>$ENV{REDIS_SERVER}, copy_set => 0 );

__END__
my $list = $rex->get_index({ type => 'date', key  => 'perl'});
$list = $rex->search({ type => 'date', key  => 'perl', limit => 0, offset => 20 });
my ($list, $pager) = $rex->search({ type => 'date', key  => 'perl', page => 1, row => 20  });
$list = $rex->search_intersection({ key => ['perl','php'], limit => 0, offset => 20 } });
$list = $rex->search_union({ key => ['perl','php'], limit => 0, offset => 20 } });


