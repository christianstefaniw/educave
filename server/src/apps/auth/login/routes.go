package login

import "github.com/gin-gonic/gin"

func RegisterRoutes(r *gin.RouterGroup) {
	r.GET("/login", login)
}
