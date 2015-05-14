require "thor"

class WpdCLI < Thor
    include Thor::Actions

    def self.source_root
        File.expand_path("../templates",__FILE__)
    end

    desc "init", "Initialises the WordPress project"
    def init

        # Runs `cap install` to setup Capistrano base
        say "wp-deploy: Setting up Capistrano", :green
        puts `bundle exec cap install`
        remove_file("Capfile")

        # Create base WordPress/wp-deploy files
        say "wp-deploy: Creating WordPress files", :green
        directory "."
    end
end