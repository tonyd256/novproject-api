FROM thoughtbot/yesod

RUN mkdir -p /app
WORKDIR /app

COPY novproject.cabal ./
RUN cabal update
RUN cabal install --dependencies-only -j4 --enable-tests