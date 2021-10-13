# The Post Reducer API shrinks images you upload. Alternatively, the Reducer API shrinks images from a publically available url.
module ShortPixel
  class PostReducerResource < Resource
    def call(**params)
      raise "PostReducer not built yet. Reach out if this is a feature you need."
      # response = post_request('post-reducer.php')
      # body = extract_body(response)
      # PostReducer.new(body)
    end
  end
end
