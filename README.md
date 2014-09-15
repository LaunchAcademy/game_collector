# Game Collector

Here, we have an app that tracks users and their board game collections. As an administrator of the site, we would like to be able to see a list of users. Since this feature should only be available to users with the admin role, it would be useful to namespace this feature to keep it separate from how regular users interact with the site.


## ER Diagram

```
  +--------------+                                   +------------+
  |  BoardGames  |     +-----------------------+     |   Users    |
  +--------------+     |  BoardGameCollection  |     +------------+
  | name         |     +-----------------------+     | first_name |
  | publisher    |    /| user_id               |\    | last_name  |
  | description  +-----+ board_game_id         +-----+ email      |
  | release_date |    \|                       |/    | role       |
  |              |     +-----------------------+     |            |
  +--------------+                                   +------------+
```
created with [asciiflow](http://asciiflow.com/)
