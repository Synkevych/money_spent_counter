FROM ruby:2.7.5 as rails-toolbox
RUN apt-get update && apt-get install -y nodejs postgresql-client npm
RUN npm install -g yarn

WORKDIR /usr/src/app
COPY Gemfile* ./
COPY package.json ./

# install rails dependencies
RUN bundle install
# install js libraries
RUN yarn install
COPY . .

# COPY . .
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
