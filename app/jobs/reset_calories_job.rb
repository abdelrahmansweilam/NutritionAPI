class ResetCaloriesJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    user.update(remaining_calories: user.daily_calories)
    ResetCaloriesJob.set(wait_until: Date.midnight).perform_later(user)
  end
end
