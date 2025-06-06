# payment_centralization_web/Dockerfile
FROM ruby:3.3.0

WORKDIR /app

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-jdk

# Copia Gemfile e Gemfile.lock e instala as gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copia o restante da aplicação
COPY . .

# Configura o ambiente de produção (ou development, dependendo de como você quer rodar localmente)
ENV RAILS_ENV=development

# Exponha a porta que o Rails irá rodar (geralmente 3000, mas vamos usar 3001 para web)
EXPOSE 3000

# Comando para iniciar o servidor Rails (porta padrão no Docker, mas vamos mapear para 3001 fora)
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]