require_relative 'message'

class Ledger
  attr_reader :session, :session_store

  def initialize(session, location = nil)
    @session = session
    @session_store = create_session_store(location)
  end

  def record_event(player, payload, event_ref = nil)
    message = Message.new(@session.uuid,
                          player.handle,
                          timestamp,
                          payload,
                          event_ref)

    write_session_store(message.to_s)

    { hash: message.digest, message: message }
  end

  private

  def create_session_store(location)
    return location if location && File.file?(location)

    File.new("./logs/#{@session.uuid}.txt", "w")
  end

  def timestamp
    Time.now.utc.to_f
  end

  def write_session_store(message)
    output = File.open(session_store, "a")
    output << "\n#{message}"
    output.close
  end
end
