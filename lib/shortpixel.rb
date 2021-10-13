# frozen_string_literal: true

require_relative "shortpixel/version"

module ShortPixel
  autoload :Client, 'shortpixel/client'
  autoload :Error, 'shortpixel/error'
  autoload :Object, 'shortpixel/object'
  autoload :Resource, 'shortpixel/resource'

  autoload :Reducer, 'shortpixel/objects/reducer'
  autoload :PostReducer, 'shortpixel/objects/post_reducer'

  autoload :ReducerResource, 'shortpixel/resources/reducer'
  autoload :PostReducerResource, 'shortpixel/resources/post_reducer'
end
