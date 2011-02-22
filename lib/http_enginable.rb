module  HttpEnginable
  @engine = HttpGetterEngine.new

  def engine=(val)
    @engine = val
  end
end