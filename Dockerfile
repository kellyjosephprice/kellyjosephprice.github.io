FROM jekyll/jekyll:builder

ADD Gemfile Gemfile.lock ./
RUN bundle

CMD jekyll serve --host 0.0.0.0
