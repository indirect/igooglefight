class Deploy < Thor::Group
  desc "git push, then SSH to arko.net, git pull, and restart unicorn"
  def deploy
    $stdout.sync = true
    system %{git push}
    commands = [
      "cd /home/arko.net/domains/igf.arko.net/web/igooglefight",
      "git clean -f",
      "git pull",
      "touch tmp/restart.txt"
    ]
    system %{ssh arko "#{commands.join(" && ")}}
  end
end
