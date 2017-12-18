module TestHelpers
  def self.last_log_entry(ledger)
    IO.readlines(ledger.session_store)[-1]
  end
end
