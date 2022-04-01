Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58109C433F5
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrNQMOPj0lwCwjZ703Vi602KyiUVPGGOD6m8qA+HR3I=; b=0xeUPA1YsJhAOl
	JUuCqfhAkU3PwrVmrSHi4R+9JqcfL5WSnz7ML8qt4rkXw2tnafLjZ4V7xDOlwXKdpFMLyncROrwWk
	xVlVmyRhDzWL5jO2odbE26u8df+MJ1wMXIQ3fNW6/HEVwfsajUcceJuH7ykb2zNqSGiGAo6IXYoMs
	OIKQLPC1qmoKbe2UUZjUpi2swdaDvB0aAv+/u8N0lpCG1EpIcVDuF0mk+nhbUp8yeVUbnpeVCf0wl
	ap+SIgGvfh0iH7EUdQiEyM+gnSOq5kDll33yKwfd1bVZAdvDcYGjAlp9n8hDnkCKhoy3oNSsr1a+s
	hXcWLWUmnupynjYpgD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naLv6-006pFO-VP; Fri, 01 Apr 2022 18:22:49 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naLv4-006pF5-OV
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 18:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648837366; x=1680373366;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lgkQgXVDoFRjiy0mawrAnamkzEzLXyahnbv1kgs8nHI=;
 b=RLRjwcnZU43m5JiUoMBxcCmM6fL6P58VEIRchg6B4k5F/LqEYNXb8rJK
 FYpPcK2DSYcEqqXG8I5cpLnhADxdvPUqG/zPAMTHMGkebcd/HQwZjn+Vb
 07u4EiakhROFOjNDnbezWUwGQrkTols7z751B8I0/trzw7Z1zxOqblPen I=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 01 Apr 2022 11:22:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 11:22:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Apr 2022 11:22:05 -0700
Received: from [10.110.67.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 1 Apr 2022
 11:22:05 -0700
Message-ID: <0ca06ab7-2256-a391-907f-ba597ac211bb@quicinc.com>
Date: Fri, 1 Apr 2022 11:22:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/3] ath11k: mhi cleanup
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220401173042.17467-1-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220401173042.17467-1-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_112246_869932_95A479B6 
X-CRM114-Status: UNSURE (   6.28  )
X-CRM114-Notice: Please train this message.
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

On 4/1/2022 10:30 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Some minor cleanup to mhi.c, please review.
> 
> Kalle Valo (3):
>    ath11k: mhi: remove state machine
>    ath11k: mhi: add error handling for suspend and resume
>    ath11k: mhi: remove unnecessary goto from ath11k_mhi_start()
> 
>   drivers/net/wireless/ath/ath11k/mhi.c | 222 ++++----------------------
>   drivers/net/wireless/ath/ath11k/mhi.h |  17 +-
>   drivers/net/wireless/ath/ath11k/pci.c |   8 +-
>   drivers/net/wireless/ath/ath11k/pci.h |   1 -
>   4 files changed, 38 insertions(+), 210 deletions(-)
> 
> 
> base-commit: 57b7042c114767b7330b14a260f61732e556742e

For entire series:
Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
