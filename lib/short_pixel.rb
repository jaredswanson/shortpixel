# frozen_string_literal: true

require_relative "short_pixel/version"

module ShortPixel
  autoload :Client, 'short_pixel/client'
  autoload :Error, 'short_pixel/error'
  autoload :Object, 'short_pixel/object'
  autoload :Resource, 'short_pixel/resource'

  autoload :Reducer, 'short_pixel/objects/reducer'
  autoload :PostReducer, 'short_pixel/objects/post_reducer'

  autoload :ReducerResource, 'short_pixel/resources/reducer'
  autoload :PostReducerResource, 'short_pixel/resources/post_reducer'
end
