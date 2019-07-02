FROM perl

# Testing mods
RUN cpanm --notest Test::Code::TidyAll && cpanm --notest Perl::Tidy && cpanm --notest Test::Perl::Critic

# join-hero EU mods
RUN cpanm --notest Log::Log4perl && cpanm --notest Module::Build
RUN cpanm --notest Graph && cpanm --notest JSON && cpanm --notest XML::Twig

# Start in the dir we're going to mount to tidy / test
WORKDIR /src/tidy-me

# By default, we just want to run tidyall and hope the correct config files are in place where we're pointed
ENTRYPOINT [ "tidyall" ]
CMD ["-a"]

# Set labels
LABEL name=perl-tidier maintainer="Caleb Hankins <caleb.hankins@acxiom.com>"
