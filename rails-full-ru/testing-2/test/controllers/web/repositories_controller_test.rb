# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should create repo' do
    repository_url = "https://github.com/example/example-repo"
    response_body = load_fixture('files/response.json')
    stub_request(:get, "https://api.github.com/repos/example/example-repo").
      with(
        headers: {
        'Accept'=>'application/vnd.github.v3+json',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type'=>'application/json',
        'User-Agent'=>'Octokit Ruby Gem 5.6.1'
        }).
      to_return(status: 200, body: response_body, headers: {})
    
    post repositories_path, params: {repository: {link: repository_url} }
    assert_response :success
    assert_equal "application/json; charset=utf-8", @response.content_type

    json_response = JSON.parse(@response.body)
    assert_equal 0, json_response['watchers_count']
    assert_equal "default_branch", json_response['default_branch']
  end
end
