package service;

import java.util.List;

import model.Contact;
import model.ContactDao;

public class ContactServiceImpl implements ContactService {

    private ContactDao contactDao = new ContactDao();

    @Override
    public boolean saveContact(Contact contact) {
        return contactDao.saveContact(contact);
    }

    @Override
    public List<Contact> getAllContacts() {
        return contactDao.getAllContacts();
    }

    @Override
    public Contact getContactById(int id) {
        return contactDao.getContactById(id);
    }

    @Override
    public boolean deleteContact(int id) {
        return contactDao.deleteContact(id);
    }
}
