#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


## Inicia la interfaz gráfica


shinyUI(fluidPage(
    shinyjs::useShinyjs(),
    # CSS
    tags$head(
        tags$style(
            "body {
            background-color: black;
            color: #FFFFFF;
            font-size: 20px;
            }
            h5 {
            font-family:Helvetica, sans-serif;
            font-size: 40px;
            letter-spacing: 0px;
            word-spacing: 2px;
            color: #FFFF00;
            font-weight: bold;
            text-decoration: none;
            font-style: normal;
            font-variant: normal;
            text-transform: none;
            }
            h3 {
            font-family:Helvetica, sans-serif;
            font-size: 140px;
            letter-spacing: 0px;
            word-spacing: 2px;
            color: #5BFF00;
            font-weight: bold;
            text-decoration: none;
            font-style: normal;
            font-variant: normal;
            text-transform: none;
            }
            h4 {
            font-family:Helvetica, sans-serif;
            font-size: 40px;
            letter-spacing: 0px;
            word-spacing: 2px;
            color: #FF0000;
            font-weight: bold;
            text-decoration: none;
            font-style: normal;
            font-variant: normal;
            text-transform: none;
            }
            @-webkit-keyframes blink {
    0% {
        opacity: 1;
    }
    49% {
        opacity: 1;
    }
    50% {
        opacity: 0;
    }
    100% {
        opacity: 0;
    }
}
@-moz-keyframes blink {
    0% {
        opacity: 1;
    }
    49% {
        opacity: 1;
    }
    50% {
        opacity: 0;
    }
    100% {
        opacity: 0;
    }
}
@-o-keyframes blink {
    0% {
        opacity: 1;
    }
    49% {
        opacity: 1;
    }
    50% {
        opacity: 0;
    }
    100% {
        opacity: 0;
    }
}
.bli {
    -webkit-animation: blink 1s;
    -webkit-animation-iteration-count: infinite;
    -moz-animation: blink 1s;
    -moz-animation-iteration-count: infinite;
    -o-animation: blink 1s;
    -o-animation-iteration-count: infinite;
}
"
            
        )
        ),
    # Application title
        titlePanel("Simulador Cardiopulmonar"),
    
    # Selector de caso
        fluidRow(id = "caseselect",
                 column(width = 3,
                  radioButtons("case", "Seleccione el caso", choices = list("Ninguno" = 0, "Caso 1" = 1, "Caso 2" = 2, "Caso 3" = 3, "Caso 4" = 4),selected = 0)
        ))
    ,

    # Sidebar con los controles
        column(width = 3,
               
               
               # Texto de caso
               textOutput("caso"),
               br(), hr(), br(),
               
               # Selector de medicamento
               shinyjs::hidden(fluidRow(id = "medicamento",
                        column(width = 12,
               selectInput("farmaco", label = "Medicamento", list("Ninguno" = 0, "Salbutamol" = 1, "Dopamina" = 2, "Dobutamina" = 3, "Carvedilol" = 4), selected = 0 , multiple = F, selectize = T)))),
               uiOutput("dose"),
               submitButton(text = "Seleccionar", icon = NULL, width = NULL),
               shinyjs::hidden(fluidRow(id = "alert",
                   img(src='alert.png', class = "bli", align = "right", width="64", height="64")))
               ),
    
    # Monitor
    # shinyjs::hidden    
    (column(width = 9, id = "principal",
             # EKG y FC  
               fluidRow(style = "height:200px;",
                   column(width = 8,
                          # Imagen EKG
                          plotOutput("EKG", width = "105%", height = "300px")
                          ), 
                   column(width = 1,
                          # Lectura de FC
                          strong("ECG"),img(src='heart.png', align = "right", width="32", height="32"),
                          br(),
                          h3(textOutput("lpm")),shinyjs::hidden(img(src='alert.png', class = "bli", align = "right", width="32", height="32")),
                          "LMP"
                          )
                   ),
             fluidRow(
                 column(width = 8,
                        # Imagen PA
                        plotOutput("PA", width = "105%", height = "300px")
                        
                        ),
                 column(width = 1,
                        # Lectura de PA
                        strong("PA"),img(src='meter.png', align = "right", width="32", height="32"),
                        h4(textOutput("PAs")),shinyjs::hidden(img(id= "alert-PAs", src='alert.png', class = "bli", align = "right", width="32", height="32")), "diast.",
                        h4(textOutput("PAd")),shinyjs::hidden(img(src='alert.png', class = "bli", align = "right", width="32", height="32")),"sist. (mmHg)"
                        )
             ),
             fluidRow(
                 column(width = 8,
                        # Imagen respiración
                        plotOutput("RESP", width = "105%", height = "300px")
                        
                 ),
                 column(width = 1,
                        # Lectura de SaO2
                        strong("SaO2"),img(src='pulmones.png', align = "right", width="32", height="32"),
                        h5(textOutput("SaO2")),shinyjs::hidden(img(src='alert.png', class = "bli", align = "right", width="32", height="32")), "%",br(),br(),
                        # Lectura de FR
                        strong("FR"),
                        h5(textOutput("fr")),shinyjs::hidden(img(src='alert.png', class = "bli", align = "right", width="32", height="32")), "RPM",
                     
                     
                     
                 )
             ))
        )
    )
)

