$:.unshift('/Library/RubyMotion/lib')
require 'motion/project/template/ios'
require 'bundler'
require 'bubble-wrap'
require 'motion-support'

$:.unshift("./lib/")
require 'motion_panel'

Motion::Project::App.setup do |app|
end

task :spec do
  App.config.spec_mode = true
  spec_files = App.config.spec_files
  App.config.instance_variable_set("@spec_files", spec_files)
  Rake::Task['simulator'].invoke
end
