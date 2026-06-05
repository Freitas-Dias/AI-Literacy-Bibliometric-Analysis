# Aula: Análise Bibliométrica com o pacote Bibliometrix
# Objetivo da aula

# Nesta atividade vamos aprender a:
  
# Importar artigos científicos do PubMed para o R;
# Realizar análises bibliométricas básicas;
# Avaliar a evolução da produção científica ao longo do tempo;
# Construir gráficos profissionais;
# Criar redes de relacionamento entre palavras-chave.

# Etapa 1 - Instalação do pacote
install.packages("bibliometrix")

# Etapa 2 - Carregando o pacote
library(bibliometrix)

# Etapa 3 - Importando os dados do PubMed
dados <- convert2df(
  file = "pubmed_ai_literacy.nbib",
  dbsource = "pubmed",
  format = "pubmed"
)

# Etapa 4 - Conhecendo os dados
# Verificando dimensões
dim(dados)   # Linhas x Colunas
head(dados)  # Mostra os primeiros registros.
View(dados)  # Abrindo em formato de planilha

# Etapa 5 - Realizando a análise bibliométrica
resultado <- biblioAnalysis(dados)
resultado

# Etapa 6 - Produção Científica ao Longo do Tempo

# Preparação dos dados
prod_anual <- as.data.frame(table(resultado$Years))
names(prod_anual) <- c("Ano", "Artigos")

# Construção do gráfico

library(ggplot2)

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
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 18),
    plot.subtitle = element_text(size = 12),
    axis.title = element_text(face = "bold"),
    panel.grid.minor = element_blank()
  )

# Etapa 7 - Indicadores Bibliométricos Gerais

S <- summary(
  object = resultado,
  k = 10,
  pause = FALSE
)

# Etapa 8 - Rede de Palavras-Chave

# Construção da matriz de relacionamento
NetMatrix <- biblioNetwork(
  dados,
  analysis = "co-occurrences",
  network = "keywords"
)

# Construção da rede
networkPlot(
  NetMatrix,
  normalize = "association",
  weighted = TRUE,
  n = 30,
  type = "fruchterman"
)

