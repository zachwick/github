# encoding: utf-8

require_relative '../api'

module Github
    # These API methods return metadata about popular open source license.
    class Client::Licenses < API

        # List all licenses
        #
        # @example
        #   github = Github.new
        #   github.licenses.list
        # @api public
        def list(*args)
            arguments(args) do end
            params = arguments.params

            response = get_request("/licenses", params)

            return response
        end
        alias :all :list

        # Get an individual license
        #
        # @example
        #   github = Github.new
        #   github.licenses.get 'key'
        #   github.licenses.get key: 'key'
        #   github.licenses(key: 'key')
        #
        def get(*args)
            arguments(args, required: [:key])

            get_request("/licenses/#{arguments.key}", arguments.params)
        end
        alias :find :get
    end
end