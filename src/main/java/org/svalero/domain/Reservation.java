package org.svalero.domain;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Reservation {
    private int res_id;
    private int user_id;
    private int act_id;
}
