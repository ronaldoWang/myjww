package com.jww.common.oss.service.impl;

import com.aliyun.oss.OSSClient;
import com.jww.common.core.exception.BusinessException;
import com.jww.common.oss.OssProperties;
import com.jww.common.oss.service.CloudStorageService;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

/**
 * 阿里云对象存储服务类
 *
 * @author haoxi.wang
 * @date 2018-01-31 14:58
 */
public class AliCloudStorageServiceImpl implements CloudStorageService {

    private OssProperties ossProperties;
    private OSSClient client;

    public AliCloudStorageServiceImpl(OssProperties ossProperties) {
        this.ossProperties = ossProperties;
        // 初始化
        init();
    }

    private void init() {
        client = new OSSClient(ossProperties.getEndPoint(), ossProperties.getAccessKeyId(),
                ossProperties.getAccessKeySecret());
    }

    public String upload(byte[] data, String path) {
        return upload(new ByteArrayInputStream(data), path);
    }

    public String upload(InputStream inputStream, String path) {
        try {
            client.putObject(ossProperties.getBucketName(), path, inputStream);
        } catch (Exception e) {
            throw new BusinessException("上传文件失败，请检查配置信息", e);
        }

        return ossProperties.getDomain() == null ? ossProperties.getEndPoint() : ossProperties.getDomain() + "/" + path;
    }

    public String uploadSuffix(byte[] data, String suffix) {
        return null;
    }

    public String uploadSuffix(InputStream inputStream, String suffix) {
        return null;
    }

    public InputStream download(String path) {
        return client.getObject(ossProperties.getBucketName(), path).getObjectContent();
    }

    public void delete(String path) {
        client.deleteObject(ossProperties.getBucketName(), path);
    }
}
