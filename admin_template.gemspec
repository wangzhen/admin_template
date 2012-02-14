# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{admin_template}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Anthony Wang", "Rick Olson"]
  s.date = %q{2012-02-13}
  s.description = %q{This admin_template plugin provides a foundation for securely managing user.}
  s.email = %q{vwangzhen@gmail.com}
  #  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README", "Rakefile", "init.rb" ,
    "lib/admin_template.rb"]
  s.has_rdoc = true
#  s.homepage = %q{https://wangzhen@github.com/wangzhen/admin_template.git}
  s.homepage    =    'http://rubygems.org/gems/admin_template'
  s.rdoc_options = ["--main", "README.makdown"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{admin controller template }

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.8.6') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.1.0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.1.0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.1.0"])
  end
end
