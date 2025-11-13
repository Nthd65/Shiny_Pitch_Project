# server.R

library(shiny)
data(mtcars)

# Build a simple linear regression model (Chỉ chạy một lần khi khởi động)
model <- lm(mpg ~ hp, data = mtcars)

shinyServer(function(input, output) {
  
  # 1. Reactive calculation for prediction (Tính toán dựa trên input)
  predicted_value <- reactive({
    # Lấy giá trị HP từ slider
    hp_new <- data.frame(hp = input$inputHP)
    
    # Thực hiện dự đoán
    predict(model, hp_new)
  })
  
  # 2. Display the predicted value (Đầu ra văn bản phản ứng)
  output$predMPG <- renderPrint({
    # Hiển thị kết quả làm tròn 2 chữ số thập phân
    paste(round(predicted_value(), 2), "MPG")
  })
  
  # 3. Display the plot (Đầu ra biểu đồ phản ứng)
  output$mpgPlot <- renderPlot({
    # Tạo biểu đồ phân tán
    plot(mtcars$hp, mtcars$mpg, 
         xlab = "Horsepower (HP)", 
         ylab = "Miles per Gallon (MPG)", 
         main = "Linear Regression Model: MPG vs. HP", 
         pch = 19, 
         col = "gray50")
    
    # Thêm đường hồi quy
    abline(model, col = "blue", lwd = 2)
    
    # Thêm điểm dự đoán (điểm đỏ lớn)
    points(input$inputHP, predicted_value(), col = "red", pch = 18, cex = 3)
  })
})