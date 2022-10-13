FROM leplusorg/latex

# Install latest pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-1-amd64.deb
RUN dpkg -i pandoc-2.19.2-1-amd64.deb

# Install eisvogel template
RUN mkdir -p /root/.pandoc/templates/
COPY eisvogel-template/eisvogel.tex /root/.pandoc/templates

# Install ieee template
RUN mkdir -p /root/texmf/tex/latex/ieee
COPY IEEEtran.cls /root/texmf/tex/latex/ieee/