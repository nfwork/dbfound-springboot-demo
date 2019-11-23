package com.nfwork.dbfound.springboot.demo.controller;

import com.github.nfwork.dbfound.starter.ModelExecutor;
import com.github.nfwork.dbfound.starter.annotation.ContextAware;
import com.nfwork.dbfound.core.Context;
import com.nfwork.dbfound.dto.ResponseObject;
import com.nfwork.dbfound.util.JsonUtil;
import com.nfwork.dbfound.web.WebWriter;
import com.nfwork.dbfound.web.file.FileSizeCalculator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
public class FileController {
	
	@Autowired
	ModelExecutor modelExecutor;

    @PostMapping("/sys/file/upload")
    public void upload(@RequestParam("file") MultipartFile file, @ContextAware Context context) throws IOException {
        context.setParamData("file_name", file.getOriginalFilename());
        context.setParamData("file_type",  file.getContentType());
        context.setParamData("file_size",  FileSizeCalculator.getFileSize(file.getSize()));
        context.setParamData("file",  file.getInputStream());
       
        ResponseObject responseObject = modelExecutor.execute(context, "upload", "add");
        WebWriter.jsonWriter(context.response, JsonUtil.beanToJson(responseObject));
    }

}
