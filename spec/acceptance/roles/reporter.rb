module TestUser::Reporter
  def report(duration, description)
    Timebacus::ReportActivity.new(duration, description).execute
  end
end
