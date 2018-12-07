package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

/**
 * td_user
 */
@Table(name = "td_user")
public class User extends BasePojo {

    /**
     * 用户id
     */
    @Id
    private String userId;
    /**
     * 密码
     */
    private String password;
    /**
     * 微信id
     */
    private String openId;
    /**
     * 微信昵称
     */
    private String wxNickname;
    /**
     * 昵称（姓名）
     */
    private String uNickname;
    /**
     * 微信头像
     */
    private String headUrl;
    /**
     * 用户更改后的头像
     */
    private String changeHeadUrl;
    /**
     * 性别（0为女1为男）
     */
    private Integer uSex;
    /**
     *
     */
    private Date ubirthday;
    /**
     * 身份证号
     */
    private String uCard;
    /**
     * 用户电话号码
     */
    private String uPhone;
    /**
     * 我的余额
     */
    private BigDecimal uBalance;
    /**
     * 缴费状态（0未交费，1已缴费）
     */
    private Integer isPay;
    /**
     * 缴费状态（0不允许提现，1允许提现）
     */
    private Integer isPutForward;
    /**
     * 是否是vip（0普通用户，1普通客户经理，2vip客户经理）
     */
    private Integer isVip;
    /**
     * 是否实名认证（0未认证，1已认证）
     */
    private Integer isAuthentication;
    /**
     * 关联用户等级表
     */
    private String utypeId;
    /**
     * 等级名称
     */
    private String utypeName;
    /**
     * 关联行业类型表
     */
    private String egidId;
    /**
     * 行业类型名称
     */

    private String egidName;
    /**
     * 用户所在区域（省，市，区）
     */
    private String addressName;
    /**
     * 省
     */
    private String provinceCitycode;
    /**
     * 市
     */
    private String cityCitycode;
    /**
     * 区
     */
    private String areaCitycode;
    /**
     * 会员号
     */
    private String memberid;
    /**
     * 信用值分数
     */
    private Integer creditrdNum;
    /**
     * 推荐人id
     */
    private String userrefereeUid;
    /**
     * 推荐人名字
     */
    private String userrefereeName;
    /**
     * 经理人
     */
    private String usermanagerUid;
    /**
     * 经理人名字
     */
    private String usermanagerName;
    /**
     * 主办方简介--身份证正面
     */
    private String introductionIdfront;
    /**
     * 主办方简介--身份证反面
     */
    private String introductionIdback;
    /**
     * 主办方简介--营业执照
     */
    private String introductionLicense;
    /**
     * 用户真实名称
     */
    private String uName;
    /**
     * 主办方发布活动简介类型 0，为个人，1为企业
     */
    private Integer userType;
    /**
     * 发布活动支付认证状态0，为未支付 1，为已经支付
     */
    private Integer pubactivitiesIspay;
    /**
     * 用户是否已经激活，0未注册（即微信授权未注册的游客)，1为已经注册（未激活），2为已经激活,
     */
    private Integer userIsactivation;
    /**
     * 会员天数
     */
    private Integer memberDays;
    /**
     * 会员开始时间
     */
    private Date memberStartTime;
    /**
     * 会员结束时间
     */
    private Date memberEndTime;
    /**
     * 是否体验，0为不体验，1为体验，2体验结束
     */
    private Integer resourceStrategyIsexperience;
    /**
     * 体验VIP客户经理，体验开始时间
     */
    private Date experienceTime;
    /**
     * 体验VIP客户经理，体验结束时间
     */
    private Date experienceEndTime;
    /**
     * 关联用户类型表
     */
    private String experienceutypeId;
    /**
     * 备注
     */
    private String remark;
    /**
     * 是否封户，默认0，未封户，1为封户
     */
    private Integer closedUserStatus;
    /**
     * 资源人总数
     */
    @Transient
    private Integer resourceNums;
    /**
     * 专业职称
     */
    private String professionalTitle;
    /**
     * 我能提供
     */

    private String canProvide;
    /**
     * 我需要什么
     */
    private String need;
    /**
     * 人生信念
     */
    private String beliefInLife;
    /**
     * 资源锁定时间
     */
    private Date resourceAddTime;

    /**
     * 创建用户
     *
     * @return
     */
    public static User getInstance() {
        return new User();
    }

    public Date getResourceAddTime() {
        return resourceAddTime;
    }

    public void setResourceAddTime(Date resourceAddTime) {
        this.resourceAddTime = resourceAddTime;
    }

    public String getWxNickname() {
        return wxNickname;
    }

    public void setWxNickname(String wxNickname) {
        this.wxNickname = wxNickname;
    }

    public String getProfessionalTitle() {
        return professionalTitle;
    }

    public void setProfessionalTitle(String professionalTitle) {
        this.professionalTitle = professionalTitle;
    }

    public String getCanProvide() {
        return canProvide;
    }

    public void setCanProvide(String canProvide) {
        this.canProvide = canProvide;
    }

    public String getNeed() {
        return need;
    }

    public void setNeed(String need) {
        this.need = need;
    }

    public String getBeliefInLife() {
        return beliefInLife;
    }

    public void setBeliefInLife(String beliefInLife) {
        this.beliefInLife = beliefInLife;
    }

    public String getEgidName() {
        return egidName;
    }

    public void setEgidName(String egidName) {
        this.egidName = egidName;
    }

    public String getChangeHeadUrl() {
        return changeHeadUrl;
    }

    public void setChangeHeadUrl(String changeHeadUrl) {
        this.changeHeadUrl = changeHeadUrl;
    }

    public String getUtypeName() {
        return utypeName;
    }

    public void setUtypeName(String utypeName) {
        this.utypeName = utypeName;
    }

    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(String addressName) {
        this.addressName = addressName;
    }

    public String getProvinceCitycode() {
        return provinceCitycode;
    }

    public void setProvinceCitycode(String provinceCitycode) {
        this.provinceCitycode = provinceCitycode;
    }

    public String getCityCitycode() {
        return cityCitycode;
    }

    public void setCityCitycode(String cityCitycode) {
        this.cityCitycode = cityCitycode;
    }

    public String getAreaCitycode() {
        return areaCitycode;
    }

    public void setAreaCitycode(String areaCitycode) {
        this.areaCitycode = areaCitycode;
    }

    public Integer getResourceNums() {
        return resourceNums;
    }

    public void setResourceNums(Integer resourceNums) {
        this.resourceNums = resourceNums;
    }

    /**
     * 用户id
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 用户id
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 微信id
     *
     * @return open_id
     */
    public String getOpenId() {
        return openId;
    }

    /**
     * 微信id
     *
     * @param openId
     */
    public void setOpenId(String openId) {
        this.openId = openId == null ? null : openId.trim();
    }

    /**
     * 昵称
     *
     * @return u_nickname
     */
    public String getuNickname() {
        return uNickname;
    }

    /**
     * 昵称
     *
     * @param uNickname
     */
    public void setuNickname(String uNickname) {
        this.uNickname = uNickname == null ? null : uNickname.trim();
    }

    /**
     * 头像
     *
     * @return head_url
     */
    public String getHeadUrl() {
        return headUrl;
    }

    /**
     * 头像
     *
     * @param headUrl
     */
    public void setHeadUrl(String headUrl) {
        this.headUrl = headUrl == null ? null : headUrl.trim();
    }

    /**
     * 性别（0为女1为男）
     *
     * @return u_sex
     */
    public Integer getuSex() {
        return uSex;
    }

    /**
     * 性别（0为女1为男）
     *
     * @param uSex
     */
    public void setuSex(Integer uSex) {
        this.uSex = uSex;
    }

    /**
     * @return ubirthday
     */
    public Date getUbirthday() {
        return ubirthday;
    }

    /**
     * @param ubirthday
     */
    public void setUbirthday(Date ubirthday) {
        this.ubirthday = ubirthday;
    }

    /**
     * 身份证号
     *
     * @return u_card
     */
    public String getuCard() {
        return uCard;
    }

    /**
     * 身份证号
     *
     * @param uCard
     */
    public void setuCard(String uCard) {
        this.uCard = uCard == null ? null : uCard.trim();
    }

    /**
     * 用户电话号码
     *
     * @return u_phone
     */
    public String getuPhone() {
        return uPhone;
    }

    /**
     * 用户电话号码
     *
     * @param uPhone
     */
    public void setuPhone(String uPhone) {
        this.uPhone = uPhone == null ? null : uPhone.trim();
    }

    /**
     * 我的余额
     *
     * @return u_balance
     */
    public BigDecimal getuBalance() {
        return uBalance;
    }

    /**
     * 我的余额
     *
     * @param uBalance
     */
    public void setuBalance(BigDecimal uBalance) {
        this.uBalance = uBalance;
    }

    /**
     * 缴费状态（0未交费，1已缴费）
     *
     * @return is_pay
     */
    public Integer getIsPay() {
        return isPay;
    }

    /**
     * 缴费状态（0未交费，1已缴费）
     *
     * @param isPay
     */
    public void setIsPay(Integer isPay) {
        this.isPay = isPay;
    }

    /**
     * 缴费状态（0不允许提现，1允许提现）
     */
    public Integer getIsPutForward() {
        return isPutForward;
    }

    /**
     * 缴费状态（0不允许提现，1允许提现）
     *
     * @param isPutForward
     */
    public void setIsPutForward(Integer isPutForward) {
        this.isPutForward = isPutForward;
    }

    /**
     * 是否是vip（0普通用户，1普通客户经理，2vip客户经理）
     *
     * @return is_vip
     */
    public Integer getIsVip() {
        return isVip;
    }

    /**
     * 是否是vip（0普通用户，1 vip客户经理）
     *
     * @param isVip
     */
    public void setIsVip(Integer isVip) {
        this.isVip = isVip;
    }

    /**
     * 是否实名认证（0未认证，1已认证）
     *
     * @return is_authentication
     */
    public Integer getIsAuthentication() {
        return isAuthentication;
    }

    /**
     * 是否实名认证（0未认证，1已认证）
     *
     * @param isAuthentication
     */
    public void setIsAuthentication(Integer isAuthentication) {
        this.isAuthentication = isAuthentication;
    }

    /**
     * 关联用户类型表
     *
     * @return utype_id
     */
    public String getUtypeId() {
        return utypeId;
    }

    /**
     * 关联用户类型表
     *
     * @param utypeId
     */
    public void setUtypeId(String utypeId) {
        this.utypeId = utypeId == null ? null : utypeId.trim();
    }

    /**
     * 关联行业类型表
     *
     * @return egid_id
     */
    public String getEgidId() {
        return egidId;
    }

    /**
     * 关联行业类型表
     *
     * @param egidId
     */
    public void setEgidId(String egidId) {
        this.egidId = egidId == null ? null : egidId.trim();
    }

    /**
     * 会员号
     *
     * @return memberid
     */
    public String getMemberid() {
        return memberid;
    }

    /**
     * 会员号
     *
     * @param memberid
     */
    public void setMemberid(String memberid) {
        this.memberid = memberid == null ? null : memberid.trim();
    }

    /**
     * 信用值分数
     *
     * @return creditrd_num
     */
    public Integer getCreditrdNum() {
        return creditrdNum;
    }

    /**
     * 信用值分数
     *
     * @param creditrdNum
     */
    public void setCreditrdNum(Integer creditrdNum) {
        this.creditrdNum = creditrdNum;
    }

    /**
     * 推荐人id
     *
     * @return userReferee_uid
     */
    public String getUserrefereeUid() {
        return userrefereeUid;
    }

    /**
     * 推荐人id
     *
     * @param userrefereeUid
     */
    public void setUserrefereeUid(String userrefereeUid) {
        this.userrefereeUid = userrefereeUid == null ? null : userrefereeUid.trim();
    }

    /**
     * 经理人
     *
     * @return userManager_uid
     */
    public String getUsermanagerUid() {
        return usermanagerUid;
    }

    /**
     * 经理人
     *
     * @param usermanagerUid
     */
    public void setUsermanagerUid(String usermanagerUid) {
        this.usermanagerUid = usermanagerUid == null ? null : usermanagerUid.trim();
    }

    public String getUsermanagerName() {
        return usermanagerName;
    }

    public void setUsermanagerName(String usermanagerName) {
        this.usermanagerName = usermanagerName;
    }

    public String getUserrefereeName() {
        return userrefereeName;
    }

    public void setUserrefereeName(String userrefereeName) {
        this.userrefereeName = userrefereeName;
    }

    /**
     * 主办方简介--身份证正面
     *
     * @return introduction_idfront
     */
    public String getIntroductionIdfront() {
        return introductionIdfront;
    }

    /**
     * 主办方简介--身份证正面
     *
     * @param introductionIdfront
     */
    public void setIntroductionIdfront(String introductionIdfront) {
        this.introductionIdfront = introductionIdfront == null ? null : introductionIdfront.trim();
    }

    /**
     * 主办方简介--身份证反面
     *
     * @return introduction_idback
     */
    public String getIntroductionIdback() {
        return introductionIdback;
    }

    /**
     * 主办方简介--身份证反面
     *
     * @param introductionIdback
     */
    public void setIntroductionIdback(String introductionIdback) {
        this.introductionIdback = introductionIdback == null ? null : introductionIdback.trim();
    }

    /**
     * 主办方简介--营业执照
     *
     * @return introduction_license
     */
    public String getIntroductionLicense() {
        return introductionLicense;
    }

    /**
     * 主办方简介--营业执照
     *
     * @param introductionLicense
     */
    public void setIntroductionLicense(String introductionLicense) {
        this.introductionLicense = introductionLicense == null ? null : introductionLicense.trim();
    }

    /**
     * 主办方发布活动简介类型0，为个人，1为企业
     *
     * @return user_type
     */
    public Integer getUserType() {
        return userType;
    }

    /**
     * 主办方发布活动简介类型0，为个人，1为企业
     *
     * @param userType
     */
    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    /**
     * 发布活动支付认证状态0，为未支付1，为已经支付
     *
     * @return pubactivities_ispay
     */
    public Integer getPubactivitiesIspay() {
        return pubactivitiesIspay;
    }

    /**
     * 发布活动支付认证状态0，为未支付1，为已经支付
     *
     * @param pubactivitiesIspay
     */
    public void setPubactivitiesIspay(Integer pubactivitiesIspay) {
        this.pubactivitiesIspay = pubactivitiesIspay;
    }

    /**
     * 用户是否已经激活，0未注册（即微信授权未注册的游客)，1为已经注册（未激活），2为已经激活,
     *
     * @return user_isactivation
     */
    public Integer getUserIsactivation() {
        return userIsactivation;
    }

    /**
     * 用户是否已经激活，0未注册（即微信授权未注册的游客)，1为已经注册（未激活），2为已经激活,
     *
     * @param userIsactivation
     */
    public void setUserIsactivation(Integer userIsactivation) {
        this.userIsactivation = userIsactivation;
    }

    /**
     * 会员天数
     *
     * @return member_days
     */
    public Integer getMemberDays() {
        return memberDays;
    }

    /**
     * 会员天数
     *
     * @param memberDays
     */
    public void setMemberDays(Integer memberDays) {
        this.memberDays = memberDays;
    }

    /**
     * 资源攻略表：是否体验，0为不体验，1为体验，2体验结束
     *
     * @return resource_strategy_isexperience
     */
    public Integer getResourceStrategyIsexperience() {
        return resourceStrategyIsexperience;
    }

    /**
     * 资源攻略表：是否体验，0为不体验，1为体验，2体验结束
     *
     * @param resourceStrategyIsexperience
     */
    public void setResourceStrategyIsexperience(Integer resourceStrategyIsexperience) {
        this.resourceStrategyIsexperience = resourceStrategyIsexperience;
    }

    /**
     * 体验VIP客户经理，体验开始时间
     *
     * @return experience_time
     */
    public Date getExperienceTime() {
        return experienceTime;
    }

    /**
     * 体验VIP客户经理，体验开始时间
     *
     * @param experienceTime
     */
    public void setExperienceTime(Date experienceTime) {
        this.experienceTime = experienceTime;
    }

    /**
     * 关联用户类型表
     *
     * @return experienceutype_id
     */
    public String getExperienceutypeId() {
        return experienceutypeId;
    }

    /**
     * 关联用户类型表
     *
     * @param experienceutypeId
     */
    public void setExperienceutypeId(String experienceutypeId) {
        this.experienceutypeId = experienceutypeId == null ? null : experienceutypeId.trim();
    }

    /**
     * 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 密码
     *
     * @param password
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * 备注
     *
     * @return remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 备注
     *
     * @param remark
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     * 是否封户
     *
     * @return
     */
    public Integer getClosedUserStatus() {
        return closedUserStatus;
    }

    /**
     * 是否封户
     *
     * @param closedUserStatus
     */
    public void setClosedUserStatus(Integer closedUserStatus) {
        this.closedUserStatus = closedUserStatus;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Date getMemberStartTime() {
        return memberStartTime;
    }

    public void setMemberStartTime(Date memberStartTime) {
        this.memberStartTime = memberStartTime;
    }

    public Date getMemberEndTime() {
        return memberEndTime;
    }

    public void setMemberEndTime(Date memberEndTime) {
        this.memberEndTime = memberEndTime;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public Date getExperienceEndTime() {
        return experienceEndTime;
    }

    public void setExperienceEndTime(Date experienceEndTime) {
        this.experienceEndTime = experienceEndTime;
    }

    public void init() {
        this.userId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        //初始化发布活动支付认证状态0
        this.setPubactivitiesIspay(0);
        //初始化用户未注册
        this.setUserIsactivation(0);
        //初始化会员天数
        this.setMemberDays(0);
        //初始化是否体验
        this.setResourceStrategyIsexperience(0);
        //初始化缴费状态 0
        this.setIsPay(0);
        //设置不允许提现
        this.setIsPutForward(0);
        //初始化不是vip
        this.setIsVip(0);
        //初始化未实名认证
        this.setIsAuthentication(0);
        //设置未封户
        this.setClosedUserStatus(0);
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }
}