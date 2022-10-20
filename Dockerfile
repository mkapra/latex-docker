FROM leplusorg/latex

ENV DEBIAN_FRONTEND=noninteractive

# Install latest pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-1-amd64.deb
RUN dpkg -i pandoc-2.19.2-1-amd64.deb

# Install pygments for minted
RUN apt update && apt install -y python3-pip python3-pygments 
RUN pip3 install Pygments

# Install eisvogel template
RUN mkdir -p /root/.pandoc/templates/
COPY eisvogel-template/eisvogel.tex /root/.pandoc/templates/eisvogel.latex

# Install ieee template
RUN mkdir -p /root/texmf/tex/latex/ieee
COPY IEEEtran.cls /root/texmf/tex/latex/ieee/

WORKDIR /latex
