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

### 음악조회/검색
    ```
    GET /musics
    ```
    |parameter|description|
    |---|---|
    |keyword|string: 검색어|
    |sort|integer: (1, 정확도순), (2, 인기순), (3, 최신순)|
