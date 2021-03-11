# frozen_string_literal: true

require 'httparty'
base_uri = 'https://jsonplaceholder.typicode.com'

describe 'Tests the /posts endpoint' do
    it 'Retrieves all posts' do
        expected_response = {
            "userId": 1,
            "id": 1,
            "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
            "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
        }
        response = HTTParty.get("#{base_uri}/posts")
        expect(response.code).to eq(200)
        expect(JSON.parse(response.body, symbolize_names: true)[0]).to eq(expected_response)
    end

    it 'Retrieves a single post' do
        expected_response = {
            "userId": 1,
            "id": 1,
            "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
            "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
        }
        response = HTTParty.get("#{base_uri}/posts/1")
        expect(response.code).to eq(200)
        expect(JSON.parse(response.body, symbolize_names: true)).to eq(expected_response)
    end

    it 'Creates a new post' do
        full_url = "#{base_uri}/posts"
        request_body = {
            "userId": 1,
            "id": 101,
            "title": "Example",
            "body": "This is just a sample test"
        }
        headers = {
            "Content-type": "application/json; charset=UTF-8",
        }
        response = HTTParty.post(full_url, {"headers": headers, "body": JSON.dump(request_body)})
        expect(response.code).to eq(201)
        expect(JSON.parse(response.body, symbolize_names: true)).to eq(request_body)
    end
end