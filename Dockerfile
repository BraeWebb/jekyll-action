FROM pandoc/ubuntu

ENV DEBIAN_FRONTEND=noninteractive

LABEL version="2.0.1"
LABEL repository="https://github.com/helaili/jekyll-action"
LABEL homepage="https://github.com/helaili/jekyll-action"
LABEL maintainer="Alain Hélaïli <helaili@github.com>"

RUN apt-get update
RUN apt-get install -y ruby ruby-dev
RUN gem install bundler
RUN apt-get install -y git build-essential
# Allow for timezone setting in _config.yml
RUN apt-get install -y tzdata
# Use curl to send API requests
RUN apt-get install -y curl
# Fork: Allow PDF document generation
RUN apt-get install -y wkhtmltopdf

# debug
RUN bundle version

COPY LICENSE README.md /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
