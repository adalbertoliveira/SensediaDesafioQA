module Trello

  class Cards
    include HTTParty    

    base_uri CONFIG_API['trello']['trello-api']

    def get_board(key, token)
      self.class.get("/members/me/boards?key=#{key}&token=#{token}",
        headers: {
            'Content-Type': 'application/json',
            'charset': 'UTF-8'
        }
    )
    end

    def get_lists(board, key, token)
      self.class.get("/boards/#{board}/lists?key=#{key}&token=#{token}",
        headers: {
            'Content-Type': 'application/json',
            'charset': 'UTF-8'
        }
    )
    end

    def post_card(key, token, body)
      self.class.post("/cards?key=#{key}&token=#{token}",
        body: body.to_json,
        headers: {
            'Content-Type': 'application/json',
            'charset': 'UTF-8'
        }
    )
    end

    def put_card(idCard, key, token, body)
      self.class.put("/cards/#{idCard}?key=#{key}&token=#{token}",
        body: body.to_json,
        headers: {
            'Content-Type': 'application/json',
            'charset': 'UTF-8'
        }
    )
    end

    def delete_card(idCard, key, token)
      self.class.delete("/cards/#{idCard}?key=#{key}&token=#{token}",
        headers: {
            'Content-Type': 'application/json',
            'charset': 'UTF-8'
        }
    )
    end

  end
end