Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7162AC5475B
	for <ath11k@archiver.kernel.org>; Mon, 11 Mar 2024 18:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oknEyidgsrmzNNLeaR5QMHEL90ziMvLCDD6k+bbmpCA=; b=op2HOjV7WauqO6Rsw98gLVPIv0
	e5O7aswQCxiyn0GtW8MBNHFavxOtZrJO7snkPVs/v5/ttl2D7CHRAJz5Ct2myhdBA1CihKG5JLCdt
	svXF85DYUQ1+ZCEGozIAYXpLg59xDNGSuJDTwZmBqqv2ZSdfO5QyHNeZC5z4+4jb44UraJ+kEA6kA
	7IGt83+b0TojKkMTUaWXmlAzM510gd2Df+sPeP0Ez8fPDv1ckojmf+PUCMcOHVUz1v9oU1qicAsuk
	68l5QX03J4GxPpcRlzQ/Opfa2wvaxwyUyGzvNOwocj+1dcKm6MVztX+QeSL8ZT/0ilucPvcE+sK0U
	4MhIQWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjkDg-00000002fNh-3VgY;
	Mon, 11 Mar 2024 18:17:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjkDd-00000002fN0-1RqK
	for ath11k@lists.infradead.org;
	Mon, 11 Mar 2024 18:17:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42BI6Zxx015172;
	Mon, 11 Mar 2024 18:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=oknEyidgsrmzNNLeaR5QMHEL90ziMvLCDD6k+bbmpCA=; b=Tl
	gh8yUIVhJG2fzB6pfwaZtU8Q/K9HTWy/zlscfaQ4fu7Cl+jZAQPnnBSC8aTHadr6
	+QxzdklX68qb+uo7RAauGh9LNP1LXrdoMw7FEi6CTv3GAaIGQVQs+ilhN0upaudq
	EYoH7YNgFWI0BmuIc47ivbj+ZgTVHXlAq7grhmmjjElAC+hVJCJ2aK3yT2HeWlFh
	Fg+QM1IsXrFPdEXUIgj56yFG76C82C44nUlBF27XqpE91iaR/o29CmNHBwJkxUdI
	Feyj1d/k23LG9463Ya0DW3RSXfAuF8AGgPwS/h+RCvZA/MJ6JbIsUIVQTbYD8jfh
	RAHRjtPTwZofbjMyIFzw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wt6xr00xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 18:17:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42BIHj18023733
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 18:17:45 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Mar
 2024 11:17:45 -0700
Message-ID: <cbeeb357-8b46-40af-88ec-b60d88540957@quicinc.com>
Date: Mon, 11 Mar 2024 11:17:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: don't force enable power save on
 non-running vdevs
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240309113115.11498-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240309113115.11498-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6tew9bIzRvD6-PnVOTrOJBdj0tOm0eGl
X-Proofpoint-ORIG-GUID: 6tew9bIzRvD6-PnVOTrOJBdj0tOm0eGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_10,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=951 phishscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_111749_624480_0F6483C5 
X-CRM114-Status: GOOD (  16.91  )
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

On 3/9/2024 3:31 AM, Baochen Qiang wrote:
> Currently we force enable power save on non-running vdevs, this results
> in unexpected ping latency in below scenarios:
> 	1. disable power save from userspace.
> 	2. trigger suspend/resume.
> 
> With step 1 power save is disabled successfully and we get a good latency:
> 
> PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
> 64 bytes from 192.168.1.1: icmp_seq=1 ttl=64 time=5.13 ms
> 64 bytes from 192.168.1.1: icmp_seq=2 ttl=64 time=5.45 ms
> 64 bytes from 192.168.1.1: icmp_seq=3 ttl=64 time=5.99 ms
> 64 bytes from 192.168.1.1: icmp_seq=4 ttl=64 time=6.34 ms
> 64 bytes from 192.168.1.1: icmp_seq=5 ttl=64 time=4.47 ms
> 64 bytes from 192.168.1.1: icmp_seq=6 ttl=64 time=6.45 ms
> 
> While after step 2, the latency becomes much larger:
> 
> PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
> 64 bytes from 192.168.1.1: icmp_seq=1 ttl=64 time=17.7 ms
> 64 bytes from 192.168.1.1: icmp_seq=2 ttl=64 time=15.0 ms
> 64 bytes from 192.168.1.1: icmp_seq=3 ttl=64 time=14.3 ms
> 64 bytes from 192.168.1.1: icmp_seq=4 ttl=64 time=16.5 ms
> 64 bytes from 192.168.1.1: icmp_seq=5 ttl=64 time=20.1 ms
> 
> The reason is, with step 2, power save is force enabled due to vdev not
> running, although mac80211 was trying to disable it to honor userspace
> configuration:
> 
> ath11k_pci 0000:03:00.0: wmi cmd sta powersave mode psmode 1 vdev id 0
> Call Trace:
>  ath11k_wmi_pdev_set_ps_mode
>  ath11k_mac_op_bss_info_changed
>  ieee80211_bss_info_change_notify
>  ieee80211_reconfig
>  ieee80211_resume
>  wiphy_resume
> 
> This logic is taken from ath10k where it was added due to below comment:
> 
> 	Firmware doesn't behave nicely and consumes more power than
> 	necessary if PS is disabled on a non-started vdev.
> 
> However we don't know whether such an issue also occurs to ath11k firmware
> or not. But even if it does, it's not appropriate because it goes against
> userspace, even cfg/mac80211 don't know we have enabled it in fact.
> 
> Remove it to fix this issue. In this way we not only get a better latency,
> but also, and the most important, keeps the consistency between userspace
> and kernel/driver. The biggest price for that would be the power consumption,
> which is not that important, compared with the consistency.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Fixes: b2beffa7d9a6 ("ath11k: enable 802.11 power save mode in station mode")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



