module IPFS
  class Command
    module Name
      class Publish < Command
        def call(node, options = {})
          JSON.parse get(options.merge(arg: node)).to_s
        end
      end
    end
  end
end
