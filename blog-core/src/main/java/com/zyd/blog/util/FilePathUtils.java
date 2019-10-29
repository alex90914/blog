package com.zyd.blog.util;

public class FilePathUtils {
    public static String getDirPath() {
        String os = System.getProperty("os.name");
        if (os.toLowerCase().startsWith("win")) {
            return "d:/upload/";
        }
        return "/data/blog/files/";
    }
}
