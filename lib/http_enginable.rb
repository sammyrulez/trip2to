require "http_getter_engine"

module  HttpEnginable



  def engine=(val)
    @engine = val
  end

  def engine
   if @engine == NIL
      @engine = HttpGetterEngine.new
   end
    @engine
  end

end