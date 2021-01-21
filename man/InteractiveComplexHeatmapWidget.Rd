\name{InteractiveComplexHeatmapWidget}
\alias{InteractiveComplexHeatmapWidget}
\title{
Interactive complex heatmap widget
}
\description{
Interactive complex heatmap widget
}
\usage{
InteractiveComplexHeatmapWidget(
    input, output, session, get_heatmap, heatmap_id = NULL, output_id,
    
    # parameters passed to InteractiveComplexHeatmapOutput()
    title1 = "Original heatmap", title2 = "Selected sub-heatmap",
    width1 = 450, height1 = 350, width2 = 370, height2 = 350, nrow = 1,
    action = "click", brush_opt = list(), output_div = TRUE,
    
    # parameters passed to renderInteractiveComplexHeatmap()
    click_action = NULL, brush_action = NULL,
    default_click_action = TRUE, default_brush_action = TRUE,
    
    # other configurations
    js_code = "", close_button = FALSE, cancel_action = c("remove", "hide"))
}
\arguments{

  \item{input}{Passed from the shiny server function.}
  \item{output}{Passed from the shiny server function.}
  \item{session}{Passed from the shiny server function.}
  \item{get_heatmap}{A \code{\link[ComplexHeatmap]{Heatmap-class}} or a \code{\link[ComplexHeatmap]{HeatmapList-class}} object. The value can also be a function with no argument that generates such object.}
  \item{heatmap_id}{ID of the plot. If it is not specified, an internal ID is assigned.}
  \item{output_id}{Where the heatmap is put.}
  \item{title1}{Pass to \code{\link{InteractiveComplexHeatmapOutput}}.}
  \item{title2}{Pass to \code{\link{InteractiveComplexHeatmapOutput}}.}
  \item{width1}{Pass to \code{\link{InteractiveComplexHeatmapOutput}}.}
  \item{height1}{Pass to \code{\link{InteractiveComplexHeatmapOutput}}.}
  \item{width2}{Pass to \code{\link{InteractiveComplexHeatmapOutput}}.}
  \item{height2}{Pass to \code{\link{InteractiveComplexHeatmapOutput}}.}
  \item{nrow}{Pass to \code{\link{InteractiveComplexHeatmapOutput}}.}
  \item{action}{Pass to \code{\link{InteractiveComplexHeatmapOutput}}.}
  \item{brush_opt}{Pass to \code{\link{InteractiveComplexHeatmapOutput}}.}
  \item{output_div}{Pass to \code{\link{InteractiveComplexHeatmapOutput}}.}
  \item{click_action}{Pass to \code{\link{renderInteractiveComplexHeatmap}}.}
  \item{brush_action}{Pass to \code{\link{renderInteractiveComplexHeatmap}}.}
  \item{default_click_action}{Pass to \code{\link{renderInteractiveComplexHeatmap}}.}
  \item{default_brush_action}{Pass to \code{\link{renderInteractiveComplexHeatmap}}.}
  \item{js_code}{Additional javascript code that is put after the interactive heatmap UI. The value can be a text or a function that takes "heatmap id" as the argument and returns the formatted javascript code.}
  \item{close_button}{Whether to add a close button at the end of the widget.}

}
\details{
It create an interactive heatmap widget according to a certain action. The UI is fit to the output ID user defined.
}
\value{
No value is returned.
}
\examples{
if(interactive()) {
    require(ComplexHeatmap)

    ui = fluidPage(
        actionButton("show_heatmap", "Generate_heatmap"),
        htmlOutput("heatmap_output")
    )

    server = function(input, output, session) {
        m = matrix(rnorm(100), 10)
        ht = Heatmap(m)

        observeEvent(input$show_heatmap, {
            InteractiveComplexHeatmapWidget(input, output, session, ht, 
                output_id = "heatmap_output")
        })
    }
    shiny::shinyApp(ui, server)
}
}