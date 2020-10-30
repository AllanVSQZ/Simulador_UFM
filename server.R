#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com/
#



# Inicio de la app lado del servidor

shinyServer(function(input, output) {
   
   
# Variables
   
   caso <<- "Este es un ejemplo del texto del caso, en este no hay porque es paciente estable."
   
   FC <-  reactiveVal(80)
   PAs <-  reactiveVal(120)
   PAd <-  reactiveVal(60)
   SO2 <-  reactiveVal(98)
   FR <-  reactiveVal(18)
   
   EKG_x <- 1:192
   EKG_y <- c(0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0)
   PA_x <- 1:198
   PA_y <- c(21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21)
   SO2_x <- 1:196
   SO2_y <- c(0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0)
   FR_x <- 1:374
   FR_y <- c(0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0)
   PCO2_x <- 1:193
   PCO2_y <- c(0,1,2,3,6,9,12,15,17,19,21,23,25,27,29,31,32,33,34,33,31,29,27,25,23,21,19,17,15,12,9,6,3,0,1,2,3,6,9,12,15,17,19,21,23,25,27,29,31,32,33,34,33,31,29,27,25,23,21,19,17,15,12,9,6,3,0,1,2,3,6,9,12,15,17,19,21,23,25,27,29,31,32,33,34,33,31,29,27,25,23,21,19,17,15,12,9,6,3,0,1,2,3,6,9,12,15,17,19,21,23,25,27,29,31,32,33,34,33,31,29,27,25,23,21,19,17,15,12,9,6,3,0,1,2,3,6,9,12,15,17,19,21,23,25,27,29,31,32,33,34,33,31,29,27,25,23,21,19,17,15,12,9,6,3,0,1,2,3,6,9,12,15,17,19,21,23,25,27,29,31,32,33,34,33,31,29,27,25,23,21,19,17,15,12,9,6,3,0)
   


# Declaración de variables Shiny
   output$lpm <- renderText({
      FC()
      })
   
   output$EKG <- renderPlot({
      par(bg = 'black')
      plot(EKG_x, EKG_y, col = "green", type = "l", lwd = 3)
      })
 
   output$caso <- renderText({
      as.character(caso)
      })
   
   output$PAs <- renderText({
      PAs()
      })
   
   output$PAd <- renderText({
     PAd()
      })
 
 output$PA <- renderPlot({
   par(bg = 'black')
   plot(PA_x, PA_y, col = "red", type = "l", lwd = 3)
   })
 
 output$RESP <- renderPlot({
    par(bg = 'black')
    plot(SO2_x, SO2_y, col = "yellow", type = "l", lwd = 3)
    })
 
 output$SaO2 <- renderText({
       SO2()
    })
 
 output$fr <- renderText(
    {
       FR()
    })

 
 
 output$dose <- renderUI(
    {
       if (input$farmaco == 0) {
          shinyjs::hidden(sliderInput(inputId = "dosis", label = "Dosis", min = 0, max = 0, value = 0, step = 0))
          }
       else if(input$farmaco == 1){
          sliderInput("dosis", label = "Dosis por Kg de peso", min = 0, step = 1, max = 5, post = "mg", value = 0)}
       else if (input$farmaco == 2){
          sliderInput("dosis", label = "Dosis por Kg de peso", min = 0, step = 1, max = 5, post = "mcg", value = 0)}
       else if (input$farmaco == 3){
          sliderInput("dosis", label = "Dosis por Kg de peso", min = 0, step = 1, max = 5, post = "mcg", value  = 0)}
       else if (input$farmaco == 4){
          sliderInput("dosis", label = "Dosis por Kg de peso", min = 0, step = 0.25, max = 7, post = "mg", value =  0)}
       
    })
 

 
 
 # Farmacos
 
 toListen <- reactive({
    list(input$farmaco,input$dosis)
 })
 
 observeEvent(toListen(), {
    
    # Farmacos
    
    #Salbutamol
    
    if(input$farmaco==1){
       
       newFC <- FC() - 70 * input$dosis
       FC(newFC)
       
       newPAs <- PAs()+10* input$dosis
       PAs(newPAs)
       
       newPAd <- PAd()-13* input$dosis
       PAd(newPAd)
       
       newSO2 <- SO2()+3* input$dosis
       SO2(newSO2)
       
       newFR <- FR()-34* input$dosis
       FR(newFR)
       
    }
    
    #Dopamina
    if(input$farmaco==2){
       
       newFC <- FC()-26 *input$dosis/2
       FC(newFC)
       
       newPAs <- PAs()+52 *input$dosis/2
       PAs(newPAs)
       
       newPAd <- PAd()+26 *input$dosis/2
       PAd(newPAd)
       
       newSO2 <- SO2()
       SO2(newSO2)
       
       newFR <- FR()
       FR(newFR)
       
       
    }
    #Dobuta
    if(input$farmaco==3){
       
       newFC <- FC()-24 *input$dosis/3
       FC(newFC)
       
       newPAs <- PAs()+36 *input$dosis/3
       PAs(newPAs)
       
       newPAd <- PAd()+3 *input$dosis/3
       PAd(newPAd)
       
       newSO2 <- SO2()+15 *input$dosis/3
       SO2(newSO2)
       
       newFR <- FR()
       FR(newFR)
       
    }
    #Carvedilol
    if(input$farmaco==4){
       
       newFC <- round(FC()-18.75 *input$dosis/6.25,0)
       FC(newFC)
       
       newPAs <- round(PAs()+6.25 *input$dosis/6.25,0)
       PAs(newPAs)
       
       newPAd <- round(PAd()-6.25 *input$dosis/6.25,0)
       PAd(newPAd)
       
       newSO2 <- round(SO2()+6.25 *input$dosis/6.25,0)
       SO2(newSO2)
       
       newFR <- FR()
       FR(newFR)
       
       
    }
 })
 
 
}
)


