# 📚 Análise Bibliométrica sobre AI Literacy utilizando R e Bibliometrix

## 📖 Sobre o Projeto

Este projeto apresenta uma análise bibliométrica da produção científica relacionada ao tema **AI Literacy (Letramento em Inteligência Artificial)** utilizando dados extraídos do **PubMed** e analisados por meio do pacote **Bibliometrix** no R.

O objetivo foi explorar como a literatura científica sobre AI Literacy evoluiu ao longo do tempo e identificar os principais temas associados ao campo por meio de técnicas de análise bibliométrica e visualização de redes.

---

# 🎯 Objetivos

Este projeto busca responder às seguintes perguntas:

* Como a produção científica sobre AI Literacy evoluiu ao longo dos anos?
* Quais são os principais temas relacionados à área?
* Como as palavras-chave se conectam na literatura científica?
* Quais oportunidades existem para pesquisas futuras?

---

# 🛠 Tecnologias Utilizadas

* R
* RStudio
* Bibliometrix
* ggplot2
* PubMed

---

# 📂 Fonte dos Dados

Os dados foram obtidos a partir da base de dados PubMed.

Estratégia de busca utilizada:

```text
("literacy" OR "digital literacy" OR "AI literacy")
AND
("artificial intelligence" OR AI OR "machine learning" OR ChatGPT)
```

Os resultados foram exportados em formato:

```text
.nbib
```

---

# 🔄 Fluxo da Análise

```text
PubMed
   ↓
Exportação (.nbib)
   ↓
Importação para o R
   ↓
Análise Bibliométrica
   ↓
Produção Científica Anual
   ↓
Rede de Palavras-Chave
   ↓
Interpretação dos Resultados
```

---

# 📥 Importação dos Dados

Instalação e carregamento dos pacotes:

```r
install.packages("bibliometrix")

library(bibliometrix)
library(ggplot2)
```

Importação do arquivo PubMed:

```r
dados <- convert2df(
  file = "pubmed_ai_literacy.nbib",
  dbsource = "pubmed",
  format = "pubmed"
)
```

---

# 🔍 Análise Bibliométrica

A análise bibliométrica foi realizada utilizando:

```r
resultado <- biblioAnalysis(dados)
```

Essa função calcula diversos indicadores bibliométricos, incluindo:

* Produção científica anual;
* Autores mais produtivos;
* Países mais produtivos;
* Periódicos mais relevantes;
* Frequência de palavras-chave;
* Indicadores de colaboração científica.

---

# 📈 Produção Científica Anual

## Objetivo

Avaliar a evolução temporal da produção científica sobre AI Literacy.

### Preparação dos dados

```r
prod_anual <- as.data.frame(table(resultado$Years))
names(prod_anual) <- c("Ano", "Artigos")
```

### Construção do gráfico

```r
ggplot(
  prod_anual,
  aes(
    x = as.numeric(as.character(Ano)),
    y = Artigos
  )
) +
  geom_line(
    color = "#0A66C2",
    linewidth = 1.8
  ) +
  geom_point(
    color = "#004182",
    size = 3
  ) +
  labs(
    title = "Evolução da Produção Científica em AI Literacy",
    subtitle = "Análise bibliométrica de artigos indexados no PubMed",
    x = "Ano",
    y = "Número de Publicações"
  ) +
  theme_minimal(base_size = 14)
```

---

# 🌐 Rede de Palavras-Chave

## Objetivo

Identificar os principais temas estudados e suas relações dentro da literatura científica.

### Construção da matriz de relacionamento

```r
NetMatrix <- biblioNetwork(
  dados,
  analysis = "co-occurrences",
  network = "keywords"
)
```

### Visualização da rede

```r
networkPlot(
  NetMatrix,
  normalize = "association",
  weighted = TRUE,
  n = 30,
  type = "fruchterman"
)
```

---

# 📊 Principais Resultados

A análise permitiu observar:

* Crescimento expressivo das publicações sobre AI Literacy nos últimos anos;
* Expansão do interesse científico em temas relacionados à Inteligência Artificial e Educação;
* Forte conexão entre conceitos como:

  * Artificial Intelligence
  * Digital Literacy
  * Education
  * ChatGPT
  * Health Literacy
* Consolidação de AI Literacy como um campo emergente de pesquisa.

---

# 📸 Visualizações

## Produção Científica Anual

Inserir imagem:

```text
images/producao_anual.png
```

## Rede de Palavras-Chave

Inserir imagem:

```text
images/rede_palavras_chave.png
```

---

# 📚 Estrutura do Projeto

```text
AI-Literacy-Bibliometric-Analysis/
│
├── data/
│   └── pubmed_ai_literacy.nbib
│
├── images/
│   ├── producao_anual.png
│   └── rede_palavras_chave.png
│
├── scripts/
│   └── analise_bibliometrica.R
│
├── README.md
│
└── LICENSE
```

---

# 🚀 Possíveis Extensões

Este projeto pode ser expandido para incluir:

* Análise dos autores mais produtivos;
* Países com maior produção científica;
* Instituições mais influentes;
* Análise de citações;
* Mapeamento temático;
* Evolução dos tópicos ao longo do tempo;
* Comparação entre PubMed, Scopus e Web of Science.

---

# 👨‍💻 Autor

Ricardo

Estudante de Ciência de Dados e Análise do Comportamento.

Interesses:

* Ciência de Dados
* Inteligência Artificial
* Análise do Comportamento
* Pesquisa Científica
* Bibliometria
* Visualização de Dados

---

# 📄 Licença
Este projeto está disponível para fins educacionais e de aprendizado em Ciência de Dados, Bibliometria e Pesquisa Científica.

