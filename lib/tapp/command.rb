require 'thor'

module Tapp
  class Command < Thor
    desc 'grep [<git-grep-options>]', 'Print lines using tapp'
    def grep(*)
      system 'git', 'grep', '--word-regexp', '-e', 'tapp', *ARGV.drop(1)
    end

    desc 'remove [<git-grep-options>]', 'Remove tapp'
    def remove(*)
      paths = `git grep --word-regexp -e tapp --files-without-match #{ARGV.drop(1).join(' ')}`.split("\n")
      system 'sed', '--expression', 's/\b\.\?tapp\b\((.*)\|{.*}\)\?//g', '--in-place', *paths
    end
  end
end
