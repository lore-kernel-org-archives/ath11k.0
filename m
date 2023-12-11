Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814C8C4167B
	for <ath11k@archiver.kernel.org>; Mon, 11 Dec 2023 03:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbGhdVTcI/aVomh6hJpeZFwWbflJrOoOloLwZ+SLRM0=; b=B2/33kME6aSRQtdjISz+scifuP
	od5mNaGUIhxPmLYDkWWcxMv6/s/Pg/qH84kjVqUuJr/3mUZQQfaqzURDeyJWRFUirR3cNIQDkwpeB
	u1UjZtPBnF94jBq4xG+zOkg4d7Fj7P24tZTvQatORbj4oZ3XxUkgDJ8rQSdq1JiAzlWy4RZOpVX3d
	T8VZVmGjT5lxxI13WPwCpr3mFdEmH6Kwvw1W76eHCGGAczV2kcH+SWdx9IKUAR5T1kH/ijwRCf52K
	LE4OzZiZA9cQRozP0Ltu8yBN+T/BBxHKqlb/tjARKpLXR2+sX+IHcMGv+ECGGh7mGREh+Spx6Ddu0
	W2sr412Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCXPf-003vuH-2G;
	Mon, 11 Dec 2023 03:57:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCXPb-003vta-1N
	for ath11k@lists.infradead.org;
	Mon, 11 Dec 2023 03:56:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB3avmH007820;
	Mon, 11 Dec 2023 03:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cbGhdVTcI/aVomh6hJpeZFwWbflJrOoOloLwZ+SLRM0=; b=RK
	eaUVwZP+6wkG3Yq2rH4cLfG+hHNgmuCDyrGfQtIe1hn+jSKbMGhK/JvDRBwhF3ag
	Wm0FU8KzPL4R6eEtEK1gx/ncehB2LNdraDxXgl3cZ3GzoINhEUPbW7F3gfoNCGWg
	xN+mIDr6cofJDhrxMn358HbpT3UjxDTmSgYgRuMlpNcvw8FgyNRVRFib/esRPaZ2
	hQO0kWa7TOQ0rVZuLzzc6LUHdd9BB+VlXJTQBH+2vyGZKVcBFfsNlTtKQJ+hga5D
	oM7g0lwcpjd9WAyv+57KoUHWMr3UNXTS3meuQAVXlbyzYlKsdSk0fG7Si6gNNJ4w
	D0X3IY9wplzve0dtfR7w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvney2752-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 03:56:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BB3usMe014818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 03:56:54 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 10 Dec
 2023 19:56:52 -0800
Message-ID: <2c70dfd6-9e0e-468b-8585-252f0c23ff0a@quicinc.com>
Date: Mon, 11 Dec 2023 11:56:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/12] wifi: ath11k: store cur_regulatory_info for each
 radio
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231204081323.5582-1-quic_bqiang@quicinc.com>
 <20231204081323.5582-3-quic_bqiang@quicinc.com>
 <db8b0734-8e4e-43f9-ba48-b3df2d33e29e@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <db8b0734-8e4e-43f9-ba48-b3df2d33e29e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2nodsRR9MpKM83N-HDzKkYi1CmYoEwlg
X-Proofpoint-ORIG-GUID: 2nodsRR9MpKM83N-HDzKkYi1CmYoEwlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_195656_400895_3387B0B7 
X-CRM114-Status: GOOD (  18.10  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 12/7/2023 11:15 AM, Aditya Kumar Singh wrote:
> On 12/4/23 13:43, Baochen Qiang wrote:
>> --- a/drivers/net/wireless/ath/ath11k/mac.h
>> +++ b/drivers/net/wireless/ath/ath11k/mac.h
>> @@ -159,7 +159,6 @@ struct ath11k_vif *ath11k_mac_get_vif_up(struct 
>> ath11k_base *ab);
>>   struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, 
>> u32 vdev_id);
>>   struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, 
>> u32 pdev_id);
>> -
> 
> Irrelevant change w.r.t commit message?
> 
> 
>>   void ath11k_mac_drain_tx(struct ath11k *ar);
>>   void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
>>   int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
> ...
>> @@ -4749,6 +4749,11 @@ static int 
>> ath11k_wmi_tlv_ext_soc_hal_reg_caps_parse(struct ath11k_base *soc,
>>           soc->pdevs[0].pdev_id = 0;
>>       }
>> +    if (!soc->reg_info_store)
>> +        soc->reg_info_store = kcalloc(soc->num_radios,
>> +                          sizeof(*soc->reg_info_store),
>> +                          GFP_ATOMIC);
> What if this memory allocation request fails? Any negative case check 
> should be present?
> 
> 
>> +
>>       return 0;
>>   }
>> @@ -7071,33 +7076,54 @@ static bool ath11k_reg_is_world_alpha(char 
>> *alpha)
>>       return false;
>>   }
>> -static int ath11k_reg_chan_list_event(struct ath11k_base *ab,
>> -                      struct sk_buff *skb,
>> -                      enum wmi_reg_chan_list_cmd_type id)
>> +void ath11k_reg_reset_info(struct cur_regulatory_info *reg_info)
>>   {
>> -    struct cur_regulatory_info *reg_info = NULL;
>> -    struct ieee80211_regdomain *regd = NULL;
>> -    bool intersect = false;
>> -    int ret = 0, pdev_idx, i, j;
>> -    struct ath11k *ar;
>> +    int i, j;
>> -    reg_info = kzalloc(sizeof(*reg_info), GFP_ATOMIC);
>> -    if (!reg_info) {
>> -        ret = -ENOMEM;
>> -        goto fallback;
>> -    }
>> +    if (reg_info) {
>> +        kfree(reg_info->reg_rules_2ghz_ptr);
>> -    if (id == WMI_REG_CHAN_LIST_CC_ID)
>> -        ret = ath11k_pull_reg_chan_list_update_ev(ab, skb, reg_info);
>> -    else
>> -        ret = ath11k_pull_reg_chan_list_ext_update_ev(ab, skb, 
>> reg_info);
>> +        kfree(reg_info->reg_rules_5ghz_ptr);
>> -    if (ret) {
>> -        ath11k_warn(ab, "failed to extract regulatory info from 
>> received event\n");
>> -        goto fallback;
>> +        for (i = 0; i < WMI_REG_CURRENT_MAX_AP_TYPE; i++) {
>> +            kfree(reg_info->reg_rules_6ghz_ap_ptr[i]);
>> +            for (j = 0; j < WMI_REG_MAX_CLIENT_TYPE; j++)
>> +                kfree(reg_info->reg_rules_6ghz_client_ptr[i][j]);
>> +        }
>> +
>> +        memset(reg_info, 0, sizeof(*reg_info));
>>       }
>> +}
>> +
>> +static
>> +enum wmi_vdev_type ath11k_reg_get_ar_vdev_type(struct ath11k *ar)
>> +{
>> +    struct ath11k_vif *arvif;
>> +
>> +    /* Currently each struct ath11k maps to one struct 
>> ieee80211_hw/wiphy
>> +     * and one struct ieee80211_regdomain, so it could only store one 
>> group
>> +     * reg rules. It means muti-interface concurrency in the same 
>> ath11k is
>> +     * not support for the regdomain. So get the vdev type of the 
>> first entry
>> +     * now. After concurrency support for the regdomain, this should 
>> change.
>> +     */
>> +    arvif = list_first_entry_or_null(&ar->arvifs, struct ath11k_vif, 
>> list);
>> +    if (arvif)
>> +        return arvif->vdev_type;
>> +
>> +    return WMI_VDEV_TYPE_UNSPEC;
>> +}
>> +
>> +int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
>> +                struct cur_regulatory_info *reg_info,
>> +                enum ieee80211_ap_reg_power power_type)
>> +{
>> +    struct ieee80211_regdomain *regd;
>> +    bool intersect = false;
>> +    int pdev_idx;
>> +    struct ath11k *ar;
>> +    enum wmi_vdev_type vdev_type;
>> -    ath11k_dbg(ab, ATH11K_DBG_WMI, "event reg chan list id %d", id);
>> +    ath11k_dbg(ab, ATH11K_DBG_WMI, "event reg handle chan list");
> 
> I believe this debug was helpful in the sense it showed which type of 
> event came. Can't we still print this somehow? Or may be somewhere else?You can check the event type from logs of 
ath11k_pull_reg_chan_list_update_ev() and 
ath11k_pull_reg_chan_list_ext_update_ev().

