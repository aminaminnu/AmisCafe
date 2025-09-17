package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Contact;
import service.ContactService;
import service.ContactServiceImpl;

@WebServlet("/contact")
public class ContactController extends HttpServlet {

    private ContactService contactService = new ContactServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Save contact (from form)
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        Contact contact = new Contact();
        contact.setName(name);
        contact.setEmail(email);
        contact.setSubject(subject);
        contact.setMessage(message);

        boolean saved = contactService.saveContact(contact);

        if (saved) {
            response.sendRedirect("index.jsp?success=true#contact");
        } else {
            response.sendRedirect("index.jsp?error=true#contact");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
			action = "list";
		}

        switch (action) {
            case "list":  // Admin: view all contacts
                List<Contact> contacts = contactService.getAllContacts();
                request.setAttribute("contacts", contacts);
                request.getRequestDispatcher("viewContacts.jsp").forward(request, response);
                break;

            case "view":  // Admin: view single contact
                int id = Integer.parseInt(request.getParameter("id"));
                Contact contact = contactService.getContactById(id);
                request.setAttribute("contact", contact);
                request.getRequestDispatcher("contactDetails.jsp").forward(request, response);
                break;

            case "delete":  // Admin: delete contact
                int deleteId = Integer.parseInt(request.getParameter("id"));
                boolean deleted = contactService.deleteContact(deleteId);
                if (deleted) {
                    response.sendRedirect("contact?action=list&deleted=true");
                } else {
                    response.sendRedirect("contact?action=list&error=true");
                }
                break;

            default:
                response.sendRedirect("contact?action=list");
                break;
        }
    }
}
