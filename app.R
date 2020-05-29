library(shiny)
library(shinythemes)

ui <- fluidPage(
  theme = shinytheme("superhero"),
  titlePanel("Zadanie 5"),
  sidebarLayout(
    sidebarPanel(
      textInput("mojTekstInput", "Wpisz tekst poniżej:"),
      numericInput("mojNumerInput", "Wybierz numer od 0 do 100:",
                   value = 50, min = 0, max = 100, step = 1),
      selectInput("mojSelectInput", "Wybierz literę od A do K:",
                  choices = LETTERS[1:11])
    ),
    mainPanel(
      h3("Poniżej wpisany tekst, wybrany numer i litera"),
      code(textOutput("wyjsciowyTekst")),
      strong(textOutput("wyjsciowyNumer")),
      em(textOutput("wyjsciowaLitera"))
    )
  )
)

server <- function(input, output) {
  output$wyjsciowyTekst <- renderText(paste("Wpisany tekst: ", input$mojTekstInput))
  output$wyjsciowyNumer <- renderText(paste("Wybrany numer: ", input$mojNumerInput))
  output$wyjsciowaLitera <- renderText(paste("Wybrana litera: ", input$mojSelectInput))
}
shinyApp(ui, server)
