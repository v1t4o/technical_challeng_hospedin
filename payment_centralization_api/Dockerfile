# payment_centralization_api/Dockerfile
FROM ruby:3.3.0

WORKDIR /app

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-jdk

# Copia Gemfile e Gemfile.lock e instala as gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copia o restante da aplicação
COPY . .

# Configura o ambiente de produção
ENV RAILS_ENV=production
ENV BUNDLE_WITHOUT=development:test

# Exponha a porta que o Rails irá rodar (padrão para API é 3000)
EXPOSE 3000

# Comando para iniciar o servidor Rails
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]