# PgPerformanceTester

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/pg_performance_tester`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pg_performance_tester'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pg_performance_tester

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

# pg_performance_tester

## System Specs

- Ubuntu 16.04
- PostgreSQL 9.5.10
- 64 gigs of ECC memory
- 2x Intel XEON E5-2620 @ 2.00 Ghz (24 threads (6 Cores, 12 Threads per processor))

# Postgres Performance Tuning Generator

- [PgTune](http://pgtune.leopard.in.ua/)

# Postgres Tuning Configs

    listen_addresses = 'localhost'          
    listen_addresses = '*'          
    
    max_connections = 100
    max_connections = 200
    
    shared_buffers = 128MB  
    shared_buffers = 16GB
    
    
    effective_cache_size = 4GB
    effective_cache_size = 48GB
    
    default_statistics_target = 100
    
    min_wal_size = 1GB
    max_wal_size = 2GB
    checkpoint_completion_target = 0.7
    wal_buffers = 16MB
    
    maintenance_work_mem = 16MB
    maintenance_work_mem = 2GB
    
    work_mem = 1MB
    work_mem = 83886kB
    
    random_page_cost = 1.1


# Batch DB Setup

    pgbench -i -s 15 bench1; pgbench -i -s 70 bench2; pgbench -i -s 600 bench3; pgbench -i -s 30 bench

    create database bench;
    create database bench1;
    create database bench2;
    create database bench3;


# Test Commands

    pgbench -c 4 -j 2 -T 600 bench1 
    
    pgbench -c 4 -j 2 -T 600 bench2
    pgbench -c 4 -j 2 -T 600 -S bench2
    pgbench -c 4 -j 2 -T 600 -N bench2
    
    pgbench -c 4 -j 2 -T 600 bench3
    
    pgbench -c 1 -T 600 bench
    pgbench -c 8 -j 2 -T 600 bench
    pgbench -c 64 -j 4 -T 600 bench
    pgbench -c 64 -j 4 -T 600 -N bench


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kickinespresso/espresso_path. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

When making pull requests, please be sure to update the [CHANGELOG.md](CHANGELOG.md) with the corresponding changes.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Sponsors

This project is sponsored by [KickinEspresso](https://kickinespresso.com/?utm_source=github&utm_medium=sponsor&utm_campaign=opensource)

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/kickinespresso/ex_gtin/tags).


## Code of Conduct

Please refer to the [Code of Conduct](CODE_OF_CONDUCT.md) for details


## Resources 

- [PG Performance Test Examples](https://wiki.postgresql.org/wiki/Pgbenchtesting)