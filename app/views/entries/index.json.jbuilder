json.array!(@entries) do |entry| # 配列出力
  json.extract! entry, :id, :title, :body # id, title, body の出力
  json.url entry_url(entry, format: :json) # entryオブジェクトから URLの出力
end
