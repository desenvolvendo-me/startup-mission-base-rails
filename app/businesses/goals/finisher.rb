module Goals
  class Finisher < BusinessApplication
    def initialize(goal)
      @goal = goal
    end

    def call
      return unless @goal.done?

      @goal.tasks.update(status: :done)
    end
  end
end
