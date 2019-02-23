
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ready_boot_dash/version"

Gem::Specification.new do |spec|
  spec.name          = "ready_boot_dash"
  spec.version       = ReadyBootDash::VERSION
  spec.authors       = ["Adham Kurniawan"]
  spec.email         = ["adhamkurniawan29@gmail.com"]

  spec.summary       = "ReadyBootDash is NEEAD Nice Easy Elegant Admin Dashboard based on Bootstrap 4 Framework"
  spec.homepage      = "https://github.com/adhamkurniawan29/ready_boot_dash"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "jquery-validation-rails", "~> 1.19"
end