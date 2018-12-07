package util.myutils.file;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.*;
import java.net.URL;

/**
 * 上传文件
 * 创建人：FH Q728971035
 * 创建时间：2014年12月23日
 */
public class FileUpload {

    public static final String HEAD_PATH = "c:\\file\\img\\head\\";
    public static final String ACTIVITY_PATH = "c:\\file\\img\\activity\\";

    /**
     * 上传文件
     *
     * @param file     //文件对象
     * @param filePath //上传路径
     * @param fileName //文件名
     * @return 文件名
     */
    public static String fileUp(MultipartFile file, String filePath, String fileName) {
        String extName = ""; // 扩展名格式：
        try {
            if (file.getOriginalFilename().lastIndexOf(".") >= 0) {
                extName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            }
            copyFile(file.getInputStream(), filePath, fileName + extName).replaceAll("-", "");
        } catch (IOException e) {
            System.out.println(e);
        }
        return fileName + extName;
    }

    /**
     * 写文件到当前目录的upload目录中
     *
     * @param in
     * @param dir
     * @param realName
     * @return
     * @throws IOException
     */
    private static String copyFile(InputStream in, String dir, String realName)
            throws IOException {
        File file = mkdirsmy(dir, realName);
        FileUtils.copyInputStreamToFile(in, file);
        return realName;
    }

    /**
     * 写文件到其他目录中
     *
     * @param fromPath 源文件
     * @param toPath   存放位置
     * @return 返回 /file/.... 形式的路径
     * @throws IOException
     */
    public static String copyFile(String fromPath, String toPath)
            throws IOException {
        MultipartFile mulFileByPath = FileUpload.getMulFileByPath("c:" + fromPath);
        // 文件重命名
        fromPath = FileNameUtil.rename(mulFileByPath.getOriginalFilename());
        fromPath = toPath + fromPath;
        File file = new File(fromPath);
        mulFileByPath.transferTo(file);
        fromPath = fromPath.replaceAll("c:\\\\", "/").replaceAll("\\\\", "/").replaceAll("//", "/");
        return fromPath;
    }

    /**
     * 删除指定文件
     *
     * @return
     * @throws IOException
     */
    public static boolean delFile(String path) throws IOException {
        File f = new File(path);
        return f.exists() && f.delete();
    }

    /**
     * 判断路径是否存在，否：创建此路径
     *
     * @param dir      文件路径
     * @param realName 文件名
     * @throws IOException
     */
    public static File mkdirsmy(String dir, String realName) throws IOException {
        File file = new File(dir, realName);
        if (!file.exists()) {
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            file.createNewFile();
        }
        return file;
    }

    /**
     * 下载网络图片上传到服务器上
     *
     * @param httpUrl    图片网络地址
     * @param filePath   图片保存路径
     * @param myFileName 图片文件名(null时用网络图片原名)
     * @return 返回图片名称
     */
    public static String getHtmlPicture(String httpUrl, String filePath, String myFileName) {
        //定义URL对象url
        URL url;
        //定义输入字节缓冲流对象in
        BufferedInputStream in;
        //定义文件输出流对象file
        FileOutputStream file;
        try {
            //图片文件名(null时用网络图片原名)
            String fileName = null == myFileName ? httpUrl.substring(httpUrl.lastIndexOf("/")).replace("/", "") : myFileName;
            //初始化url对象
            url = new URL(httpUrl);
            //初始化in对象，也就是获得url字节流
            in = new BufferedInputStream(url.openStream());
            file = new FileOutputStream(mkdirsmy(filePath, fileName));
            int t;
            while ((t = in.read()) != -1) {
                file.write(t);
            }
            file.close();
            in.close();
            String path = filePath + File.separator + fileName;
            path = path.replaceAll("c:\\\\", "/");
            path = path.replaceAll("c:/", "/");
            path = path.replaceAll("\\\\", "/");
            path = path.replaceAll("//", "/");
            return path;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;

    }

    /**
     * 将图片写至磁盘
     *
     * @param file
     * @return
     */
    public static String fileUploadToDisk(CommonsMultipartFile file) {
        String fileName = file.getOriginalFilename();
        // 文件重命名
        fileName = FileNameUtil.rename(fileName);
        String path = HEAD_PATH + fileName;
        File f = new File(path);
        try {
            file.transferTo(f);
        } catch (IOException e) {
            e.printStackTrace();
        }
        path = path.replaceAll("c:\\\\", "/");
        path = path.replaceAll("\\\\", "/");
        return path;
    }

    private static void picUpload(MultipartFile file) {
        //图片上传
        if (file != null) {// 判断上传的文件是否为空
            String path = null;// 文件路径
            String type = null;// 文件类型
            String fileName = file.getOriginalFilename();// 文件原名称
            System.out.println("上传的文件原名称:" + fileName);
            type = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()) : null;
            if (type != null) {// 判断文件类型是否为空
                if ("GIF".equals(type.toUpperCase()) || "PNG".equals(type.toUpperCase()) || "JPG".equals(type.toUpperCase())) {
                    // 项目在容器中实际发布运行的根路径
//  String realPath=request.getSession().getServletContext().getRealPath("/");  
                    //哥哥自己写的路径
                    String realPath = "F://pic//";
                    // 自定义的文件名称
                    String trueFileName = fileName;
                    // 设置存放图片文件的路径
                    path = realPath + trueFileName;
                    System.out.println("存放图片文件的路径:" + path);
                    // 转存文件到指定的路径
                    try {
                        file.transferTo(new File(path));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    System.out.println("文件成功上传到指定目录下");
                } else {
                    System.out.println("不是我们想要的文件类型,请按要求重新上传");
                }
            } else {
                System.out.println("文件类型为空");
            }
        }
        System.out.println("没有找到相对应的文件");
    }

    public static MultipartFile getMulFileByPath(String picPath) {
        FileItem fileItem = createFileItem(picPath);
        return new CommonsMultipartFile(fileItem);
    }

    private static FileItem createFileItem(String filePath) {
        FileItemFactory factory = new DiskFileItemFactory(16, null);
        String textFieldName = "textField";
        int num = filePath.lastIndexOf(".");
        String extFile = filePath.substring(num);
        FileItem item = factory.createItem(textFieldName, "text/plain", true, "MyFileName" + extFile);
        File newfile = new File(filePath);
        int bytesRead = 0;
        byte[] buffer = new byte[8192];
        try {
            FileInputStream fis = new FileInputStream(newfile);
            OutputStream os = item.getOutputStream();
            while ((bytesRead = fis.read(buffer, 0, 8192))
                    != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            fis.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return item;
    }

}  
