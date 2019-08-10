class PbuilderWrapper
  attr_accessor :use_sudo
  attr_accessor :pbuilder_path

  def initialize(attrs = {} )
    default_values = {
                        "use_sudo"      => true,
                        "pbuilder_path" => '/usr/sbin/pbuilder',
                      }

    attrs.merge!(default_values)

    @use_sudo      = attrs["use_sudo"]
    @pbuilber_path = attrs["pbuilder_path"]
  end

  def create(attrs = {} )
    default_values = {
      "distribution" => 'stable',
      "mirror"       => 'http://httpredir.debian.org/',
    }

    attrs.merge!(default_values)

    execute(attrs)

  end

  private

  def execute(action = '_default_', attrs = {})

    command = @pbuilber_path + "--distribution " + attrs["distribution"] + " --mirror " + attrs["mirror"]

    command = "sudo " + command if @use_sudo

    system(command)
  end

end
