Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AD4C10F04
	for <ath11k@archiver.kernel.org>; Thu,  7 Dec 2023 03:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoqix0G1YsVyrfFqO9orjKPJIL1iVaKhmsD/Vmgc3is=; b=ZYjQVwQBJ5Dmc60HXWIsPBPWp0
	ptyvnavu0udWlhnsGbVaDYlnLQMElkjGBGALiUDHAR6gs+he02HA8coCfTt7fD7ffRX2ACHtylOCq
	Os/6w5h3B+2B3fGeifV9SsUL1brbcvy1uuxILbGs1PGq/01Zt9RlOZmgr0MCxsUJ1xqY4vKM8ambZ
	0GaOkbHA8fwWz+9HoeBUZUEEMpLO9n0ra3cI3sRmHzCcWp1uSintjTVa2a6Z1im2/Af2SM8oohxLW
	DVDEDd3WOclWHy7uNEfmKlMAZUz9mBWse59yylV6O9OoIPGlxzD8sWqdZGmwGX1f7dCiVJkDPtSHL
	KDuEBJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB4ra-00BkMZ-3A;
	Thu, 07 Dec 2023 03:15:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB4rY-00BkM0-2I
	for ath11k@lists.infradead.org;
	Thu, 07 Dec 2023 03:15:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B71eKQq008734;
	Thu, 7 Dec 2023 03:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zoqix0G1YsVyrfFqO9orjKPJIL1iVaKhmsD/Vmgc3is=;
 b=eqCkDhu/e0cwYtacAO+kEZaQ30J3twexe28g70VAfJNYHqgcmrugI8etRTlnEYtWM0pv
 PRIyTbU2PhuMcwb4rVCQciGkJvSe+yNM5GnbNuHuoRIiB1JSm/E+ahNvtlU7Xp1EJjN1
 w+4jfRFZdreVIUzhKZjzrrIaMEeNQLcb8JtSZtPgvdWDeYcFOeqDHRVqRZeWXzwqpurr
 YtXZOOaPkOxf/4YC73CVKXLTDXO/tMHi2wzLDDIyp/4MnJfFMwN8/S7vXWIU85bH87Le
 dDL5kizc8HkxOtNOJIQRbDT8JOEcMLGPqxRVsaiS8t41WQ6T/baYfW48VYT9pO1UV5qV Zw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu0w50j0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 03:15:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B73FhAX032369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Dec 2023 03:15:43 GMT
Received: from [10.216.30.117] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 19:15:42 -0800
Message-ID: <d3cad84f-2795-40c6-9e8b-2dd3c2ddd73b@quicinc.com>
Date: Thu, 7 Dec 2023 08:45:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/12] wifi: ath11k: update regulatory rules when
 interface added
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231204081323.5582-1-quic_bqiang@quicinc.com>
 <20231204081323.5582-5-quic_bqiang@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <20231204081323.5582-5-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SGkJFDMhXQ3A0Kx9RWBP95tlDQpXrEyJ
X-Proofpoint-ORIG-GUID: SGkJFDMhXQ3A0Kx9RWBP95tlDQpXrEyJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_22,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=947
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312070025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_191544_752999_6794AAC7 
X-CRM114-Status: GOOD (  12.36  )
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

On 12/4/23 13:43, Baochen Qiang wrote:

> --- a/drivers/net/wireless/ath/ath11k/mac.h
> +++ b/drivers/net/wireless/ath/ath11k/mac.h
> @@ -156,7 +156,6 @@ struct ath11k_vif *ath11k_mac_get_arvif_by_vdev_id(struct ath11k_base *ab,
>   u8 ath11k_mac_get_target_pdev_id(struct ath11k *ar);
>   u8 ath11k_mac_get_target_pdev_id_from_vif(struct ath11k_vif *arvif);
>   struct ath11k_vif *ath11k_mac_get_vif_up(struct ath11k_base *ab);
> -

Irrelevant change?

>   struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id);
>   struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
>   void ath11k_mac_drain_tx(struct ath11k *ar);
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index 6f0a35fcc9c1..9a0568676a74 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -9858,3 +9858,9 @@ int ath11k_wmi_sta_keepalive(struct ath11k *ar,
>   
>   	return ath11k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
>   }
> +
> +bool ath11k_wmi_supports_6ghz_cc_ext(struct ath11k *ar)
> +{
> +	return (test_bit(WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT,
> +			 ar->ab->wmi_ab.svc_map)) && ar->supports_6ghz;

What is the use of first parenthesis? I don't see a closing one after 
ar->supports_6ghz so its just guarding test_bit() which is not required.
I believe intention here was to guard whole expression?

