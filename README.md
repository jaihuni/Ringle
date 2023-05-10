# README

## initial setting

* Ruby/Rails version
    ```
    ruby 3.2.2
    Rails 7.0.4.3
    ```

* System dependencies
    ```
    Tested in Ubuntu 20.04.5 LTS
    ```

* Database
    ```
    Sqlite3
    ```

* Database initialization
    ```
    rails db:migrate
    ```

    ### if want adding example music data to db
    enter console mode with
    ```
    rails console
    ```
    and
    ```
    load 'music_list.rb'
    ```

* Deployment instructions
    ```
    rails server
    ```

## implemented function
based on http server
아래 지원하는 api url을 첨부하였으나, 실질적으로 http 서버로 운용되므로
인터넷 브라우저 상으로 확인해 주시기 바랍니다

* ### 음악조회/검색
    #### related directory
    ```
    /app/controllers/musics_controller.rb
    /app/views/musics
    ```

    #### API
    ```GET /musics```
    음원 목록 조회/검색
    |parameter|type|description|
    |---|---|---|
    |keyword|string|검색어|
    |sort|integer|1: 정확도순, 2: 인기순, 3: 최신순|

* ### 개인 재생목록 관련
    #### related directory
    ```
    /app/controllers/musics_controller.rb
    /app/views/musics
    ```

    #### API
    ```GET /users```<br/>
    유저 목록 조회

    ```GET /users/:id```<br/>
    유저 정보/플레이리스트 목록 조회

    ```POST /users/:user_id/playlists/```<br/>
    유저 플레이리스트 추가

    ```DELETE /users/:user_id/playlists/:id```<br/>
    유저 플레이리스트 삭제

    ```GET /users/:user_id/playlists/:id```<br/>
    유저 플레이리스트 수록 음악 조회

    ```POST /users/:user_id/playlists/:playlist_id/list_musics```<br/>
    플레이리스트 음악 추가

    ```POST /users/:user_id/playlists/:playlist_id/add_musics```<br/>
    플레이리스트 음악 일괄 추가
    |parameter|type|description|
    |---|---|---|
    |input|array|추가할 음악의 id|

    ```DELETE /users/:user_id/playlists/:playlist_id/list_musics/:id```<br/>
    플레이리스트 음악 삭제

    ```DELETE /users/:user_id/playlists/:playlist_id/delete_musics```<br/>
    플레이리스트 음악 일괄 삭제
    |parameter|type|description|
    |---|---|---|
    |input|array|삭제할 음악의 playlist_music id|





