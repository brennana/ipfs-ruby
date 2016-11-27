Dir["./lib/ipfs/command/**/*.rb"].each do |f|
  require f
end

module IPFS
  class Command
    def self.call(client, *args)
      new(client.api_url).call *args
    end

    def initialize(url_base)
      @url_base = url_base
    end

    def call(*)
    end

    protected

    def get(options = {})
      HTTP.get(api_url, params: options)
    end

    def post_file(file_or_io, options = {})
      HTTP.post(api_url, params: options, form: { file: HTTP::FormData::File.new(file_or_io) })
    end

    def api_url
      "#{@url_base}/#{command_path}"
    end

    private

    def command_path
      self.class.name.partition("Command::")[2].downcase.gsub("::", "/")
    end

    def normalize_options(options)
      options.map do |k, v|
        [k.to_s.tr("_", "-").to_sym, v]
      end.to_h
    end
  end
end
