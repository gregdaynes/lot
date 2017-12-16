class Message
  attr_reader :session_id, :player_id, :timestamp, :payload, :event_ref

  def initialize(session_id, player_id, timestamp, payload, event_ref)
    @session_id = session_id
    @player_id = player_id
    @timestamp = timestamp
    @payload = payload
    @event_ref = event_ref
  end

  def to_s
    "#{@session_id}\t#{@player_id}\t#{@timestamp}\t#{@payload}\t#{@event_ref}"
  end

  def digest
    Digest::SHA256.digest to_s
  end
end
