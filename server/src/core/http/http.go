package http

import (
	"os"
	"server/src/apps/auth/login"
	"server/src/apps/auth/register"

	"github.com/gin-gonic/gin"
)

type Http struct {
	*gin.Engine
}

func Init() *Http {
	http := &Http{gin.New()}
	http.registerRoutes()
	return http
}

func (s *Http) Serve() {
	s.Run(os.Getenv("PORT"))
}

func (s *Http) registerRoutes() {
	authGroup := s.Group("/auth")
	register.RegisterRoutes(authGroup)
	login.RegisterRoutes(authGroup)
}
