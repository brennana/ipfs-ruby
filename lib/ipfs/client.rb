require "ipfs/command"

module IPFS
  class Client
    DEFAULT_HOST = "http://localhost".freeze
    DEFAULT_PORT = 5001
    API_VERSION = "v0".freeze

    attr_reader :host, :port

    def self.default
      new(host: DEFAULT_HOST, port: DEFAULT_PORT)
    end

    def initialize(host:, port:)
      @host = host
      @port = port
    end

    def api_url
      "#{host}:#{port}/api/#{API_VERSION}"
    end

    def add(file_or_io, options = {})
      Command::Add.call self, file_or_io, options
    end

    def ls(node)
      Command::LS.call self, node
    end

    def cat(node)
      Command::Cat.call self, node
    end

    def name_publish(node, options = {})
      Command::Name::Publish.call self, node, options
    end

    def name_resolve(peer = nil, options = {})
      Command::Name::Resolve.call self, peer, options
    end
  end
end
