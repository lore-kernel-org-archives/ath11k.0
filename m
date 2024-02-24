Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7153C54798
	for <ath11k@archiver.kernel.org>; Sat, 24 Feb 2024 01:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1f11qGuY7NIezPSMBTWWviWwZMg5mwUudP8vtfOtE24=; b=Wb1niDZUJ+Zb56O6HzS5pjHhlp
	tJI82rhMpJ0+/136I4PnonZ4ibRCbzk43YLAblHV/gX2JBv/JLAo9c8fFz0D8gWi7uPN/tciLf6yK
	H4xhPNwWXncrfWMiZ3o616V4cLosMKcP8iBA4SBx4YqfgD/cQbQuWP2D+qU5//9M2cu3xLeP8deCP
	VVW0lWjwnnjBwBxvaRzMQUzP5Q10tNYqWsHqFGLFV43mfIvCmYESZJbHmFjNP/vu1MiRdXvfmyavq
	2I2Q7X9XmYoMY/8tZRIzMjx9oyDlAjx97e4aoeGW/gaIj/Vnu9xWFn3FV1QZnknWi8eh2TnqSckNn
	DkyRwE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdgmH-0000000BnDv-3gdy;
	Sat, 24 Feb 2024 01:24:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdgmE-0000000BnCe-1abY
	for ath11k@lists.infradead.org;
	Sat, 24 Feb 2024 01:24:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41O0jAm6010182;
	Sat, 24 Feb 2024 01:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=1f11qGuY7NIezPSMBTWWviWwZMg5mwUudP8vtfOtE24=; b=Po
	ScY9JNbv6FqNl07o7IFMy1RUQIzDF13KhYQtwoiScflGF0V1rcOg2vjszsXc0h5i
	tJb0/ai+/h8OmZZURhuGdFZp89/kYFJ4OpS2oJ/NiZjCa7A+xSooQAPGeOYNzh72
	bqrL7C6Q+WS/exq3vkRXQD8mpXfXWat+YrlW6t2KRQw8Kxs4Qv3gbF3/ueIyFYx9
	aUzj3zsc2mDNAHg6iMt3DkGNEWZj50V+NSItYt3f6Mfxm/aQk1Sd4DM5EdFqZSlV
	8RlUoWy4V509682HVak/yH9UlhoJm9SI1iachyrdn5jzLBD5/y3Tixc0ksNlR3u6
	mTMtJUTVInqo8bii736w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3weqcfa1sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Feb 2024 01:24:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41O1OPJO029999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Feb 2024 01:24:25 GMT
Received: from [10.110.104.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 17:24:24 -0800
Message-ID: <cda4c968-29b0-4e64-9d20-bb2f0e6cd32d@quicinc.com>
Date: Fri, 23 Feb 2024 17:24:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: decrease MHI channel buffer length to 8KB
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240223053111.29170-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240223053111.29170-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HdwCsTK6wXD-kzpHqLxjEnH8l8x0pmU6
X-Proofpoint-GUID: HdwCsTK6wXD-kzpHqLxjEnH8l8x0pmU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_08,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=726
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402240009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_172430_467568_BE711D8A 
X-CRM114-Status: GOOD (  10.42  )
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

On 2/22/2024 9:31 PM, Baochen Qiang wrote:
> Currently buf_len field of ath11k_mhi_config_qca6390 is assigned
> with 0, making MHI use a default size, 64KB, to allocate channel
> buffers. This is likely to fail in some scenarios where system
> memory is highly fragmented and memory compaction or reclaim is
> not allowed.
> 
> There is a fail report which is caused by it:
> kworker/u32:45: page allocation failure: order:4, mode:0x40c00(GFP_NOIO|__GFP_COMP), nodemask=(null),cpuset=/,mems_allowed=0
> CPU: 0 PID: 19318 Comm: kworker/u32:45 Not tainted 6.8.0-rc3-1.gae4495f-default #1 openSUSE Tumbleweed (unreleased) 493b6d5b382c603654d7a81fc3c144d59a1dfceb
> Workqueue: events_unbound async_run_entry_fn
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x47/0x60
>  warn_alloc+0x13a/0x1b0
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? __alloc_pages_direct_compact+0xab/0x210
>  __alloc_pages_slowpath.constprop.0+0xd3e/0xda0
>  __alloc_pages+0x32d/0x350
>  ? mhi_prepare_channel+0x127/0x2d0 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
>  __kmalloc_large_node+0x72/0x110
>  __kmalloc+0x37c/0x480
>  ? mhi_map_single_no_bb+0x77/0xf0 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
>  ? mhi_prepare_channel+0x127/0x2d0 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
>  mhi_prepare_channel+0x127/0x2d0 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
>  __mhi_prepare_for_transfer+0x44/0x80 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
>  ? __pfx_____mhi_prepare_for_transfer+0x10/0x10 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
>  device_for_each_child+0x5c/0xa0
>  ? __pfx_pci_pm_resume+0x10/0x10
>  ath11k_core_resume+0x65/0x100 [ath11k a5094e22d7223135c40d93c8f5321cf09fd85e4e]
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ath11k_pci_pm_resume+0x32/0x60 [ath11k_pci 830b7bfc3ea80ebef32e563cafe2cb55e9cc73ec]
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  dpm_run_callback+0x8c/0x1e0
>  device_resume+0x104/0x340
>  ? __pfx_dpm_watchdog_handler+0x10/0x10
>  async_resume+0x1d/0x30
>  async_run_entry_fn+0x32/0x120
>  process_one_work+0x168/0x330
>  worker_thread+0x2f5/0x410
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0xe8/0x120
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x34/0x50
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1b/0x30
>  </TASK>
> 
> Actually those buffers are used only by QMI target -> host communication.
> And for WCN6855 and QCA6390, the largest packet size for that is less
> than 6KB. So change buf_len field to 8KB, which results in order 1
> allocation if page size is 4KB. In this way, we can at least save some
> memory, and as well as decrease the possibility of allocation failure
> in those scenarios.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Reported-by: Vlastimil Babka <vbabka@suse.cz>
> Closes: https://lore.kernel.org/ath11k/96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


