package filtros;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(
	dispatcherTypes = {
		DispatcherType.REQUEST,
		DispatcherType.FORWARD
	},
	urlPatterns = { "/*" } // <- Aplica el filtro a todas las rutas
)
public class AuthFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;

	public void destroy() {
		System.out.println("AuthFilter destroyed");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("AuthFilter operating");

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		String path = req.getRequestURI().substring(req.getContextPath().length());

		// Páginas públicas permitidas sin login
		boolean esPublico = path.equals("/Inicio.jsp") ||
                path.equals("/Nosotros.jsp") ||
                path.equals("/registro.jsp") ||
                path.equals("/LoginControl") || // acción del servlet
                path.startsWith("/AuthServlet"); // para el registro

		HttpSession session = req.getSession(false);
		boolean loggedIn = (session != null && session.getAttribute("usuarioVal") != null);

		if (loggedIn || esPublico) {
			chain.doFilter(request, response); // permitir acceso
		} else {
			resp.sendRedirect(req.getContextPath() + "/Inicio.jsp"); // redirigir si no está logueado
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("AuthFilter initialized");
	}
}

