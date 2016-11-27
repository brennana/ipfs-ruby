require "ipfs/command/ls"
require "ipfs/command/cat"

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

    def api_url
      "#{@url_base}/#{self.class.name}"
    end

    private

    def normalize_options(options)
      options.map do |k, v|
        [k.to_s.tr("_", "-").to_sym, v]
      end.to_h
    end
  end
end
