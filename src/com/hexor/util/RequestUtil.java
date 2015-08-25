package com.hexor.util;

import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-17
 * Time: 16:16
 */
public class RequestUtil {

    /**
     * 获得完整带参数的请求路径
     * @param request
     * @return
     */
    public static String buildOriginalURL(HttpServletRequest request) {
        StringBuffer originalURL = request.getRequestURL();
        Map parameters = request.getParameterMap();
        if (parameters != null && parameters.size() > 0) {
            originalURL.append("?");
            for (Iterator iter = parameters.keySet().iterator(); iter.hasNext();) {
                String key = (String) iter.next();
                String[] values = (String[]) parameters.get(key);
                for (int i = 0; i < values.length; i++) {
                    originalURL.append(key).append("=").append(values[i]).append("&");
                }
            }
        }
        return originalURL.toString();
    }
}
