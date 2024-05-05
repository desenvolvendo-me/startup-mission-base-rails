module Manager
  class GoalsController < InternalController

    def index
      @q = Goal.ransack(params[:q])
      @goals = @q.result(distinct: true)
      @goals = @goals.order('created_at').page(params[:page]).per(4)
    end

    private

    def goal_params
      params.require(:goal).permit(:name,
                                   :description, :status,
                                   tasks_attributes:
                                     %i[id name description status _destroy])
    end

  end
end
