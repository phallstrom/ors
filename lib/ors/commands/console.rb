module ORS::Commands
  class Console < Base
    def execute
      execute_command console_server,
                      %(source ~/.rvm/scripts/rvm),
                      %(cd #{deploy_directory}),
                      %(if [ -f script/rails ]; then bundle exec rails console #{environment}; else ./script/console #{environment}; fi),
                      :exec => true
    end

    def help
      puts <<-END
Usage: ./ors console [environment=production] [options]

=== Description
Replaces current process and runs rails console.

=== Options
--pretend    (or -p)   Don't execute anything, just show me what you're going to do
--no-gateway (or -ng)  Don't use a gateway (if you're inside the firewall)
      END
    end
  end
end
