Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F8DC433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 08:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNm+gIHpHOm+SUePpopt1MhShOkRJDBN3JwwBDQNluM=; b=mJiX7ETmyzLRO+
	HWwNGxXUMvuE+JOA0qdjYhScAjkyB+R49BVdIkAXH+q9IJ4OaSuJZM77M2c87eoQSzUBIGcCO3hat
	OFpSb2Pka1SudGjWdlWPtcgVlGDqHBaYGHCERcy3IHEebEQuZnruNlAAiLbFE5ck5SOCc84Or8Goi
	ZWUYmiaBjiTHgXouRkrmbUQSfVuwwtf0tO8d0FqGo53HnkzHlQsplz14JTdRhUZuj/XMdy06oMEGe
	Fuv0Go+ABBwtXLlxAFCdX3uoCut4N453zS5lKaSbim1d81G+hmyZax7XSPL7wnuZzBO6IzAWmYOgI
	Zp2JLQ5SKhhNpJJfLL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM3du-0049mv-Uy; Mon, 21 Feb 2022 08:01:59 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM3cm-00498w-GV
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 08:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645430448; x=1676966448;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vCMIU2GDHpexi3NGarDhvGuLbC22KSrHMRfsgun8RRs=;
 b=yOut0RqzyHVZIJjo5pBpPP9++mKiNifp7T3/eD6RohJAU7CCbbHmmAoD
 XFbHV6JOmezxXW3mhQx/7HoUNCxR6hsATRnp6iXHFkmhIt/vmlqOJtsnN
 1o5IAm/gIBcz56yfxRsr49tq3FzHmqEHBQWMSXh1YtrTibj1tWWw75/lO c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Feb 2022 00:00:47 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 00:00:47 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 21 Feb 2022 00:00:47 -0800
Received: from [10.216.7.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 21 Feb
 2022 00:00:43 -0800
Message-ID: <4b847295-4840-4fa5-f234-a368fcfcadb4@quicinc.com>
Date: Mon, 21 Feb 2022 13:30:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 18/19] ath11k: Add support for targets without trustzone
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-19-git-send-email-quic_mpubbise@quicinc.com>
 <87sft8f8g3.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87sft8f8g3.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_000048_637089_EB3C662E 
X-CRM114-Status: UNSURE (   7.89  )
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



On 1/28/2022 4:12 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> Add the support to attach WCN6750 and map iommu domain
>> for targets which do not have the support of TrustZone.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> 
> Is this not needed in the initial WCN6750 support? If yes, please submit
> this patch after WCN6750 support has been commited. That way we can
> reduce patchset size.
> 

Sure, we can do that.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
