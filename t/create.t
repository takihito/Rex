use strict;
use Test::More tests => 8;

BEGIN { use_ok 'Rex' }

my $rex = Rex->new( namespace => 'rex', redis_server=>$ENV{REDIS_SERVER}, copy_set => 1 );

my $key = $rex->rex_key('date','perl');
is($key, 'rex:date:perl');

# create index
$rex->redis->del($key);
ok($rex->create_index({ type => 'date', key => 'perl', list => [1, 2, 3, 4, 5] }));

# check index
is($rex->redis->lindex($key, 0), 1);
my @list = $rex->redis->lrange($key ,0 ,-1);
is_deeply(\@list, [1, 2, 3, 4, 5]);
is($rex->redis->llen($key), 5);

$rex->rpush_index({ type => 'date', key => 'perl', value => 6 }); 
$rex->lpush_index({ type => 'date', key => 'perl', value => 0 }); 
@list = $rex->redis->lrange($key ,0 ,-1);
is_deeply(\@list, [0, 1, 2, 3, 4, 5, 6]);

$rex->copy_to_set('perl'); 

# save
ok($rex->save);

__END__
$rex->create_index({ type => 'date', key  => 'perl', list => [1, 2, 3, 4, 5] });
$rex->push_index({ type  => 'date', key   => 'perl', value => 6 }); 
$rex->copy_to_set('perl'); 

