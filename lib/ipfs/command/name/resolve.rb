module IPFS
  class Command
    module Name
      class Resolve < Command
        def call(peer, options = {})
          options[:arg] = peer unless peer.nil?
          JSON.parse get(options).to_s
        end
      end
    end
  end
end
