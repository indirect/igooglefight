class Default < Thor

  desc "deploy", "git push, then SSH to arko.net, git pull, and restart unicorn"
  def deploy
    $stdout.sync = true
    push = %{git push}
    puts push; system push

    commands = [
      "cd /home/arko.net/domains/igooglefight.com/web/igooglefight",
      "git clean -f",
      "git pull",
      "touch tmp/restart.txt"
    ]
    remote_pull = %{ssh arko "#{commands.join(" && ")}"}
    puts remote_pull; system remote_pull
  end

  desc "bundle", "ssh to arko.net and run bundle install"
  def bundle
    $stdout.sync = true
    commands = [
      "cd /home/arko.net/domains/igooglefight.com/web/igooglefight",
      "~/.gem/ruby/1.8/bin/bundle install"
    ]
    bundle = %{ssh arko "#{commands.join(" && ")}"}
    puts bundle; system bundle
  end
end
