# MarketMaker
A simple market maker API that allows users to request visits to perform tasks from other users. This exchange of services is mediated by minutes rather than currency.

Transactions use optimistic locking to ensure minutes are not allocated inappropriately.


## Development
* Best practices are enforced by Credo `mix credo`
* Specs are enforced by Dialyzer `mix dialyzer`

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Run DB with docker compose `docker-compose up -d db`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## TODO
- [ ] Uniqueness constraints on tables?
- [ ] Use full map comparisons on tests
- [ ] API documentation
- [ ] User unique on email
- [ ] Don't allow negative minutes

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
