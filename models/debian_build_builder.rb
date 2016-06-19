# A single build step in the entire build process
class Debian_buildBuilder < Jenkins::Tasks::Builder

  display_name "Generate Debian package"

  attr_accessor :sign_package, :sign_package_int
  attr_accessor :use_pbuilder, :use_pbuilder_int
  attr_accessor :debian_directory_path, :target_distribution
  attr_accessor :output_directory_path

  # Invoked with the form parameters when this extension point
  # is created from a configuration screen.
  def initialize(attrs = {})
    @sign_package          = attrs["sign_package"]
    @sign_package_int      = @sign_package == true ? 1 : 0
    @debian_directory_path = attrs["debian_directory_path"]
    @target_distribution   = attrs["target_distribution"]
    @output_directory_path = attrs["output_directory_path"]
    @use_pbuilder          = attrs["use_pbuilder"]
    @use_pbuilder_int      = @use_pbuilder == true ? 1 : 0
  end

  ##
  # Runs before the build begins
  #
  # @param [Jenkins::Model::Build] build the build which will begin
  # @param [Jenkins::Model::Listener] listener the listener for this build.
  def prebuild(build, listener)
    # do any setup that needs to be done before this build runs.
    listener.info "#{display_name} : prebuild fn ^^"
  end

  ##
  # Runs the step over the given build and reports the progress to the listener.
  #
  # @param [Jenkins::Model::Build] build on which to run this step
  # @param [Jenkins::Launcher] launcher the launcher that can run code on the node running this build
  # @param [Jenkins::Model::Listener] listener the listener for this build.
  def perform(build, launcher, listener)
    # actually perform the build step


    listener.info "#{display_name} : Hello world ^^"
    listener.info "#{display_name} : ...."
    listener.info "#{display_name} : ...."
    listener.info "#{display_name} : sign_package          = #{@sign_package}"
    listener.info "#{display_name} : sign_package_int      = #{@sign_package_int}"
    listener.info "#{display_name} : debian_directory_path = #{@debian_directory_path}"
    listener.info "#{display_name} : target_distribution   = #{@target_distribution}"
    listener.info "#{display_name} : output_directory_path = #{@output_directory_path}"
    listener.info "#{display_name} : use_pbuilder          = #{@use_pbuilder}"
    listener.info "#{display_name} : use_pbuilder_int      = #{@use_pbuilder_int}"
    listener.info "#{display_name} : Bye :D"
  end

end
