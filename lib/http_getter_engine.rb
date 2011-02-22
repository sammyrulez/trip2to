require 'httparty'

class HttpGetterEngine

  def get(url)
      response =  HTTParty.get(url)
      puts response.body, response.code, response.message, response.headers.inspect
      if   response.code != 200
         raise "Response #{response.code}"
      else
        return response.body
      end
  end

end