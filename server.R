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
   
   caso <- "Este es un ejemplo del texto del caso, en este no hay porque es paciente estable."
   
   textocasodobutamina <- "Paciente femenina de 79 años de edad, con historia de insuficiencia cardiaca se presenta en emergencia del hospital con dificultad respiratoria aguda. Eñ exámen físico revela disminución en los sonidos pulmonares, con crepitantes difusos bilaterales y edema con fobia menos severo de grado 2 en las rodillas."
   textocasodopamina <- "Paciente femenina de 49 años de edad, con antecedentes de alcoholismo crónico, y diagnosticada con depresión mayor. Fue admitida a emergencias 4 horas después de la ingesta de 60 pastillas de Disulfiram (15g), 16 de Cronazepam (8mg) y 6 comprimidos de Maprotilina (140mg). La paciente presenta taquipnea, somnolencia y una mala perfusión periférica. Se le reailizó un EKG que revelaba taquicardia sinusal y también se realizó una radiografía de torax que demostró opacidades alveolares bilaterales. Posteriormente su corazón se detiene y se realiza CPR."
   textocasosalbutamol <- "Paciente femenina con 3 años de edad, se presenta con dificultad para respirar e hipoactividad. Los padres refieren tos, dificultad respiratoria de 12 horas de evolución, y una fiebre máxima de 38°C. En los antecedentes destaca que es asmática sin medicamento de base."
   textocasocarvedilol <- "Paciente masculino de 48 años de edad que presenta disnea con 7 días de evolución. Presenta tos, espectoración amarillenta, pero no tiene fiebre ni dolor torácico. No presente historia de isquemia o muerte súbita en su familia. Fue fumador por 5 años, tuvo una hernia hiatal y EPOC leve con ocasional necesidad de tratamiento broncodilatador. Fue diagnosticado a los 24 años con una anomalía coronaria pero ya fue intervenido. Sufrió un infarto agudo al miocardio antes de los 38 años y ha sido ingresado 3 veces en el último año por insuficiencia cardiaca, y 2 veces por dolor torácico."
      
   FC <-  reactiveVal(80)
   PAs <-  reactiveVal(120)
   PAd <-  reactiveVal(60)
   SO2 <-  reactiveVal(98)
   FR <-  reactiveVal(18)
   
   EKG_x <- reactiveVal(1:192)
   EKG_y <- reactiveVal(c(0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0,0,0,-3,0,30,0,0,0,-5,25,0,0,-15,80,-25,0))
   PA_x <- reactiveVal(1:198)
   PA_y <- reactiveVal(c(21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21,21,120,40,45,60,30,25,23,21,19,21))
   SO2_x <- reactiveVal(1:196)
   SO2_y <- reactiveVal(c(0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0,0,98,98,89,79,69,59,49,39,29,19,9,0))
   FR_x <- reactiveVal(1:374)
   FR_y <- reactiveVal(c(0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0,0,2,4,6,8,10,12,14,16,17.5,18,17.5,16,14,12,10,8,6,4,2,0,0))
   PCO2_x <- reactiveVal(1:193)
   PCO2_y <- reactiveVal(c(0,1,2,3,6,9,12,15,17,19,21,23,25,27,29,31,32,33,34,33,31,29,27,25,23,21,19,17,15,12,9,6,3,0,1,2,3,6,9,12,15,17,19,21,23,25,27,29,31,32,33,34,33,31,29,27,25,23,21,19,17,15,12,9,6,3,0,1,2,3,6,9,12,15,17,19,21,23,25,27,29,31,32,33,34,33,31,29,27,25,23,21,19,17,15,12,9,6,3,0,1,2,3,6,9,12,15,17,19,21,23,25,27,29,31,32,33,34,33,31,29,27,25,23,21,19,17,15,12,9,6,3,0,1,2,3,6,9,12,15,17,19,21,23,25,27,29,31,32,33,34,33,31,29,27,25,23,21,19,17,15,12,9,6,3,0,1,2,3,6,9,12,15,17,19,21,23,25,27,29,31,32,33,34,33,31,29,27,25,23,21,19,17,15,12,9,6,3,0))
   


# Declaración de variables Shiny
   output$lpm <- renderText({
      FC()
      })
   
   output$EKG <- renderPlot({
      par(bg = 'black')
      plot(EKG_x(), EKG_y(), col = "green", type = "l", lwd = 3)
      })
 
   output$caso <- renderText({
     if (input$case == 0){}
     else if (input$case == 1){as.character(textocasodobutamina)}
     else if (input$case == 2){as.character(textocasocarvedilol)}
     else if (input$case == 3){as.character(textocasodopamina)}
     else if (input$case == 4){as.character(textocasosalbutamol)}
      })
   
   output$PAs <- renderText({
      PAs()
      })
   
   output$PAd <- renderText({
     PAd()
      })
 
 output$PA <- renderPlot({
   par(bg = 'black')
   plot(PA_x(), PA_y(), col = "red", type = "l", lwd = 3)
   })
 
 output$RESP <- renderPlot({
    par(bg = 'black')
    plot(SO2_x(), SO2_y(), col = "yellow", type = "l", lwd = 3)
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
          sliderInput("dosis", label = "Dosiss por Kg de peso", min = 0, step = 1, max = 5, post = "mcg", value  = 0)}
       else if (input$farmaco == 4){
          sliderInput("dosis", label = "Dosis por Kg de peso", min = 0, step = 0.25, max = 7, post = "mg", value =  0)}
       
    })
 
# Selector de casos (aparece y desaparece)
 observeEvent(input$case, {
   if(input$case != 0) {
     shinyjs::hide("caseselect")
     shinyjs::show("principal")
     shinyjs::show("medicamento")
   }
 })

# Alerta de presión sistólica
observeEvent(FC(), {
  if(PAs() > 200 | FC() ==0) {
    shinyjs::show("alert")
  }
}) 
 

 
 # Farmacos
 
 toListen <- reactive({
    list(input$farmaco,input$dosis)
 })
 
 observeEvent(toListen(), {
    
    # Farmacos
    
    #Salbutamol
    
    if(input$farmaco==1){
       
       newFC <- FC() - 25 * input$dosis
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
       
       newFC <- round(FC()-17 *input$dosis/6.25,0)
       FC(newFC)
       
       newPAs <- round(PAs()+7 *input$dosis/6.25,0)
       PAs(newPAs)
       
       newPAd <- round(PAd()-6 *input$dosis/6.25,0)
       PAd(newPAd)
       
       newSO2 <- round(SO2()+6 *input$dosis/6.25,0)
       SO2(newSO2)
       
       newFR <- FR()
       FR(newFR)
    }
 })
 
 
 # Observador para el selector de casos
 observeEvent(input$case, {
    
    # Casos
    
    #Dobutamina
    
    if(input$case==1){
       
       newFC <- 104
       FC(newFC)
       
       newPAs <- 85
       PAs(newPAs)
       
       newPAd <- 58
       PAd(newPAd)
       
       newSO2 <- 84
       SO2(newSO2)
       
       newFR <- 18
       FR(newFR)
       
    }
    
    #Carvedilol
    if(input$case==2){
       
       newFC <- 97
       FC(newFC)
       
       newPAs <- 113
       PAs(newPAs)
       
       newPAd <- 66
       PAd(newPAd)
       
       newSO2 <- 92
       SO2(newSO2)
       
       newFR <- 18
       FR(newFR)
       
       
    }
    
    #Dopamina
    if(input$case==3){
       
       newFC <- 105
       FC(newFC)
       
       newPAs <- 68
       PAs(newPAs)
       
       newPAd <- 35
       PAd(newPAd)
       
       newSO2 <- 98
       SO2(newSO2)
       
       newFR <- 18
       FR(newFR)
       
    }
    #Salbutamol
    if(input$case==4){
       
       newFC <- 105
       FC(newFC)
       
       newPAs <- 110
       PAs(newPAs)
       
       newPAd <- 73
       PAd(newPAd)
       
       newSO2 <- 95
       SO2(newSO2)
       
       newFR <- 52
       FR(newFR)
    }
 })
 
 
 observeEvent(FC(),{
   if (FC() < 40) {
     newFC <- 0
     FC(newFC)
     
     newPAs <- 0
     PAs(newPAs)
     
     newPAd <- 0
     PAd(newPAd)
     
     newSO2 <- 0
     SO2(newSO2)
     
     newFR <- 0
     FR(newFR)
     
     newEKG_x <- (1:192)
     EKG_x(newEKG_x)
     
     newEKG_y <- rep(0, 192)
     EKG_y(newEKG_y)
      
     newPCO2_x <- (1:193)
     PCO2_x(newPCO2_x)
      
     newPCO2_y <- rep(0,193)
     PCO2_y(newPCO2_y)
      
     newFR_x <- 1:374
     FR_x(newFR_x)
     
     newFR_y <- rep(0,374)
     FR_y(newFR_y) 
      
     newPA_x <- (1:198)
     PA_x(newPA_x) 
      
     newPA_y <- rep(0,198)
     PA_y(newPA_y) 
      
     newSO2_x <- 1:196
     SO2_x(newSO2_x)
      
     newSO2_y <- rep(0,196)
     SO2_y(newSO2_y) 
     
   }
   
 })
 
 
 
}
)


