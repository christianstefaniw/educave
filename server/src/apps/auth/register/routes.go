package register

import "github.com/gin-gonic/gin"

func RegisterRoutes(r *gin.RouterGroup) {
	r.POST("/register", register)
}