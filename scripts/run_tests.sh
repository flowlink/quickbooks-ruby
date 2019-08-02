#!/bin/bash
docker-compose run --rm quickbooks-ruby bundle exec rspec ${@}
