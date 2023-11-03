require 'sinatra/base'
require 'mongoid'
require_relative 'models/task'

Mongoid.load!('config/mongoid.yml', :development)

class RMApp < Sinatra::Base
    # Index (Read all tasks)
    get '/tasks' do
        Task.all.to_json
    end

    # Create (Save new task)
    post '/tasks' do
        task = Task.create!(params[:task])
        task.to_json
    end

    # Delete (Remove a task)
    get '/tasks/:id' do
        task = Task.find(params[:id])
        task.to_json
    end

    # Health check
    get '/health' do
        [200, 'Healthy']
    end
end

# Run the app
RMApp.run! if $PROGRAM_NAME == __FILE__

  