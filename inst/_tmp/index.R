library(ComplexHeatmap)
#library(InteractiveComplexHeatmap)
library(shiny)

devtools::load_all()

data(rand_mat) # simply a random matrix
ht1 = Heatmap(rand_mat, name = "mat",
    show_row_names = TRUE, show_column_names = TRUE, row_title_rot = 0)
ht1 = draw(ht1)

ui = fluidPage(
    h3("My first interactive ComplexHeatmap Shiny app"),
    p("This is an interactive heatmap visualization on a random matrix."),
    InteractiveComplexHeatmapOutput(
        title1 = "", title2 = "",
        width1 = 690, height1 = 500,
        width2 = 290, height2 = 500,
        containment = TRUE,
        output_ui_float = TRUE,
        add_spinner = TRUE)
)

server = function(input, output, session) {
    makeInteractiveComplexHeatmap(input, output, session, ht1)
}

shinyApp(ui, server)
