use inc::Module::Install;
name 'Rex';
all_from 'lib/Rex.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
