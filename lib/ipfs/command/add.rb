module IPFS
  class Command
    class Add < Command
      def call(file_or_io, options = {})
        parse post_file(file_or_io, options)
      end

      private

      def parse(response)
        JSON.parse(response.to_s)["Hash"]
      end
    end
  end
end
