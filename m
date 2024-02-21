Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402B1C48BEB
	for <ath11k@archiver.kernel.org>; Wed, 21 Feb 2024 16:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mzPo7coiqD4bNBtSp4s9OWc4VpfNlVHmmPxn0rzbcE=; b=QzjuO1CZtoEXkl75C0z6Br+6wK
	d+DQa4hLcdY73/PqgwAGjlNSicK6Fb0Nqcd+NwddCs+ant8iQ2jrLPIhnd8BZis9wG87+iDSH12y5
	sLeyHNcwBakc+JI+MziMXhvO+RIdK/hrYaYpT1WEfx7KwQg+TJ6YgXFZyqhXfXLudzSRPlVTSdkDF
	CGK58VZBoJ1J9fAHSpoJDfq/y4Z+uV5QfVs+OoxdvJBxYMGS49Uh/wotnNe7m082Zjmnr0dRUAV5K
	oV9iVRLZRv1dQEKN/Vi4acsu9Cuqpsm688fjXUyu87a3XuLlSQ558Zb4NbcWOUuMebkS0zDgSZ6T1
	1SkGQhxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpYM-00000001kJB-3kHk;
	Wed, 21 Feb 2024 16:34:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpYK-00000001kIc-1pTG
	for ath11k@lists.infradead.org;
	Wed, 21 Feb 2024 16:34:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41LEqcH2019978;
	Wed, 21 Feb 2024 16:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7mzPo7coiqD4bNBtSp4s9OWc4VpfNlVHmmPxn0rzbcE=; b=VY
	QtHztSYWfjmYHuZIDD3V74IjT+WlD2G0zVSu5bCMJK0scSmiaR0WFJe0QcgPP/PT
	yiGWNJrOTjTZZDonnzKbKUZnybpzfnUz0oOXEoZEinc7KuY1W9dzMPGHhNb9ipwW
	aABYTGhs5Bl0vuF1k04NiWEB4EbJfPxrBV2DdqXwOIhCLhaomQTiUaZ4PStTWcAd
	BMoGzo6YDXkjPC2IXQHfIcD1Ep7qScKS0NZNsvTmVkVaJOkHpskVuM3E6yxPS0Yy
	N+c+eNDhXFH51ZdnFWXWdtFfz6Y21FQZop6GBOeVdztLP4rALeTwwpT95XP4dXjK
	KGPqXRWnRRpdKlLEa/Jw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdfm38tkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 16:34:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41LGYOuK022925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 16:34:24 GMT
Received: from [10.110.34.22] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 08:34:24 -0800
Message-ID: <0994ae16-8174-4a04-b454-1974b16bc106@quicinc.com>
Date: Wed, 21 Feb 2024 08:34:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k allocation failure on resume breaking wifi until power
 cycle
Content-Language: en-US
To: Vlastimil Babka <vbabka@suse.cz>, Kalle Valo <kvalo@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Linux Wireless <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
References: <96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IN1DWg1r0Czox-TgoO1ISaa0L8hWUYuF
X-Proofpoint-ORIG-GUID: IN1DWg1r0Czox-TgoO1ISaa0L8hWUYuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_03,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=711 bulkscore=0 impostorscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_083436_643461_37C2F0F4 
X-CRM114-Status: GOOD (  15.28  )
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

On 2/21/2024 6:39 AM, Vlastimil Babka wrote:
> Hi,
> 
> starting with 6.8 rc series, I'm experiencing problems on resume from s2idle
> on my laptop, which is Lenovo T14s Gen3:
> 
> LENOVO 21CRS0K63K/21CRS0K63K, BIOS R22ET65W (1.35 )
> ath11k_pci 0000:01:00.0: wcn6855 hw2.1
> ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
> ath11k_pci 0000:01:00.0: fw_version 0x1106196e fw_build_timestamp 2024-01-12 11:30 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> 
> The problem is an allocation failure happening on resume from s2idle. After
> that the wifi stops working and even a reboot won't fix it, only a
> poweroff/poweron cycle of the laptop.
> 
> This is order 4 (costly order), GFP_NOIO (maybe it's originally GFP_KERNEL
> but we restrict to GFP_NOIO during resume) allocation, thus it's impossible
> to do memory compaction and the page allocator gives up. Such high-order
> allocations should have a fallback using smaller pages, or maybe it could at
> least retry once the restricted GFP_NOIO context is gone.
> 
> I don't know why it never happened before 6.8, didn't spot anything obvious
> and it happens too unreliably to go bisect. Any idea?

I've asked the development team to look at this, but in the interim can
you apply the two hibernation patchsets to see if those cleanups also
fix your problem:

[PATCH 0/5] wifi: ath11k: prepare for hibernation support
https://lore.kernel.org/linux-wireless/20240221024725.10057-1-quic_bqiang@quicinc.com

[PATCH 0/3] wifi: ath11k: hibernation support
https://lore.kernel.org/linux-wireless/20240221030026.10553-1-quic_bqiang@quicinc.com

