package org.svalero.domain;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class User {
    private int user_id;
    private String username;
    private String user_firstname;
    private String user_lastName;
    private int user_phone;
    private String user_role;
    private String password;
}
