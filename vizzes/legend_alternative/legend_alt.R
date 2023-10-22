library(ggplot2)

df <- iris

colnames(df) <- tolower(gsub('\\.', '_', colnames(iris)))

# Try this:
plot <- ggplot(df, 
               aes(
                 x = sepal_length, 
                 y = petal_width, 
                 color = species
                 )) +
  geom_point() +
  labs(
    x = 'Sepal Length (cm)',
    y = 'Petal Width (cm)',
    title = 'Scatterplot of Sepal Length vs. Petal Width by Species',
    subtitle = 'Species:
      <span style = "color: #00EA3A">**Setosa**</span>,
      <span style = "color: #0072B2">**Versicolor**</span> and
      <span style = "color: #EB2719">**Virginica**</span>.'
  )

plot <- plot + theme_bw() +
  theme(
    plot.title = element_text(face = 'bold'),
    plot.subtitle = ggtext::element_markdown(size = 12, lineheight = 1),
    legend.position = 'none'
  )+
  scale_color_manual(values = c('#00EA3A', '#0072B2', '#EB2719'))

plot

filename = 'scatterplot.png'
ggsave(filename = filename, plot = plot, width = 10, height = 6)

# Instead of this:
eg <- ggplot(df, 
             aes(
               x = sepal_length, 
               y = petal_width, 
               color = species
               )) +
  geom_point() +
  labs(
    x = 'Sepal Length (cm)',
    y = 'Petal Width (cm)',
    title = 'Scatterplot of Sepal Length vs. Petal Width by Species'
  )

# View plot
eg

filename2 = 'scatterplot2.png'
ggsave(filename = filename2, plot = eg, width = 10, height = 6)