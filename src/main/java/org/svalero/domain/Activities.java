package org.svalero.domain;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Activities {
    private int act_id;
    private String act_name;
    private Date act_start_date;
    private Date act_end_date;
    private String act_description;
    private String act_image;
}
