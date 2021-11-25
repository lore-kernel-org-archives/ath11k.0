Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9031FC433EF
	for <ath11k@archiver.kernel.org>; Thu, 25 Nov 2021 11:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2KgnBzX0BZrGFjIlMIaxpKpRCl/m6myK99F9MSt2K4=; b=ymzA491a8S4XWpJ4bIeIO/6FT4
	OSZ3ZDwA3WxCXJPo+H+p2lbFA/hn5HAU1B5yssY7pCRrg70jjjboPM7RXto0yQIvYrAi/WUu9TbV8
	KQvsC20SQrM+ab+elAU1qq8diMfad74051fXD4AqkSPiYpKwsrQd5LXMa7RSBc4LT7V1L6ycE+4h0
	FxC1lNi4DT6IFEnhbuhIyFFMG8qaXajrDIC3I1gYJmuXI09wb+9yFkvngErzR+ivWnuFfyj7O8+9n
	X7F1reSmPcBt5m746N0R77mtdUgTTqcMVu9ePIDczVsUAUzGAwk4rpaB/H3+/qMyQqJtzJ5sf+Qo9
	FWNeSRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqCix-007DkH-TX; Thu, 25 Nov 2021 11:15:31 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqCiv-007Dic-QU
 for ath11k@lists.infradead.org; Thu, 25 Nov 2021 11:15:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637838927; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ybWbO2btPoiyPmYyb5PkhLLFjl5iFBWusufUlbMUxwk=;
 b=Mp82bjGeXJIOp1wxp2CRe0LeiwRDwSlYDozi3I+gbRfC2VyL/8+UNWShZ76UQW6qqnuXwbpS
 K9FyopefqPcE8GRwxQbX++uSB0jsKDa9saXjW5xndvPOLw3RGuznoha4qSrgbxaoMeiEcgOE
 kUXEvv/VDeGFoNGn/XbQT7GTGwg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 619f704f6bacc185a5581d42 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Nov 2021 11:15:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3BCF5C4360C; Thu, 25 Nov 2021 11:15:26 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F09DCC4338F;
 Thu, 25 Nov 2021 11:15:25 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 25 Nov 2021 16:45:25 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 2/2] ath11k: Use reserved host DDR addresses from DT
 for PCI devices
In-Reply-To: <74442923.uYUSDj6SXF@ripper>
References: <1637666940-30548-1-git-send-email-akolli@codeaurora.org>
 <1637666940-30548-2-git-send-email-akolli@codeaurora.org>
 <74442923.uYUSDj6SXF@ripper>
Message-ID: <e91487019f490b35940da8813c79cf40@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_031529_967345_7118B920 
X-CRM114-Status: GOOD (  10.79  )
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

On 2021-11-23 18:31, Sven Eckelmann wrote:
> On Tuesday, 23 November 2021 12:29:00 CET Anilkumar Kolli wrote:
>> +                       ret = of_property_read_u32(dev->of_node, 
>> "memory-region",
>> +                                                  &hremote_phandle);
>> +                       if (ret) {
>> +                               ath11k_dbg(ab, ATH11K_DBG_QMI,
>> +                                          "qmi fail to get hremote 
>> phandle\n");
>> +                               return ret;
>> +                       }
>> +
>> +                       hremote_node = 
>> of_find_node_by_phandle(hremote_phandle);
>> +                       if (!hremote_node) {
>> +                               ath11k_dbg(ab, ATH11K_DBG_QMI,
>> +                                          "qmi fail to get 
>> hremote_node\n");
>> +                               return ret;
>> +                       }
> 
> Afaik, this can be combined via
> 
>     hremote_node = of_parse_phandle(dev->of_node, "memory-region", 0);
> 
Yes Sven, I will update in next version.

Thanks
Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
