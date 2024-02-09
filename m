Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8480C48297
	for <ath11k@archiver.kernel.org>; Fri,  9 Feb 2024 17:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IjLCr72LHOycKWriKwle+9X3Z+1aqSjnHoRBVLlHDE=; b=lx5ae+f+uJXLhISxoklT5rvyQ6
	Hr45F9JLwPqBtF3T3f5QM9LtstxTEv9FtMKPeDoekQ3rPWIdKpEk5hoL+bFWgvfY/YEzCPZ+YxS4Z
	bc4GmhiFP5p/QKMfMFYqWv9c5F2dSYfK8kS+8HlLhX0kxj+1h4NTwq9wgkPTGzIQ6MYVWdrVNCxJw
	883dL2lBmBd2oLsLZSfhcwOZc4Xib59uFt3BT2QVcHeVsx/w42i4MoMelVlFKfdfG4tpQfsVW9gy8
	kt1ebeUMslTkEiBv1nu1frNmFofnntv6e3/FWtd/h/Uhs3W2BIMJ2vYl6B3PaJ5XiGwtQnDS/M2n0
	d9x21ZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYUyF-00000000AGb-0ngP;
	Fri, 09 Feb 2024 17:47:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYUyC-00000000AGD-1ksj
	for ath11k@lists.infradead.org;
	Fri, 09 Feb 2024 17:47:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 419GsxWB031572;
	Fri, 9 Feb 2024 17:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7IjLCr72LHOycKWriKwle+9X3Z+1aqSjnHoRBVLlHDE=; b=OG
	YqB2vqkGH/zxZkCaaWPqpfqes10vVO3WEfoAWFa2/7FRtQQf07IPrl1k08gOfNIC
	9evWDB4I9hQmP7rGWbFQA+zPL8Kb7sVYC9YnKIyduZKi7VLk1crtK6qGHpuynjYg
	bV3DavhN4ynjUfU4dQFmt1cwAIVEmoy8u7RQIod67FrZHskCJA63nu2Tb4trMl3X
	FC5GZcnAasarUqLnhGd+XWf7vBnzYky01JhigSfI+q+evgiRV7PjA0L34TWxUjjf
	Zi2YNZXxoG4IAD2cMa6uM6npKPsCYK6CRGmXd5VQOrhR2z54vptwbmChBfP7B7oN
	5eLkuuzyK3Ey1tUNP1gA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5m158nt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 17:47:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419HlLKo001552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 17:47:21 GMT
Received: from [10.110.97.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 09:47:21 -0800
Message-ID: <4be7d62e-cb59-462d-aac2-94e27efc22ff@quicinc.com>
Date: Fri, 9 Feb 2024 09:47:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] wifi: ath11k: fix layout of scan_flags in struct
 scan_req_params
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240209113536.266822-1-nico.escande@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240209113536.266822-1-nico.escande@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xntW270-BVxw_8kxiqo4FNkSFDQmNYif
X-Proofpoint-ORIG-GUID: xntW270-BVxw_8kxiqo4FNkSFDQmNYif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_15,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=746 lowpriorityscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_094724_606586_5B5F0743 
X-CRM114-Status: GOOD (  17.47  )
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

On 2/9/2024 3:35 AM, Nicolas Escande wrote:
> As previously discussed in [1] we have a mismatch in struct scan_req_params
> between the bitfield scan_f_xxx & the scan_flags when used with WMI_SCAN_XXX
> values.
> 
> To fix the issue & prevent it from happenning again lets stop using & remove
> scan_flags altogether in the driver and only use the bitfield instead. That way
> even if the bitfield doesn't match the WMI_SCAN_XXX flags, the right value will
> still be sent through the wmi command to the firmware (see
> ath11k_wmi_copy_scan_event_cntrl_flags).
> 
> Questions:
>   - In the same rationale shouldn't we remove scan_events from the same struct ?

yes, scan_events is unused so it and the union+struct can be removed,
leaving just the u32 bitfield. feel free to submit that as a separate patch

>   - The same goes for ath12k, should I send a seperate patch or respin a v3 with
>     similar patches for ath12k ?

please send a separate series for ath12k since it has a separate mailing
list

> 
> [1] https://lore.kernel.org/all/20231127180559.1696041-1-nico.escande@gmail.com/
> 
> v2:
>   - remove explicit uses of scan_flags with WMI_SCAN_XXX flags
>   - remove the underlying union of scan_flags to only leave the bitfield
> 
> Nicolas Escande (2):
>   wifi: ath11k: Do not directly use scan_flags in struct scan_req_params
>   wifi: ath11k: remove scan_flags union from struct scan_req_params
> 
>  drivers/net/wireless/ath/ath11k/mac.c |  6 +--
>  drivers/net/wireless/ath/ath11k/wmi.c |  2 +-
>  drivers/net/wireless/ath/ath11k/wmi.h | 55 ++++++++++++---------------
>  3 files changed, 29 insertions(+), 34 deletions(-)
> 

Thank you for this cleanup!

/jeff

