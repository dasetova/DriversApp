FROM bitwalker/alpine-elixir-phoenix:latest

# Copy app
RUN mkdir /app
WORKDIR /app

# Set exposed ports
EXPOSE 4000
ENV PORT=4000 MIX_ENV=dev

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Same with npm deps
ADD assets/package.json assets/
RUN cd assets && \
    npm install

ADD . .

# Run frontend build, compile, and digest assets
RUN cd assets/ && \
    npm run deploy && \
    cd - && \
    mix do compile, phx.digest

USER default

# Commands to run when up
CMD mix ecto.migrate; mix run priv/repo/seeds.exs; mix phx.server