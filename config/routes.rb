Rails.application.routes.draw do
  api_version(module: 'V1',
              header: {
              name: 'Accept',
              value: 'application/vnd.apprentice-demo-project-server.com; version=1' },
              defaults: { format: :json }) do
    resources :songs, only: [:index]
  end
end
