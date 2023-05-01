Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51ABC77B73
	for <ath11k@archiver.kernel.org>; Mon,  1 May 2023 17:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Icn4A8WdQWO4SIog6frid1HczoSFlbZS3DErNyvDgE=; b=rz5A3rvdDOX2sv
	N/FATy/TiNsmWwVbyUi2Ae2Rs2yJbQ0N8fi0toDINOUPu1xd/Ch98IzbGNvU9ModXU/xwYtxk+XTl
	lYOFK+tawmcwsm8YfSKKrepEdEwVLkN/+RbT3B4AXlktldm/YFTsxH3L3K0ZeWmpQ/hnLMdYrmorv
	RS/lSbjJFFGso1uBa88oAa123nQ1RguVRHbxg4NB0svCZxCjAuZWGrUztxFLb7gbwqYjpVbGfoZ+G
	hyWHgUiDfROkt5S3i/kGKLtNE71HoyUcXL11r13tK9VYMqb7HNyK61nPSc3VDg8BrbxtKtERM3LVj
	46ZZMQQJ2lj45+sg5/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptXWQ-00GQH7-2b;
	Mon, 01 May 2023 17:41:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptXWN-00GQFQ-1A
	for ath11k@lists.infradead.org;
	Mon, 01 May 2023 17:41:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 341GbeHb026549;
	Mon, 1 May 2023 17:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YujqNiIQkBsqwr/6Nmyu69bd6d5L4En006EWS4vVZxU=;
 b=ppOqXGRCcmB7au+ANlzrOJ+JsikRjlxVfAfEdgruzidd9DRnVUCqb3EZKJO7c8GPFNMD
 sGYpEwdUwEor4tcNKyqJCxDwtzcqlVk/pVzrr1rKt+vFwBuPlL+tgvHK7TltHHdcNtwv
 WBTmHzRxrRMuu6A0+Q96IizCWvBUCJ9RXcfQViHLUmyCGc5M8m5s7rKFfAwX9pUOgWnO
 7QRUB99VVV08sGBORx1ZmpuKwb0KG7yYWYMYgLWDQJdtSonZSZs+IHxnwMzR/z4PxGOe
 Nfe4kFGdLpwS+oYKcKY62eq3jhWwiUGqVLTmevMxTL4c4ujxnGl6uyelsVjk3cpYS0kX fg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qa0a39ud5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 May 2023 17:41:03 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 341Hf2JX015785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 May 2023 17:41:02 GMT
Received: from [10.110.95.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 1 May 2023
 10:41:02 -0700
Message-ID: <b9f98415-46f5-7b9e-ba61-9b11a4498a6c@quicinc.com>
Date: Mon, 1 May 2023 10:41:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/7] wifi: ath11k: MBSSID parameter configuration in AP
 mode
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230405221648.17950-1-quic_alokad@quicinc.com>
 <20230405221648.17950-5-quic_alokad@quicinc.com> <87leibqme3.fsf@kernel.org>
Content-Language: en-US
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <87leibqme3.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nzyJScSxZScxn1d9rzUY5XvMOLErDVGG
X-Proofpoint-GUID: nzyJScSxZScxn1d9rzUY5XvMOLErDVGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-01_10,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=813 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305010144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_104107_422588_6562FDBB 
X-CRM114-Status: GOOD (  17.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 4/28/2023 10:37 PM, Kalle Valo wrote:
> Aloka Dixit <quic_alokad@quicinc.com> writes:
> 
>> Include MBSSID parameters in WMI vdev up operation.
>>
>> Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
>> Co-developed-by: John Crispin <john@phrozen.org>
>> Signed-off-by: John Crispin <john@phrozen.org>
>> ---
> 
> [...]
> 
>> @@ -7153,8 +7161,13 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
>>   			ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
>>   				    ret);
>>   
>> +		if (arvif->vif->mbssid_tx_vif)
>> +			tx_arvif = (struct ath11k_vif *)arvif->vif->mbssid_tx_vif->drv_priv;
> 
> This had a warning:
> 
> drivers/net/wireless/ath/ath11k/mac.c:7200: line length of 92 exceeds 90 columns
> 
> In the pending branch I fixed it like this:
> 
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -7143,6 +7143,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
>   {
>          struct ath11k_base *ab = ar->ab;
>          struct ath11k_vif *arvif, *tx_arvif = NULL;
> +       struct ieee80211_vif *mbssid_tx_vif;
>          int ret;
>          int i;
>          bool monitor_vif = false;
> @@ -7196,8 +7197,10 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
>                          ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
>                                      ret);
>   
> -               if (arvif->vif->mbssid_tx_vif)
> -                       tx_arvif = (struct ath11k_vif *)arvif->vif->mbssid_tx_vif->drv_priv;
> +               mbssid_tx_vif = arvif->vif->mbssid_tx_vif;
> +               if (mbssid_tx_vif)
> +                       tx_arvif = (struct ath11k_vif *)mbssid_tx_vif->drv_priv;
> +
>                  ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
>                                           arvif->bssid,
>                                           tx_arvif ? tx_arvif->bssid : NULL,
> 
> Link to the commit:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c884238009e778a0c8202a5eb0a7f68b13200bde
> 

Thank you.

I saw the warning but couldn't decide between adding a new pointer 
variable and letting 2 extra characters for just one assignment.

What are your thoughts on changing the scripts to allow up to 100?
Although nl80211 and mac80211 scripts also don't allow that long currently.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
