package service;

import java.util.List;

import model.Contact;

public interface ContactService {
    boolean saveContact(Contact contact);
    List<Contact> getAllContacts();
    Contact getContactById(int id);
    boolean deleteContact(int id);
}
