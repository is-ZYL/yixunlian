package com.yixunlian.controller.front;

import cn.hutool.core.date.DateUtil;
import com.yixunlian.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/sys/upload")
public class UploadController extends BaseController {

    /* 限制最大上传 3M */
    private final static int MAX_POST_SIZE = 3 * 1024 * 1024;
    private String allowSuffix = "jpg,png,gif,jpeg";//允许文件格式
    private long allowSize = 2L;//允许文件大小
    private String fileName;
    private String[] fileNames;

    /**
     * <p>
     * 上传文件存放目录
     * </p>
     */
    private static String getSaveDir() {
        StringBuffer filePath = new StringBuffer(System.getProperty("user.dir"));
        filePath.append(File.separator);
        filePath.append(DateUtil.format(new Date(), "yyyy"));
        filePath.append(File.separator);
        File file = new File(filePath.toString());
        if (!file.exists()) {
            file.mkdirs();
        }
        return file.getPath();
    }

    public String getAllowSuffix() {
        return allowSuffix;
    }

    public void setAllowSuffix(String allowSuffix) {
        this.allowSuffix = allowSuffix;
    }

    public long getAllowSize() {
        return allowSize * 1024 * 1024;
    }

    public void setAllowSize(long allowSize) {
        this.allowSize = allowSize;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String[] getFileNames() {
        return fileNames;
    }

    public void setFileNames(String[] fileNames) {
        this.fileNames = fileNames;
    }

    /**
     * <p>
     * 功能：重新命名文件
     * </p>
     *
     * @return
     */
    private String getFileNameNew() {
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return fmt.format(new Date());
    }

    /**
     * <p class="detail">
     * 功能：文件上传
     * </p>
     *
     * @param files
     * @param destDir
     * @throws Exception
     * @author wangsheng
     * @date 2014年9月25日
     */
    public void uploads(MultipartFile[] files, String destDir, HttpServletRequest request) throws Exception {
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
        try {
            fileNames = new String[files.length];
            int index = 0;
            for (MultipartFile file : files) {
                String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
                int length = getAllowSuffix().indexOf(suffix);
                if (length == -1) {
                    throw new Exception("请上传允许格式的文件");
                }
                if (file.getSize() > getAllowSize()) {
                    throw new Exception("您上传的文件大小已经超出范围");
                }
                String realPath = request.getSession().getServletContext().getRealPath("/");
                File destFile = new File(realPath + destDir);
                if (!destFile.exists()) {
                    destFile.mkdirs();
                }
                String fileNameNew = getFileNameNew() + "." + suffix;//
                File f = new File(destFile.getAbsoluteFile() + "\\" + fileNameNew);
                file.transferTo(f);
                f.createNewFile();
                fileNames[index++] = basePath + destDir + fileNameNew;
            }
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * <p class="detail">
     * 功能：文件上传
     * </p>
     *
     * @param file
     * @param destDir
     * @throws Exception
     * @author wangsheng
     * @date 2014年9月25日
     */
    public void upload(MultipartFile file, String destDir, HttpServletRequest request) throws Exception {
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
        try {
            String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
            int length = getAllowSuffix().indexOf(suffix);
            if (length == -1) {
                throw new Exception("请上传允许格式的文件");
            }
            if (file.getSize() > getAllowSize()) {
                throw new Exception("您上传的文件大小已经超出范围");
            }

            String realPath = request.getSession().getServletContext().getRealPath("/");
            File destFile = new File(realPath + destDir);
            if (!destFile.exists()) {
                destFile.mkdirs();
            }
            String fileNameNew = getFileNameNew() + "." + suffix;
            File f = new File(destFile.getAbsoluteFile() + "/" + fileNameNew);
            file.transferTo(f);
            f.createNewFile();
            fileName = basePath + destDir + fileNameNew;
        } catch (Exception e) {
            throw e;
        }
    }

    @PostMapping(value = "/uploadPics")
    public String uploadPics(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
        try {
            upload(file, "/upload/user/", request);
            response.getWriter().print(getFileName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
