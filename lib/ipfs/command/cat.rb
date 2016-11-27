module IPFS
  class Command
    class Cat < Command
      def call(node)
        get(arg: node, stream_channels: true).to_s
      end
    end
  end
end
