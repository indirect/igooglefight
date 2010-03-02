class Deploy < Thor::Group
  desc "git push, then SSH to arko.net, git pull, and restart unicorn"
  def deploy
    $stdout.sync = true
    push = %{git push}
    puts push; system push

    commands = [
      "cd /home/arko.net/domains/igf.arko.net/web/igooglefight",
      "git clean -f",
      "git pull",
      "touch tmp/restart.txt"
    ]
    remote_pull = %{ssh arko "#{commands.join(" && ")}"}
    puts remote_pull; system remote_pull
  end

class Bundle < Thor::Group
  desc "ssh to arko.net and run bundle install"
  def bundle
    $stdout.sync = true
    commands = [
      "cd /home/arko.net/domains/igf.arko.net/web/igooglefight",
      "~/.gem/ruby/1.8/bin/bundle install"
    ]
    bundle = %{ssh arko "#{commands.join(" && ")}"}
    puts bundle; bundle
  end
end
