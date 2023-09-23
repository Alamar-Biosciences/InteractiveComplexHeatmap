library(ComplexHeatmap)
#library(InteractiveComplexHeatmap)
library(shiny)

devtools::load_all()

nr <- 15
nc <- 20
sc <- 5
set.seed(0)
X <- matrix(runif(nr * nc, -1, 1), nr, nc)
dimnames(X) <- list(paste0("r_", 1:nr), paste0("c_", 1:nc))

use_plotly=T

ui <- fluidPage(
    h3("My first interactive ComplexHeatmap Shiny app"),
    p("This is an interactive heatmap visualization on a random matrix."),
    InteractiveComplexHeatmapOutput(
        title1 = "", title2 = "",
        width1 = 690, height1 = 500,
        width2 = 290, height2 = 500,
        containment = TRUE,
        output_ui_float = FALSE, layout="1-3", title3=NULL, closable_output = FALSE,
        add_spinner = TRUE,
        plotly = use_plotly)
)

server <- function(input, output, session) {
    # ht1 <- Heatmap(X, name = "mat",
    #     show_row_names = TRUE, show_column_names = TRUE, row_title_rot = 0,
    #     row_names_gp = gpar(fontsize = sc),
    #     column_names_gp = gpar(fontsize = sc))
    ht1 <- Heatmap(X, name = "mat",
        show_row_names = TRUE, show_column_names = TRUE, row_title_rot = 0)
    makeInteractiveComplexHeatmap(input, output, session, ht1, plotly = use_plotly)
}

shinyApp(ui, server, options = list(port = 8080))


# .r =LETTERS[1:3] # target
# .c = letters[1:5] # sample
# .m <- matrix(1:15,3,5)
# .i <- paste0("Target: ", rep(.r, length(.c)), "\nSample: ", rep(.c, each=length(.r)), "\nValue: ", as.numeric(.m))
# dim(.i) <- dim(.m)

# .f <- plotly::plot_ly(x = .c, y = .r, z = .m, type = "heatmap", hoverinfo = 'text', text = .i)
# 					# colors = grDevices::colorRampPalette(ht_opt("COLOR"))(256),
# 					hoverinfo = 'text', text = .i)

## TODO:
## - position is off whenever the sub heatmap group is shown
