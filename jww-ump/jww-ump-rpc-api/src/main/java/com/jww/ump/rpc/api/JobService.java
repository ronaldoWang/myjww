package com.jww.ump.rpc.api;

import cn.hutool.core.util.StrUtil;
import cn.hutool.cron.Scheduler;
import com.jww.common.core.exception.BusinessException;
import com.jww.common.core.model.PageModel;
import com.jww.ump.model.SysScheduleJobModel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by ThinkPad on 2018/9/18.
 */
public interface JobService {

    /**
     * 分页查询
     *
     * @return
     */
    public PageModel<SysScheduleJobModel> list(int page, int size);

    /**
     * 添加
     *
     * @param jobName
     * @param jobGroup
     * @param cronExpression
     * @param jobDescription
     */
    public SysScheduleJobModel addJob(String jobName, String jobGroup, String cronExpression, String jobDescription);

    /**
     * 修改
     *
     * @param jobName
     * @param jobGroup
     * @param cronExpression
     * @param jobDescription
     */
    public SysScheduleJobModel edit(String jobName, String jobGroup, String cronExpression, String jobDescription);

    /**
     * 删除
     *
     * @param jobName
     * @param jobGroup
     */
    public void delete(String jobName, String jobGroup);

    /**
     * 暂停
     *
     * @param jobName
     * @param jobGroup
     */
    public void pause(String jobName, String jobGroup);

    /**
     * 重启
     *
     * @param jobName
     * @param jobGroup
     */
    public void resume(String jobName, String jobGroup);

    /**
     * 立即执行
     *
     * @param jobName
     * @param jobGroup
     */
    public void trigger(String jobName, String jobGroup);


}
