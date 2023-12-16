package com.pblgllgs.contactsbackend.repository;
/*
 *
 * @author pblgl
 * Created on 16-12-2023
 *
 */

import com.pblgllgs.contactsbackend.domain.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ContactRepository extends JpaRepository<Contact, String> {

    Optional<Contact> findById(String id);
    Optional<Contact> findByPhone(String phone);
}
