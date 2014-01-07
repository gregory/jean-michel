class ApplicationController < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/../../public'
  set :views, [(File.dirname(__FILE__)+ '/../views'), (File.dirname(__FILE__) + '/../../public') ]
  set :assets_css_compressor, :sass
  set :assets_js_compressor, :uglifier
  set :assets_prefix, %w{app/assets}
  set :slim, layout: :"layouts/application", pretty: true, disable_escape: true

  not_found{ slim :'404' }
  error    { slim :'500' }

  configure do
    I18n.enforce_available_locales = true
  end

  helpers do
    def find_template(views, name, engine, &block)
      views.each{ |v| super(v, name, engine, &block) }
    end
  end
  register Sinatra::AssetPipeline

  helpers ApplicationHelper

  get '/' do
    slim :index
  end
end
