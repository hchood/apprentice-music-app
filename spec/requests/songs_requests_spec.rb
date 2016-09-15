# workflow for creating an API endpoint:
# 1. write my request test - happy path (assuming all goes well)
# - things to test: 1. correct status code; 2. correct JSON; sometimes 3. correct headers
# 2. run it & watch it fail
# - `rspec` for whole test suite, or `rspec spec/requests/songs_requests_spec.rb:16`
# 3. progressively fix errors, writing code to get past each one
# 4. at some point, we'll find we might need to create a model. At that point, we write model tests (`spec/models/my_model_spec.rb`) & get them passing
#  - model tests include: tests for associations, validations, & class & instance methods (public).
# 5. come back to our request test and keep coding to make it pass.
# 6. add tests for error cases (user unauthenticated, didn't provide required info when creating a song)

require 'rails_helper'

describe 'Songs endpoints' do
  describe 'GET /songs' do
    it 'returns JSON for songs' do
      # create a few songs - FactoryGirl.
      songs = create_list(:song, 3) # 3 times: Song.create(name: 'Where the ...', duration: 360, album_title: 'Joshua Tree')

      # make a request to GET /songs - new syntax is: `get(url, params: {}, headers: {})` (post, patch)
      get(
        songs_url,
        {},
        { 'Accept' => 'application/vnd.apprentice-demo-project-server.com; version=1', 'Content-Type' => 'application/json' }
      )

      # test that the response we get back includes JSON for the songs we made - json_spec helper methods:
      # - have_json_size, have_json_path, have_http_status
      expect(response).to have_http_status :ok # same as 200
      expect(response.body).to have_json_size(3).at_path('songs') # { "songs": [...] }
    end

    # it 'fails with invalid attributes'
  end

  # describe 'POST /songs' do
  #
  # end
end
