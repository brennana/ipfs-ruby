require "ipfs/content/node"

module IPFS
  class Command
    class LS < Command
      def call(node)
        parse get(arg: node, stream_channels: true)
      end

      private

      def parse(response)
        Content::Node.parse_array JSON.parse(response)["Objects"]
      end
    end
  end
end
