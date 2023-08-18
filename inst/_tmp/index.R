library(ComplexHeatmap)
#library(InteractiveComplexHeatmap)
library(shiny)

devtools::load_all()

nr <- 25
nc <- 50
sc <- 5
set.seed(0)
X <- matrix(runif(nr * nc, -1, 1), nr, nc)
dimnames(X) <- list(paste0("r_", 1:nr), paste0("c_", 1:nc))

ui <- fluidPage(
    h3("My first interactive ComplexHeatmap Shiny app"),
    p("This is an interactive heatmap visualization on a random matrix."),
    InteractiveComplexHeatmapOutput(
        title1 = "", title2 = "",
        width1 = 690, height1 = 500,
        width2 = 290, height2 = 500,
        containment = TRUE,
        output_ui_float = FALSE, layout="1-3", title3=NULL, closable_output = FALSE,
        add_spinner = TRUE)
)

server <- function(input, output, session) {
    # ht1 <- Heatmap(X, name = "mat",
    #     show_row_names = TRUE, show_column_names = TRUE, row_title_rot = 0,
    #     row_names_gp = gpar(fontsize = sc),
    #     column_names_gp = gpar(fontsize = sc))
    ht1 <- Heatmap(X, name = "mat",
        show_row_names = TRUE, show_column_names = TRUE, row_title_rot = 0)
    makeInteractiveComplexHeatmap(input, output, session, ht1)
}

shinyApp(ui, server, options = list(port = 8080))


if (FALSE) {
# label resizing example
library(ComplexHeatmap)
sc <- 20
nr <- 25
nc <- 50
set.seed(0)
X <- matrix(runif(nr * nc, -1, 1), nr, nc)
dimnames(X) <- list(paste0("r_", 1:nr), paste0("c_", 1:nc))
ht <- Heatmap(X, name = "mat",
    show_row_names = TRUE, show_column_names = TRUE, row_title_rot = 0,
    row_names_gp = gpar(fontsize = sc),
    column_names_gp = gpar(fontsize = sc))
draw(ht)

ht@row_names_param$gp$fontsize[] <- 5
ht@column_names_param$gp$fontsize[] <- 5

draw(ht)

ht@row_names_param$gp$fontsize[] <- 12
ht@column_names_param$gp$fontsize[] <- 12

draw(ht)
}
