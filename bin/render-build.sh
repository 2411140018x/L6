#!/usr/bin/env bash
# Render のビルド時に実行するスクリプト
set -o errexit

# Gemfile.lock に pg がまだ入っていないので、ビルド時だけロックファイルの固定を外して解決する
BUNDLE_FROZEN=false bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed
