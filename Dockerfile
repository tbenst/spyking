FROM continuumio/miniconda:4.0.5p0

RUN apt-get update && apt-get install -y --no-install-recommends \
            build-essential

RUN conda install mpi4py numpy cython scipy matplotlib h5py setuptools colorama

RUN mkdir /src
COPY spyking-circus/ /src/spyking-circus
RUN cd /src/spyking-circus && python setup.py install
RUN pip install click

COPY spyking /
RUN chmod 777 /spyking

COPY probes/ /probes

ENV DOCKER=True

CMD /spyking