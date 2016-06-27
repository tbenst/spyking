FROM continuumio/miniconda:4.0.5p0

RUN conda install mpi4py numpy cython scipy matplotlib h5py setuptools colorama

RUN mkdir /src
COPY spyking-circus /src/
RUN python /src/spyking-circus/setup.py install
RUN pip install click

COPY spyking /
RUN chmod 777 /spyking

COPY probes/ /probes

RUN mkdir ~/spyking-circus

ENV DOCKER=True

CMD /spyking