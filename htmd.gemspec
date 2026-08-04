require_relative "lib/htmd/version"

Gem::Specification.new do |spec|
  spec.name = "htmd"
  spec.version = Htmd::VERSION
  spec.authors = ["Oren Mittman"]
  spec.email = ["nihil2501@gmail.com"]

  spec.summary = "Convert markdown to HTML and open it."
  spec.description = "Reads a markdown file, converts it to HTML with Commonmarker, writes it to a tempfile, and opens it with the macOS `open` command."
  spec.homepage = "https://github.com/nihil2501/htmd"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["source_code_uri"] = "https://github.com/nihil2501/htmd"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .ruby-version])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "commonmarker", "~> 2.9"
end
