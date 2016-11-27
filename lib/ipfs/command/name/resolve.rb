module IPFS
  class Command
    module Name
      class Resolve < Command
        def call(peer, options = {})
          options[:arg] = peer unless peer.nil?
          JSON.parse(get(options).to_s)["Path"]
        end
      end
    end
  end
end
