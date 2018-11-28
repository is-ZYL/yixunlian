package com.yixunlian.controller.front;

import com.yixunlian.entity.Result;
import com.yixunlian.service.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import util.myutils.file.FileNameUtil;
import util.myutils.file.FileUpload;

import java.io.*;

/**
 * @author yuanyuana
 */
@RestController
@RequestMapping("upload")
@Slf4j
public class FilesController {
    /**
     * 限制最大上传 3M
     */
    private final static int MAX_POST_SIZE = 3 * 1024 * 1024;
    /**
     * 允许文件格式
     */
    private String allowSuffix = "jpg,png,gif,jpeg";
    /**
     * 允许文件大小
     */
    private long allowSize = 2L;
    private String fileName;
    private String[] fileNames;
    @Autowired
    private RedisService rService;

    /**
     * 图片上传
     *
     * @param file
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @RequestMapping("/onefile")
    public Result<String> oneFileUpload(@RequestParam("file") MultipartFile file, @RequestParam(defaultValue = "activity") String types) {
        try {
            log.info("上传文件类型为：" + types);
            String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
            int length = getAllowSuffix().indexOf(suffix);
            if (length == -1) {
                return Result.error("请上传允许格式的文件");
            }
            if (file.getSize() > getAllowSize()) {
                return Result.error("您上传的文件大小已经超出范围");
            }
            String fileName = file.getOriginalFilename();
            // 文件重命名
            fileName = FileNameUtil.rename(fileName);
            String path = "";
            if ("head".equals(types)) {
                path = FileUpload.HEAD_PATH + fileName;
            } else if ("activity".equals(types)) {
                path = FileUpload.ACTIVITY_PATH + fileName;
            }
            log.info("文件路径为：" + path);
            if ("".equals(path)) {
                return Result.success("204", "上传失败，参数异常");
            }
            File f = new File(path);
            file.transferTo(f);
            path = path.replaceAll("c:\\\\", "/");
            path = path.replaceAll("\\\\", "/");
            path = path.replaceAll("//", "/");
            return Result.success("200", "上传成功", path);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Result.success("500", "上传失败，服务器异常");
    }

    /**
     * 图片上传至临时文件夹
     *
     * @param file
     * @return
     */
    @PostMapping("/onefileToTemp")
    public Result<String> onefileToTemp(@RequestParam("file") MultipartFile file) {
        try {
            String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
            int length = getAllowSuffix().indexOf(suffix);
            if (length == -1) {
                return Result.error("请上传允许格式的文件");
            }
            if (file.getSize() > getAllowSize()) {
                return Result.error("您上传的文件大小已经超出范围");
            }
            String fileName = file.getOriginalFilename();
            // 文件重命名
            fileName = FileNameUtil.rename(fileName);
            String path = "c:\\file\\imgTemp\\" + fileName;
            File f = new File(path);

            file.transferTo(f);

            path = path.replaceAll("c:\\\\", "/");
            path = path.replaceAll("\\\\", "/");
            path = path.replaceAll("//", "/");
            return Result.success("200", "上传成功", path);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Result.success("500", "上传失败，服务器异常");
    }

    private String getAllowSuffix() {
        return allowSuffix;
    }

    private long getAllowSize() {
        return allowSize * 1024 * 1024;
    }
}
