module ShortPixel
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def post_request(url, body)
      client.connection.post(url, body.merge(key: client.api_key))
    end

    private

    def extract_body(response)
      body = transform_keys(JSON.parse(response.body))
      handle_response(body)
    end

    def transform_keys(obj)
      return obj.collect { |item| underscore_keys(item) } if obj.is_a? Array

      return underscore_keys(obj) if obj.is_a? Hash

      obj
    end

    def underscore_keys(hash)
      hash.deep_transform_keys(&:underscore)
    end

    def handle_response(body)
      responses = body.collect { |png_response| png_response['status'] }.uniq
      responses.each { |response| check_for_errors(response) }
      body
    end

    def check_for_errors(response)
      code = response['code'].to_i
      message = response['message']

      case code
      when -102
        explanation = "#{message}; Invalid URL. Please make sure the URL is properly urlencoded and points to a valid image file."
        raise Error, explanation
      when -105
        explanation = "#{message}; URL is missing for the call."
        raise Error, explanation
      when -106
        explanation = "#{message}; URL is inaccessible from our server(s) due to access restrictions."
        raise Error, explanation
      when -107
        explanation = "#{message}; Too many URLs in a POST, maximum allowed has been exceeded."
        raise Error, explanation
      when -108
        explanation = "#{message}; Invalid user used for optimizing images from a particular domain."
        raise Error, explanation
      when -109
        explanation = "#{message}; The uploaded files are not present. If the urllist is present instead, the message asks to use the Reducer API URL. The error will also be returned in case neither file_paths nor file_urls parameter is present"
        raise Error, explanation
      when -110
        explanation = "#{message}; Upload error"
        raise Error, explanation
      when -111
        explanation = "#{message}; File too big"
        raise Error, explanation
      when -112
        explanation = "#{message}; Generic server error (details in the message field) "
        raise Error, explanation
      when -113
        explanation = "#{message}; Too many inaccessible URLs from the same domain, please check accessibility and try again."
        raise Error, explanation
      when -115
        explanation = "#{message}; Uploaded files are missing."
        raise Error, explanation
      when -201
        explanation = "#{message}; Invalid image format."
        raise Error, explanation
      when -202
        explanation = "#{message}; Invalid image or unsupported image format."
        raise Error, explanation
      when -203
        explanation = "#{message}; Could not download file."
        raise Error, explanation
      when -204
        explanation = "#{message}; The file couldn't be optimized, possibly timedout."
        raise Error, explanation
      when -205
        explanation = "#{message}; The file's width and/or height is too big."
        raise Error, explanation
      when -301
        explanation = "#{message}; The file is larger than the remaining quota."
        raise Error, explanation
      when -302
        explanation = "#{message}; The file is no longer available."
        raise Error, explanation
      when -303
        explanation = "#{message}; Internal API error: the file was not written on disk."
        raise Error, explanation
      when -304
        explanation = "#{message}; Internal API Error - could not create user upload space. Please contact support if you encounter this error."
        raise Error, explanation
      when -305
        explanation = "#{message}; Internal API error: Unknown, details usually in message."
        raise Error, explanation
      when -401
        explanation = "#{message}; Invalid API key. Please check that the API key is the one provided to you."
        raise Error, explanation
      when -403
        explanation = "#{message}; Quota exceeded. You need to subscribe to a larger plan or to buy an additional one time package to increase your quota."
        raise Error, explanation
      when -404
        explanation = "#{message}; The maximum number of URLs in the optimization queue reached. Please try again in a minute."
        raise Error, explanation
      when -500
        explanation = "#{message}; API is in maintenance mode. Please come back later."
        raise Error, explanation
      end
      false # No Errors if this point reached without raised error
    end
  end
end
