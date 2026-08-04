require "commonmarker"
require "tempfile"

require_relative "htmd/version"

module Htmd
  WRAPPER_HTML = File.read(File.expand_path("htmd/wrapper.html", __dir__))
  private_constant :WRAPPER_HTML

  class << self
    def run(file)
      file
      .then { read(it) }
      .then { convert(it) }
      .then { write(it) }
      .then { system_open(it) }
    end

    private

    def read(file)
      file.read
    end

    def convert(markdown)
      wrap_html(Commonmarker.to_html(markdown))
    end

    def wrap_html(body)
      WRAPPER_HTML.sub("<body></body>") { "<body>\n#{body}</body>" }
    end

    def write(html)
      Tempfile.create(%w[converted .html]).tap do |file|
        file.write(html)
        file.close
      end
    end

    def system_open(file)
      system("open", file.path)
    end
  end
end
