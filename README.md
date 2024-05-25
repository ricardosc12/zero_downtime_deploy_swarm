## Zero Downtime Deployment com Docker Swarm
Este projeto demonstra a implementação de um processo de deployment zero downtime usando Docker Swarm.

**Project Status: In Development** ⚙️

### Descrição
O objetivo é utilizar réplicas no Docker Swarm para que, ao executar uma atualização dos serviços, o processo seja gradual. Antes de atualizar cada serviço, 
é realizada uma verificação de integridade (healthcheck). Caso o serviço não esteja funcionando corretamente, um rollback é iniciado para garantir que a aplicação continue em funcionamento sem interrupções.

Um script de teste está disponível para verificar se nenhuma requisição é perdida durante o processo de deployment.

#### Funcionamento

##### Ambos os serviços rodando na versão 1 (antes da atualização)

![deploy_v1](https://github.com/ricardosc12/zero_downtime_deploy_swarm/assets/25700237/99f4c818-6c6f-47e1-9a2e-d7c676503090)

##### Serviços sendo atualizados gradualmente após o healthcheck

![deploy_progress](https://github.com/ricardosc12/zero_downtime_deploy_swarm/assets/25700237/fb1563e9-6e89-4dd0-bfa7-c00b173f595f)

##### Ambos os serviços rodando a versão atualizada

![deploy_v2](https://github.com/ricardosc12/zero_downtime_deploy_swarm/assets/25700237/30de3aae-f4c8-4a84-908f-9de9421f6735)

#### Scripts

_setup.sh_

Cria as imagens necessárias para os serviços e executa o stack deploy para iniciar os mesmos.

_deploy.sh_

Utilizado para atualizar o serviço específico em Rust, que é o processo no qual estamos testando. Neste script, devemos rebuildar a 
imagem do serviço usando docker compose build _server_ e, em seguida, atualizar o serviço com esta imagem usando docker service update, lembrando de configurar novamente o healthcheck.

_test.sh_

Pode ser utilizado para verificar a indisponibilidade durante o processo de deployment.
