# encoding: utf-8

module OpenCode
  class API < Sinatra::Base
    helpers Sinatra::JSON

    configure do
      set :json_encoder, MultiJson
    end

    configure :development do
      register Sinatra::Reloader
    end

    helpers do
      def bail(error_message=nil)
        halt 404, { :error => error_message || "Oops." }.to_json
      end
    end

    get "/" do
      json :endpoints => ["/editions", "/editions/:id"]
    end

    get "/editions" do
      @editions = Edition.all
      json @editions.map(&:as_json)
    end

    get "/editions/:id" do
      @edition = Edition.find(params[:id].to_i)
      bail "Unknown edition" unless @edition
      json @edition.as_json.merge(:talks => @edition.talks.map(&:as_json))
    end

    get "/editions/:edition_id/talks/:id" do
      @talk = Talk.find(params[:id])
      bail "Unknown talk" unless @talk and @talk.edition_id == params[:edition_id].to_i
      json @talk.as_json
    end
  end
end
