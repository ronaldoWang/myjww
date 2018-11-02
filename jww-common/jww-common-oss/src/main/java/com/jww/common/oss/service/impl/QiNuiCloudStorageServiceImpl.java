package com.jww.common.oss.service.impl;

import com.google.gson.Gson;
import com.jww.common.core.exception.BusinessException;
import com.jww.common.oss.OssProperties;
import com.jww.common.oss.service.CloudStorageService;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;

import java.io.InputStream;

public class QiNuiCloudStorageServiceImpl implements CloudStorageService {

    private OssProperties ossProperties;
    private UploadManager uploadManager;
    private BucketManager bucketManager;
    private Auth auth;
    private String upToken;

    public QiNuiCloudStorageServiceImpl(OssProperties ossProperties) {
        this.ossProperties = ossProperties;
        // 初始化
        init();
    }

    private void init() {
        Configuration cfg = new Configuration(Zone.zone0());//设置华东
        uploadManager = new UploadManager(cfg);//上传管理类
        auth = Auth.create(ossProperties.getAccessKeyId(), ossProperties.getAccessKeySecret());//权限auth
        bucketManager = new BucketManager(auth, cfg);
    }

    @Override
    public String upload(byte[] data, String path) {
        upToken = auth.uploadToken(ossProperties.getBucketName());//重新获取token
        StringBuffer sb = new StringBuffer();
        try {
            Response response = uploadManager.put(data, path, upToken);
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            sb.append(ossProperties.getDomain()).append(putRet.key);
        } catch (Exception e) {
            throw new BusinessException("七牛云上传文件失败，请检查配置信息", e);
        }
        return sb.toString();
    }

    @Override
    public String uploadSuffix(byte[] data, String suffix) {
        throw new UnsupportedOperationException();
    }

    @Override
    public String upload(InputStream inputStream, String path) {
        throw new UnsupportedOperationException();
    }

    @Override
    public String uploadSuffix(InputStream inputStream, String suffix) {
        throw new UnsupportedOperationException();
    }

    @Override
    public InputStream download(String path) {
        throw new UnsupportedOperationException();
    }

    @Override
    public void delete(String path) {
        try {
            bucketManager.delete(ossProperties.getBucketName(), path);
        } catch (QiniuException e) {
            e.printStackTrace();
        }
    }
}
