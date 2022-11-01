package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import model.ClienteDAO;

/**
 *
 * @author felip
 */
@WebServlet(name = "GerenciarCliente", urlPatterns = {"/gerenciarCliente"})
public class GerenciarCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html; UTF-8");
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        String idCliente = request.getParameter("idCliente");
        String mensagem = "";

        Cliente c = new Cliente();
        ClienteDAO cdao = new ClienteDAO();

        try {
            if (acao.equals("listar")) {
                ArrayList<Cliente> clientes = new ArrayList<>();
                clientes = cdao.getLista();
                for (Cliente cliente : clientes) {
                    System.out.println(cliente);
                }
                RequestDispatcher dispatcher
                        = getServletContext().
                                getRequestDispatcher("/listarClientes.jsp");
                request.setAttribute("cliente", clientes);
                dispatcher.forward(request, response);

            } else if (acao.equals("alterar")) {
                c = cdao.getCarregarPorId(Integer.parseInt(idCliente));
                if (c.getIdCliente() > 0) {
                    RequestDispatcher dispatcher
                            = getServletContext().
                                    getRequestDispatcher("/cadastrarCliente.jsp");
                    request.setAttribute("cliente", c);
                    dispatcher.forward(request, response);

                } else {
                    mensagem = "Cliente não encontrado na base dados!";
                }

            } else if (acao.equals("desativar")) {
                c.setIdCliente(Integer.parseInt(idCliente));
                if (cdao.desativar(c)) {
                    mensagem = "Cliente desativado com sucesso!";

                } else {
                    mensagem = "Falha ao desativar o cliente!";
                }

            } else if (acao.equals("ativar")) {
                c.setIdCliente(Integer.parseInt(idCliente));
                if (cdao.ativar(c)) {
                    mensagem = "Cliente ativado com sucesso!";
                } else {
                    mensagem = "Falha ao ativar o cliente!";
                }

            } else {
                response.sendRedirect("/index.jsp");
            }

        } catch (SQLException e) {
            mensagem = "Erro: " + e.getMessage();
            //e.printStackTrace();
        }

        out.println(
                "<script type='text/javascript'>"
                + "alert('" + mensagem + "');"
                + "location.href='gerenciarCliente?acao=listar';"
                + "</script>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String idCliente = request.getParameter("idCliente");

        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String endereco = request.getParameter("endereco");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String dataCadastro = request.getParameter("dataCadastro");
        String status = request.getParameter("status");
        String mensagem = "";

        Cliente c = new Cliente();
        ClienteDAO cdao = new ClienteDAO();
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

            if (!idCliente.isEmpty()) {
                c.setIdCliente(Integer.parseInt(idCliente));
            }

            if (nome.equals("") || nome.isEmpty()) {
                request.setAttribute("msg", "Informe o nome!");

            } else {
                c.setNome(nome);
            }

            if (cpf.equals("") || cpf.isEmpty()) {
                request.setAttribute("msg", "Informe o cpf!");

            } else {
                c.setCpf(cpf);
            }

            if (endereco.equals("") || endereco.isEmpty()) {
                request.setAttribute("msg", "Informe o endereco!");

            } else {
                c.setEndereco(endereco);
            }

            if (email.equals("") || email.isEmpty()) {
                request.setAttribute("msg", "Informe o email!");

            } else {
                c.setEmail(email);
            }

            if (telefone.equals("") || telefone.isEmpty()) {
                request.setAttribute("msg", "Informe o telefone!");

            } else {
                c.setTelefone(telefone);
            }

            if (dataCadastro.isEmpty() || dataCadastro.equals("")) {
                mensagem = "Campo Obrigatório!";

            } else {
                c.setDataCadastro(df.parse(dataCadastro));
            }

            if (status.isEmpty() || status.equals("")) {
                mensagem = "Campo Obrigatório";

            } else {
                c.setStatus(Integer.parseInt(status));
            }

            if (cdao.gravar(c)) {
                mensagem = "Cliente salvo na base de dados";

            }
        } catch (ParseException pe) {
            mensagem = "Erro: " + pe.getMessage();
            //     pe.printStackTrace();

        } catch (SQLException e) {
            mensagem = "Erro: " + e.getMessage();
            //     e.printStackTrace();

        }

        out.println(
                "<script type='text/javascript'>"
                + "alert('" + mensagem + "');"
                + "location.href='gerenciarCliente?acao=listar';"
                + "</script>");

    }

}
