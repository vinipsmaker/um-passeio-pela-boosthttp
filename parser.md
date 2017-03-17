# Parser

* Suporta funcionalidades HTTP modernas.
* Simples.
* Portável (C++03 e poucas dependências).
* Não faz syscalls nem bufferiza (assim como o parser do NodeJS).

# Parser

Não rouba o controle do fluxo da sua aplicação:

> Parser incremental. Apenas um token por vez.

---

Ao esgotar o buffer...

* Desista e use `expected_token()` para notificar o erro correto.
* Descarte dados já parseados e reordene buffer para ter mais espaço.
* Cresça o buffer e tente novamente.

---

Não use `token_size()` como condição de parada.

> Tokens de tamanho 0 (`end_of_headers`...) são possíveis.

---

Tokens sempre estão completos.

> Correspondência (matching) e decodificação de tokens são passos separados.

# Parser

* Boost.Http faz mágica tentando ser compatível com coisa demais.
* Código do Tufão (desde versão 1.4) faz uso desse novo parser.
  * [`httpserverrequest.cpp::HttpServerRequest::onReadyRead`](https://github.com/vinipsmaker/tufao/blob/7d0e6b788d226f7c0cdc68803e01914b8e312eb3/src/httpserverrequest.cpp#L125)
