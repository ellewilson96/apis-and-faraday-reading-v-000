class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = '11TR0GATVWADKTY34TC2ZOWPM1V3O1XMRG3OIJ3B55XHVK2K'
      req.params['client_secret'] = 'RKLE5QI2ZE3K2GOYJIRTT5XOTOA0FEALIPJQ3H4G0PBVUXGF'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
