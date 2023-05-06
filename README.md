# Atividade da disciplina de Comércio Eletrônico

## Descrição da atividade

Tarefa e-Commerce: esta tarefa trata sobre a configuração de uma Loja Virtual (seguindo as etapas que estão na playlist a partir do vídeo 5 - Configuração Inicial do Wordpress). 

Os requisitos mínimos que devem conter na configuração do site estão abaixo:

- No mínimo 5 produtos cadastrados
- No mínimo 1 forma de pagamento cadastrado (Ex.: PagSeguro, Mercado Pago)
- No mínimo 2 clientes cadastrados
- Efetuar uma compra para cada cliente

Depois das configurações realizadas, faça um PITCH (apresentação rápida e objetiva através de um vídeo) mostrando as configurações feitas, as vendas realizadas, controle de estoque e os tipos de pagamentos disponíveis no site. O vídeo pode ser a captura da sua tela mostrando o site.
       
O serviço do Cloud Beaver, disponibilizado por padão na porta 8978 do container, foi mapeado para o servidor local na porta 8080.

## Resolução

Para configuração do ambiente de resolução da atividade foi utilizado o `docker compose` para inicializar o banco de dados MySql e o Wordpress com o Nginx. O arquivo de configuração dos serviços, `docker-compose.yaml` encontra na raiz do repositório Git disponibilizado no GitHub.

Dentre as dependências instaladas no container para configuração dos plugins utilizados no Wordpress nas atividades demonstradas nos vídeos, foi instalado o pdo pdo_mysql requerido pelo Woocommerce e o soap (com libxml2-dev) para a integração com os correios. O arquivo de configuração deste container é o Dockerfile na raiz do repositório.

Para configuração do Nginx foi criado o certificado para de assinatura própria para habilitar o SSL conforme arquivo de configuração `nginx-conf/nginx.conf` no repositório.
Para gerar os arquivos do certificado foi utilizado o mkcert conforme comando abaixo:

```bash
mkcert "lojavirtual.local"
```

Para inicializar os serviços o seguinte comando do docker compose foi utilizado:

```bash
docker compose up -d
```

Para visualização dos dados na base de dados foi utilizado o container do CloudBeaver como alternativa ao PhpMyAdmin.

```bash
docker run --name cloudbeaver --rm -ti -p 8080:8978 \
   -v /home/rafael/data/cloudbeaver:/opt/cloudbeaver/workspace \
   -d dbeaver/cloudbeaver:latest
```