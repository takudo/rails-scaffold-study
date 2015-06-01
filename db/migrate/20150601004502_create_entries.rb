class CreateEntries < ActiveRecord::Migration # ActiveRecord モジュール　Migration クラスの継承
  def change                                  # change メソッド宣言
    create_table :entries do |t|              # create_table メソッド呼び出し　entries テーブルを作成　第一引数がテーブル名、第二引数がブロック ブロックがテーブル定義オブジェクトを受け取っている
                                              # activerecord-4.2.1/lib/active_record/connection_adapters/abstract/schema_statements.rb:191
      t.string :title                         # column メソッドの呼び出し。string のtitle フィールド
      t.text :body                            # column メソッドの呼び出し。string のtitle フィールド

      t.timestamps null: false                # timestampls メソッドの呼び出し。内部でupdated_at, created_at フィールドのcolumメソッドを呼び出している
    end
  end
end
