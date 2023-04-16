FROM ubuntu:latest

# atualiza o sistema
RUN apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean

# instala o git e o servidor HTTP Apache
RUN apt-get install -y git apache2

# exclui os arquivos no diretório /var/www/html
RUN rm -rf /var/www/html/*

# clona o repositório do GitHub
RUN git clone https://github.com/robsonrosaeu/site-iesb.git /var/www/html/

# expõe a porta 80 para acesso HTTP
EXPOSE 80

# inicia o servidor HTTP Apache
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
