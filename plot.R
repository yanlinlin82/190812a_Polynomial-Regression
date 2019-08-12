library(tidyverse)

set.seed(12345)

a <- tibble(x = 0:7) %>% mutate(y = x + 1 + rnorm(8))

g <- a %>% ggplot(aes(x, y)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  scale_y_continuous(limits = c(-0, 13)) +
  geom_text(aes(x, y, label = text), data = tibble(x = 0, y = 12, text = "degree = 1"), hjust = 0, vjust = 1, size = 7) +
  ggtitle("Polynomial Regression")
g %>% ggsave(filename = "poly-reg.d1.png", width = 7, height = 7)

g <- a %>% ggplot(aes(x, y)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", formula = y ~ I(x^3) + I(x^2) + x, se = FALSE) +
  scale_y_continuous(limits = c(-0, 13)) +
  geom_text(aes(x, y, label = text), data = tibble(x = 0, y = 12, text = "degree = 3"), hjust = 0, vjust = 1, size = 7) +
  ggtitle("Polynomial Regression")
g %>% ggsave(filename = "poly-reg.d3.png", width = 7, height = 7)

g <- a %>% ggplot(aes(x, y)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", formula = y ~ I(x^5) + I(x^4) + I(x^3) + I(x^2) + x, se = FALSE) +
  scale_y_continuous(limits = c(-0, 13)) +
  geom_text(aes(x, y, label = text), data = tibble(x = 0, y = 12, text = "degree = 5"), hjust = 0, vjust = 1, size = 7) +
  ggtitle("Polynomial Regression")
g %>% ggsave(filename = "poly-reg.d5.png", width = 7, height = 7)

g <- a %>% ggplot(aes(x, y)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", formula = y ~ I(x^7) + I(x^6) + I(x^5) + I(x^4) + I(x^3) + I(x^2) + x, se = FALSE) +
  scale_y_continuous(limits = c(-0, 13)) +
  geom_text(aes(x, y, label = text), data = tibble(x = 0, y = 12, text = "degree = 7"), hjust = 0, vjust = 1, size = 7) +
  ggtitle("Polynomial Regression")
g %>% ggsave(filename = "poly-reg.d7.png", width = 7, height = 7)
