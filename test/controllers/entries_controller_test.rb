require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do # セットアップ
    @entry = entries(:one) # fixture の1つ目を取得
  end

  test "should get index" do    # index アクションのテスト
    get :index                  # http get でindexアクションにアクセス
    assert_response :success    # response がsuccess かどうか
    assert_not_nil assigns(:entries) # entries がnil じゃないかどうか
  end

  test "should get new" do      # new アクションのテスト
    get :new                    # http get で new アクションにアクセス
    assert_response :success    # response がsuccessかどうか
  end

  test "should create entry" do # create アクションのテスト
    assert_difference('Entry.count') do # Entryデータの数が異なっているかどうか
      post :create, entry: { body: @entry.body, title: @entry.title }
      # http postで createアクションにアクセス bodyとtitle パラメータを指定
    end

    assert_redirected_to entry_path(assigns(:entry))
    # responseがリダイレクトで、登録したデータのURIが返ってきているかどうか
  end

  test "should show entry" do   # show アクションのテスト
    get :show, id: @entry       # http get で、showアクションにアクセス。idパラメータを指定
    assert_response :success    # response がsuccessかどうか
  end

  test "should get edit" do     # edit アクションのテスト
    get :edit, id: @entry       # http get で、showアクションにアクセス。idパラメータを指定
    assert_response :success    # response がsuccessかどうか
  end

  test "should update entry" do # update アクションのテスト
    patch :update, id: @entry, entry: { body: @entry.body, title: @entry.title }
    # http patch でupdateアクションにアクセス。 bodyパラメータとtitle パラメータを指定
    assert_redirected_to entry_path(assigns(:entry))
    # responseがリダイレクトで、登録したデータのURIが返ってきているかどうか
  end

  test "should destroy entry" do # destroyアクションのテスト
    assert_difference('Entry.count', -1) do # Entry データの数が-1 になっているかどうか
      delete :destroy, id: @entry # http delete で destroy アクションにアクセス。idパラメータを指定
    end

    assert_redirected_to entries_path
    # responseがリダイレクトで、一覧URIが返ってきているかどうか
  end
end
