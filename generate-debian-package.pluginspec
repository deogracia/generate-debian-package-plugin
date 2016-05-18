Jenkins::Plugin::Specification.new do |plugin|
  plugin.name = "generate-debian-package"
  plugin.display_name = "Generate Debian Package Plugin"
  plugin.version = '0.0.1'
  plugin.description = 'Another Debian package generator'

  # You should create a wiki-page for your plugin when you publish it, see
  # https://wiki.jenkins-ci.org/display/JENKINS/Hosting+Plugins#HostingPlugins-AddingaWikipage
  # This line makes sure it's listed in your POM.
  #plugin.url = 'https://wiki.jenkins-ci.org/display/JENKINS/Generate+Debian+Package+Plugin'

  # The first argument is your user name for jenkins-ci.org.
  plugin.developed_by "deogracia", "Lionel Félicité"

  # This specifies where your code is hosted.
  # Alternatives include:
  #  :github => 'myuser/generate-debian-package-plugin' (without myuser it defaults to jenkinsci)
  #  :git => 'git://repo.or.cz/generate-debian-package-plugin.git'
  #  :svn => 'https://svn.jenkins-ci.org/trunk/hudson/plugins/generate-debian-package-plugin'
  plugin.uses_repository :git => git@git.clever-age.net:lfelicite/generate-debian-package-plugin.git

  # This is a required dependency for every ruby plugin.
  plugin.depends_on 'ruby-runtime', '0.10'

  # This is a sample dependency for a Jenkins plugin, 'git'.
  #plugin.depends_on 'git', '1.1.11'
end
