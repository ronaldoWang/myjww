package com.jww.ump.common.service;

import cn.hutool.core.util.StrUtil;
import com.jww.ump.common.utils.IdWorker;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * idWorker服务类
 *
 * @author kevin wang
 * @date 18/11/13 15:11:47
 */
@Service("idworkerService")
@Slf4j
public class IdworkerService {

    @Autowired
    IdWorker idWorker;

    /**
     * 前缀+idwordker
     *
     * @param str
     * @return
     */
    public String getIdWorkerPreSuffix(String str) {
        long workerId = idWorker.nextId();
        if (StrUtil.isBlank(str)) {
            return "" + workerId;
        } else {
            return str + workerId;
        }
    }

    /**
     * idwordker+后缀
     *
     * @param str
     * @return
     */
    public String getIdWorkerNextSuffix(String str) {
        long workerId = idWorker.nextId();
        if (StrUtil.isBlank(str)) {
            return "" + workerId;
        } else {
            return workerId + str;
        }
    }

    /**
     * 获取 id
     *
     * @return
     */
    public String getNext() {
        return "" + idWorker.nextId();
    }
}
