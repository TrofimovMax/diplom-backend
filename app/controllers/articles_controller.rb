class ArticlesController < ActionController::API

  def index
    render json: [{
                    title: 'Master Max',
                    description: 'My First Article'
                  }]
  end

  def show
    render json: { title: 'Master Max in Details', description: 'My First Article on show view' }
  end


end
