/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;
import java.util.List;

public interface IDAO<O, K> {

    boolean create(O Object);

    List<O> readAll();

    UserDTO readById(K id);

    boolean update(O object);

    boolean delete(K id);
}
