/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: GetService
 * Author:   yuanyuana
 * Date:     2018/10/15 16:47
 * Description: service获取类（方便service的灵活使用）
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service.baseservice;

import com.yixunlian.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br>
 * 〈service获取类（方便service的灵活使用）〉
 *
 * @author yuanyuana
 * @create 2018/10/15
 * @since 1.0.0
 */
@Service
public class GetService {

    @Resource(name = "redisService")
    private RedisService rService;
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "uhobbyService")
    private UhobbyService uhobbyService;
    @Resource(name = "userandhobbyService")
    private UserandhobbyService userandhobbyService;
    @Resource(name = "engagendustryService")
    private EngagendustryService engagendustryServer;
    @Resource(name = "everjoinService")
    private EverjoinService everjoinService;
    @Resource(name = "personalneedsService")
    private PersonalneedsService personalneedsService;
    @Resource(name = "userandpersonalneedsService")
    private UserandpersonalneedsService userandpersonalneedsService;
    @Resource(name = "activityService")
    private ActivityService activityService;
    @Resource(name = "utypeService")
    private UtypeService utypeService;
    @Resource(name = "systembulletinService")
    private SystembulletinService systembulletinService;
    @Autowired
    private UCollectionService uCollectionService;
    @Resource(name = "reportService")
    private ReportService reportService;
    @Resource(name = "sysUserService")
    private SysUserService sysUserService;
    @Resource(name = "roleService")
    private RoleService roleService;
    @Resource(name = "userprofitService")
    private UserprofitService userprofitService;
    @Resource(name = "umoneyService")
    private UmoneyService umoneyService;
    @Resource(name = "paymentflowService")
    private PaymentflowService paymentflowService;
    @Resource(name = "taxrevenueService")
    private TaxrevenueService taxrevenueService;
    @Resource(name = "feedbackadviceService")
    private FeedbackadviceService feedbackadviceService;
    @Resource(name = "systemHelpService")
    private SystemHelpService systemHelpService;
    @Resource(name = "userExperienceVipService")
    private UserExperienceVipService userExperienceVipService;
    @Resource(name = "activitysignService")
    private ActivitysignService activitysignService;
    @Resource(name = "complaintService")
    private ComplaintService complaintService;
    @Resource(name = "qrcodeService")
    private QrcodeService qrcodeService;
    @Resource(name = "uhobbyandactivitycategoryService")
    private UhobbyandactivitycategoryService uhobbyandactivitycategoryService;
    @Resource(name = "shareService")
    private ShareService shareService;
    @Resource(name = "uenrollandactivityService")
    private UenrollandactivityService uenrollandactivityService;
    @Resource(name = "advertisementImageService")
    private AdvertisementImageService advertisementImageService;
    @Resource(name = "journalismService")
    private JournalismService journalismService;
    @Resource(name = "organizerInfoService")
    private OrganizerInfoService organizerInfoService;
    @Resource(name = "extractprojectService")
    private ExtractprojectService extractprojectService;
    @Resource(name = "activityChargeItemService")
    private ActivityChargeItemService activityChargeItemService;
    @Resource(name = "uenrollandactivityService")
    private UenrollandactivityService ueService;

    public ActivityChargeItemService getActivityChargeItemService() {
        return activityChargeItemService;
    }

    public UenrollandactivityService getUeService() {
        return ueService;
    }

    public ExtractprojectService getExtractprojectService() {
        return extractprojectService;
    }

    public OrganizerInfoService getOrganizerInfoService() {
        return organizerInfoService;
    }

    public JournalismService getJournalismService() {
        return journalismService;
    }

    public AdvertisementImageService getAdvertisementImageService() {
        return advertisementImageService;
    }

    public UenrollandactivityService getUenrollandactivityService() {
        return uenrollandactivityService;
    }

    public RedisService getrService() {
        return rService;
    }

    public UserService getUserService() {
        return userService;
    }

    public UhobbyService getUhobbyService() {
        return uhobbyService;
    }

    public UserandhobbyService getUserandhobbyService() {
        return userandhobbyService;
    }

    public EngagendustryService getEngagendustryServer() {
        return engagendustryServer;
    }

    public EverjoinService getEverjoinService() {
        return everjoinService;
    }

    public PersonalneedsService getPersonalneedsService() {
        return personalneedsService;
    }

    public UserandpersonalneedsService getUserandpersonalneedsService() {
        return userandpersonalneedsService;
    }

    public ActivityService getActivityService() {
        return activityService;
    }

    public UtypeService getUtypeService() {
        return utypeService;
    }

    public SystembulletinService getSystembulletinService() {
        return systembulletinService;
    }

    public UCollectionService getuCollectionService() {
        return uCollectionService;
    }

    public ReportService getReportService() {
        return reportService;
    }

    public SysUserService getSysUserService() {
        return sysUserService;
    }

    public RoleService getRoleService() {
        return roleService;
    }

    public UserprofitService getUserprofitService() {
        return userprofitService;
    }

    public UmoneyService getUmoneyService() {
        return umoneyService;
    }

    public PaymentflowService getPaymentflowService() {
        return paymentflowService;
    }

    public TaxrevenueService getTaxrevenueService() {
        return taxrevenueService;
    }

    public FeedbackadviceService getFeedbackadviceService() {
        return feedbackadviceService;
    }

    public SystemHelpService getSystemHelpService() {
        return systemHelpService;
    }

    public UserExperienceVipService getUserExperienceVipService() {
        return userExperienceVipService;
    }

    public ActivitysignService getActivitysignService() {
        return activitysignService;
    }

    public ComplaintService getComplaintService() {
        return complaintService;
    }

    public QrcodeService getQrcodeService() {
        return qrcodeService;
    }

    public UhobbyandactivitycategoryService getUhobbyandactivitycategoryService() {
        return uhobbyandactivitycategoryService;
    }

    public ShareService getShareService() {
        return shareService;
    }
}
