require 'ostruct'

module ShortPixel
  class Object < OpenStruct
    def initialize(attributes)
      super to_ostruct(attributes)
    end

    def to_ostruct(obj)
      if obj.is_a?(Hash)
        OpenStruct.new(obj.map { |key, val| [key, to_ostruct(val)] }.to_h)
      elsif obj.is_a?(Array)
        results = obj.map { |o| to_ostruct(o) }
        OpenStruct.new({ results: results })
      else
        obj
      end
    end
  end
end
