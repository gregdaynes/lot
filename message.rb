class Message
  def initialize(*args)
    @message_arguments = args
  end

  def to_s
    @message_arguments.join("\t").to_s
  end

  def digest
    Digest::SHA256.digest to_s
  end
end
