# The Reducer API shrinks images based on a publically available url. In contrast, the Post Reducer API by uploading the images.
module ShortPixel
  class ReducerResource < Resource
    def call(**params)
      response = post_request('reducer.php', params)
      body = extract_body(response)
      Reducer.new(body)
    end
  end
end
