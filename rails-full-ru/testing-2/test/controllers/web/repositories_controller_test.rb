# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should create repo' do
    attrs = {
      link: 'https://github.com/railsware/js-routes'
    }
    response = load_fixture('files/response.json')

    stub_request(:get, 'https://api.github.com/repos/railsware/js-routes')
      .to_return(
        status: 200,
        body: response,
        headers: { 'Content-Type' => 'application/json' }
      )

    post repositories_url, params: { repository: attrs }

    repository = Repository.find_by attrs

    assert { repository }
    assert { repository.description.present? }
    assert_redirected_to repository_url(repository)
  end
end
