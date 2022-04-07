package login

import (
	"github.com/gin-gonic/gin"
)

func login(c *gin.Context) {
	c.Writer.Write([]byte("login page"))
}
