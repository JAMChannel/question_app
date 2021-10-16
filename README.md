- users
  - nickname:string
  - email:string
  - encrypted_password:string
  - admin:boolean




## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index: true|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|admin|boolean|default: false|


### Association
has_one_attached :image

## questionsテーブル
- questions
  - title:string
  - content:text
  - solved:boolean
  - user:references


|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|null: false|
|solved|boolean|default: true|
|user|references|null: false, foreign_key: true|




## commentsテーブル
- comments
  - comment:text
  - user:references
  - question:references

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|references|null: false, foreign_key: true, optional: true|
|question|references|null: false, foreign_key: true|


| やりたいこと | HTTPメソッド | エンドポイント | コントローラ#アクション |
| ---- | ---- | ---- | ---- |
| ユーザー登録画面を表示する | GET | /users/new | users#new |
| ユーザー登録をする |POST | /users | users#create |
| ログイン画面を表示する | GET | /login | sessions#new |
| ログインする | POST | /login | sessions#create |
| 質問一覧を表示する（全て）| GET | /questions | questions#index |
| 質問一覧を表示する（未解決）| GET | /questions/unsolved | questions#unsolved |
| 質問一覧を表示する（解決済み）| GET | /questions/solved | questions#solved |
| 質問投稿ページを表示する | GET | /questions/new | questions#new |
| 質問投稿をする | POST | /questions | questions#create |
| 質問詳細を表示する | GET | /questions/:id | questions#show |
| 質問編集ページを表示する | GET | /questions/:id/edit | questions#edit |
| 質問を削除する | DELETE | /questions/:id | questions#destroy |
| 回答する | POST | /questions/:id/answers | answers#create |
| ユーザー一覧を表示する | GET | /users | users#index |
| 管理画面用のログインページを表示する | GET | /admin/login | admin/sessions#new |
|（管理画面）質問一覧ページを表示する | GET | /admin/questions | /questions#index |
|（管理画面）質問を削除する | DELETE | /admin/questions/:id | admin/questions#destroy |
|（管理画面）ユーザー一覧ページを表示する | GET | /admin/users | admin/users#index |
|（管理画面）ユーザーを削除する| DELETE | /admin /users/:id| admin/users#destroy |

