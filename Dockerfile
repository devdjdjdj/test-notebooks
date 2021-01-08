FROM jupyter/scipy-notebook:latest

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

USER root

COPY data_for_container ${HOME}
RUN chown -R ${NB_UID} ${HOME}

USER ${NB_USER}

RUN pip install 'bamboolib>=1.18.1'
RUN pip install --upgrade bamboolib
RUN pip install -U pandas-profiling[notebook]
RUN pip install pycaret
RUN python -m bamboolib install_nbextensions
