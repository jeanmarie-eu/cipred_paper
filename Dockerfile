FROM jmll/r-vers:3.6.3

ENV CIPRED_BRANCH 0.0.5

## install r-packages
RUN  cd ~ \
  && wget --quiet https://git.nilu.no/rqcr/cipred/-/archive/${CIPRED_BRANCH}/cipred-${CIPRED_BRANCH}.tar.gz \
  && tar xzf cipred-${CIPRED_BRANCH}.tar.gz \
  && cd cipred-${CIPRED_BRANCH} \
  && Rscript ./lib/buildpkgs.R \
  && Rscript ./lib/install.R pkg cipred branch ${CIPRED_BRANCH} dir ~ \
  && Rscript ./inst/paper/install.R \
  && cd .. \
  && rm -r cipred-${CIPRED_BRANCH} \
  && rm cipred-${CIPRED_BRANCH}.tar.gz

CMD ["R"]
