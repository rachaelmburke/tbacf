# Title: "fig3_forpub"
# All the code / science for fig 3 is done in d_tableandfig.rmd (and analysis in c_analysis.rmd).  
# This script is just for finessing knitting panels together / formatting labels etc.

library(tidyverse)
library(gridExtra)
library(ggpubr) # for get_legend

# Load the files
fig3a_woc <- readRDS(here("data","fig3a_woc.rdata")) + scale_y_continuous(limits =c(0,850))
fig3b_woc <- readRDS(here("data","fig3b_woc.rdata")) 
fig3a_wc <- readRDS(here("data","fig3a_wc.rdata")) + scale_y_continuous(limits =c(0,850))
fig3b_wc <- readRDS(here("data","fig3b_wc.rdata")) 

# Put the plots together

# Grab legends
legend_wc <- get_legend(fig3a_wc, "bottom")
legend_woc <- get_legend(fig3a_woc, "bottom")

# Top plot LHS: Remove x axis text and legend
a_woc <- fig3a_woc %+%
  labs(title="A") %+%
  theme(axis.title.x=element_blank(),
        #axis.text.x=element_blank(),
        legend.position = "none")

# Bottom plot LHS: remove legend
b_woc <- fig3b_woc %+%
  labs(title="B") %+%
  theme(
        #axis.title.x=element_blank(),
        #axis.text.x=element_blank(),
        legend.position = "none")

# Top plot RHS: Remove x axis text, y axis text and legend
a_wc <- fig3a_wc %+%
  labs(title="C") %+%
  theme(axis.title.x=element_blank(),
        #axis.text.x=element_blank(),
        axis.title.y=element_blank(),
        #axis.text.y=element_blank(),
        legend.position = "none")

# Bottom plot RHS: remove y axis text and legent
b_wc <- fig3b_wc %+%
  labs(title="D") %+%
  theme(
        #axis.title.x=element_blank(),
        #axis.text.x=element_blank(),
        axis.title.y=element_blank(),
        #axis.text.y=element_blank(),
        legend.position = "none")

# arrange together
fig3_combine <- ggarrange(a_woc, a_wc, b_woc, b_wc, legend_woc, legend_wc,
          ncol=2, nrow=3, heights=c(2,2,0.3))
fig3_combine 


# Save
ggsave(fig3_combine, height = 7, width=8, filename=here("figures", "fig3_combine.pdf"))
