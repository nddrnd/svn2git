FROM ubuntu:18.04
MAINTAINER Yann Baud <baud@ndd.ch>

# Install svn2git dependencies
RUN apt-get update && apt-get install -y git-core git-svn ruby

# Install svn2git
RUN gem install svn2git

VOLUME /data

WORKDIR /data

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

#ENTRYPOINT ["svn2git"]