class EntriesController < ApplicationController                     # ApplicationController の継承
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  # set_entry メソッドの実行を、アクション前にやる。ただし、show,edit, update, destroyの時だけ

  # GET /entries
  # GET /entries.json
  def index                                                         # 一覧表示 アクション定義
    @entries = Entry.all                                            # Entryテーブルの全レコードを取得して、プロパティにセット
  end

  # GET /entries/1
  # GET /entries/1.json
  def show                                                          # 詳細表示 アクション定義 リソース取得が省略されている
  end

  # GET /entries/new
  def new                                                           # 新規登録 アクション定義
    @entry = Entry.new                                              # Entry オブジェクトの新規作成
  end

  # GET /entries/1/edit
  def edit                                                          # 編集表示 アクション定義 リソース取得が省略されている
  end

  # POST /entries
  # POST /entries.json
  def create                                                                          # 新規登録実行アクション定義
    @entry = Entry.new(entry_params)
    # entry_params メソッドでパラメータを受け取ってentryオブジェクトを作成

    respond_to do |format|                                                            # respond_to メソッドの呼び出し
      if @entry.save                                                                  # オブジェクトの保存がOKなら
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        # フォーマットがhtml なら詳細画面へのリダイレクト、notice 引数 文言を表示
        format.json { render :show, status: :created, location: @entry }
        # フォーマットがjsonなら、showアクションをレンダリング、HTTPステータスにcreated, Locationヘッダに、詳細画面のURLを
      else                                                                            # オブジェクトの保存がNGなら
        format.html { render :new }
        # フォーマットがhtmlなら再度新規登録画面の描画
        format.json { render json: @entry.errors, status: :unprocessable_entity }
        # フォーマットがjsonなら、エラーの内容をJSON出力、HTTPステータスをUnprocessable Entityを返す
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|            # respond_to メソッドでレスポンス内容を生成
      if @entry.update(entry_params)  # update メソッドに、entry_params メソッドの戻り値を渡す
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        # フォーマットがhtmlなら詳細画面へリダイレクト。成功の文言表示
        format.json { render :show, status: :ok, location: @entry }
        # フォーマットがjsonならshowアクションをレンダリング。HTTPステータスはOK。ロケーションヘッダに詳細画面
      else
        format.html { render :edit }
        # フォーマットがhtmlなら再度編集画面の描画
        format.json { render json: @entry.errors, status: :unprocessable_entity }
        # フォーマットがjsonなら、エラーの内容をJSON出力、HTTPステータスをUnprocessable Entityを返す
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy               # 削除アクション
    @entry.destroy          # 削除実行
    respond_to do |format|  # respond_to メソッドでレスポンス内容を生成
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      # フォーマットがhtmlなら一覧画面へリダイレクト。成功の文言表示
      format.json { head :no_content }
      # フォーマットがjsonなら、エno content (204) ステータスコード
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry # アクション実行前に呼び出される。 id指定でentryを取得してインスタンス変数にセット
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params # パラメータ取得メソッド。StrongParameter　ホワイトリスト形式
      params.require(:entry).permit(:title, :body) # title とbody だけの抽出
    end
end
