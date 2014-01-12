require 'dumb_delegator'
module Adaptors
  class MemoryAdaptor < DumbDelegator
    class MemoryRelation
      attr_reader :collection

      def initialize(collection={})
        @collection = collection
      end

      def where(conditions={})
        conditions.each do |(k,v)|
          @collection = collection.keep_if{ |_, doc| doc[k] == v }
        end
        self
      end

      def first
        collection.values.first
      end

      def last
        collection.values.last
      end

      def all
        collection.values
      end

      def find(id)
        collection[id]
      end
    end

    attr_accessor :collection

    def collection
      @collection ||= {}
    end

    def create!(document)
      push(document[:uuid], document)
    end

    def where(conditions={})
      MemoryRelation.new(collection).where(conditions)
    end

    def find(id)
      MemoryRelation.new(collection).find(id)
    end

    def first
      MemoryRelation.new(collection).first
    end

    def last
      MemoryRelation.new(collection).last
    end

    def all
      MemoryRelation.new(collection).all
    end

  private

    def push(id, attributes)
      self.new(attributes).tap do |doc|
        collection.merge!({ id => doc })
      end
    end
  end
end
