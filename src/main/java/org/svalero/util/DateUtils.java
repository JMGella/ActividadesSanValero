package org.svalero.util;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import static org.svalero.util.Constants.FORMAT_DATE_PATTERN;
import static org.svalero.util.Constants.PARSE_DATE_PATTERN;

public class DateUtils {

    public static String format(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(FORMAT_DATE_PATTERN);
        return dateFormat.format(date);
    }

    public static Date parse(String date) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat(PARSE_DATE_PATTERN);
        return new Date(dateFormat.parse(date).getTime());
    }

}
