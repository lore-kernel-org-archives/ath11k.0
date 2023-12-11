Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB111C4332F
	for <ath11k@archiver.kernel.org>; Mon, 11 Dec 2023 21:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkcBVKA/a6ncrLS9B200BQa7oO+QJWSQs7ila1NiWcQ=; b=TZrgeaaquceVfgSPPob+iDekjL
	fT5jCOHX8iFbb1WP6Ivx2NCShiFmIV8v7Le172S4mYx0U0MQ85Q71XLKBtnN7xoo9odmJ244UdAeP
	1wr/tbQ/CbyFuWrS1MhgMihKi/9OpWKZB8PZ0HwTM8nKg7pS9r9ehqG05Wt7t4Zqgatlx2gSsaGLW
	1T3TCRiGQiRqz0EPHQ4Rv92cjLDpbcQg5obePEc4jWI+nIn5KURrT8f4y/D/A2imIclYthhHIYE+p
	VFKKLxkwBvCvqFEGD68k09En+risj13FWKSRn+MNiFJ2ZkNh+1U+w5JTiWXFpcTRh0gqdpaEOGjiu
	vddve8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCo6h-008msj-2X;
	Mon, 11 Dec 2023 21:46:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCo6e-008mp8-1X
	for ath11k@lists.infradead.org;
	Mon, 11 Dec 2023 21:46:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBLY7iV004858;
	Mon, 11 Dec 2023 21:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=fkcBVKA/a6ncrLS9B200BQa7oO+QJWSQs7ila1NiWcQ=; b=gx
	4foxXr8heIwMB9rW1Aq7Co0PNOfxPB8F5MPt28odvZF0e/NiWliyXXrgYsJmTxfF
	tuDtn/Eblf1py+6SPn0szcPIjM4EPNVzxAyR+7JxvIR20m7KwOMKj4xPWwp5DzBW
	BTe2rjJ8eOpACdL3nMwUcZcN+rkSP3Wn8uM31vYlv5pQ/w5s0n2do0B/v0vWT8BM
	F5B9f3fy0qYS6qs/f5P638krPkfqttHSksvYTyYw7vWjMdtnHiXjC8GVLNR14qIB
	5/a0Sbz9O37FEWtt7wcQO+c9oohKAswxfLQ+YSpNpvjM7D+MMoWLnIi+vU8cwpIZ
	4GLF4Qsd0b9eb3pXKuGQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux28s99qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 21:46:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBLkQOk009280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 21:46:26 GMT
Received: from [10.110.106.103] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 13:46:25 -0800
Message-ID: <889fdf9c-0c86-4553-984b-d4e64682d12a@quicinc.com>
Date: Mon, 11 Dec 2023 13:46:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/12] wifi: ath11k: store cur_regulatory_info for each
 radio
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231211062216.382164-1-quic_bqiang@quicinc.com>
 <20231211062216.382164-3-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231211062216.382164-3-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OL8wMNP-30e2Vl0Hu0T0Ef1wJHSk773p
X-Proofpoint-GUID: OL8wMNP-30e2Vl0Hu0T0Ef1wJHSk773p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312110179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_134628_530752_8CFF3A27 
X-CRM114-Status: GOOD (  16.90  )
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

On 12/10/2023 10:22 PM, Baochen Qiang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> The regulatory info of WMI_REG_CHAN_LIST_CC_EXT_EVENTID is not saved
> in ath11k now, the info should be saved in ath11k. Save the info for
> each radio and support switch regulatory rules dynamically.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
> v9:
>  1. add check to soc->reg_info_store in case memory allocation fails.
>  2. remove irrelevant change w.r.t commit message.
> v8:
>  no change.
> v7:
>  1. fix ath11k-check warning
>  2. fix memory leak.
> 
>  drivers/net/wireless/ath/ath11k/core.h |   1 +
>  drivers/net/wireless/ath/ath11k/reg.c  |   6 +
>  drivers/net/wireless/ath/ath11k/wmi.c  | 153 ++++++++++++++++++-------
>  drivers/net/wireless/ath/ath11k/wmi.h  |   5 +
>  4 files changed, 122 insertions(+), 43 deletions(-)

I came across a nit during re-review. Kalle, can you fix in the pending
branch?

> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index 75c79c99faa9..78bc2715e476 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c

> +static
> +enum wmi_vdev_type ath11k_reg_get_ar_vdev_type(struct ath11k *ar)
> +{
> +	struct ath11k_vif *arvif;
>  
> -	ath11k_dbg(ab, ATH11K_DBG_WMI, "event reg chan list id %d", id);
> +	/* Currently each struct ath11k maps to one struct ieee80211_hw/wiphy
> +	 * and one struct ieee80211_regdomain, so it could only store one group
> +	 * reg rules. It means muti-interface concurrency in the same ath11k is

nit: s/muti/multi/

> +	 * not support for the regdomain. So get the vdev type of the first entry
> +	 * now. After concurrency support for the regdomain, this should change.
> +	 */


