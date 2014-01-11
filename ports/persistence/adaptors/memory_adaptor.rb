require 'dumb_delegator'
module Adaptors
  class MemoryAdaptor < DumbDelegator
    attr_accessor :collection

    def collection
      @collection ||= {}
    end

    def create!(document)
      id = document[:id]

      raise 'Please provide the id' unless id
      push(id, document)
    end

    def find(id)
      collection[id]
    end

  private

    def push(id, attributes)
      self.new(attributes).tap do |doc|
        collection.merge!({ id => doc })
      end
    end
  end
end
