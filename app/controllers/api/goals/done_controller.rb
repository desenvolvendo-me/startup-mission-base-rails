module Api
  module Goals
    class DoneController < ApiController
      before_action :set_goal,
                    only: %i[index show]

      def index
        @goal.done!
      end

      def show
        @goal.done!
      end

      def many
        @goals = Goal.where(id: params[:done][:goal_ids])
                     .update(status: :done)
      end

      private

      def set_goal
        @goal = Goal.find(params[:goal_id])
      end
    end
  end
end
