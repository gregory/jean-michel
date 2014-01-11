require 'active_support/inflector'
require 'forwardable'
class PlayerRepository
  class<<self
    extend Forwardable
    attr_accessor :strategy, :adaptor
    attr_reader :base_document
    delegate [:foo, :size, :find, :collection] => :adaptor

    def repository_for(document)
      clean_cached_variables!
      @base_document = document
    end

    def new
      adaptor.new
    end

    def strategy=(strategy)
      raise ArgumentError.new("Please provide a symbol. ex: :memory, :mongo, :redis") unless strategy.is_a?(Symbol)

      clean_cached_variables!
      @strategy = strategy
    end

    def adaptor
      return @adaptor if @adaptor
      raise ArgumentError.new("Please set a strategy first") unless strategy
      raise ArgumentError.new("Please specify a repository") unless base_document

      adaptor_name = ActiveSupport::Inflector.camelize(strategy.to_s)
      @adaptor ||= "Adaptors::#{adaptor_name}Adaptor".constantize.new(base_document)
    end

  private

    def clean_cached_variables!
      @adaptor = nil
    end
  end

  repository_for PlayerDocument

  #Repository interface
  def self.player_created(attr)
    adaptor.create!(attr)
  end
end
