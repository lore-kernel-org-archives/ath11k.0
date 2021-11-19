Return-Path: <SRS0=20C1=QG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC2AC433EF
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 13:08:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4107661A38
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 13:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4107661A38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGlb5yn15AXQT8EnhwZxBt8DjQp9K8fYJoTnNW+Uw5I=; b=QmDQtzn29wDcIs
	Y4yYFRMFYwEuJsA/djWlR9Sgk7y9L8+7Tgs08no6S2vFP5smiY1/e1+bAx6KtA0J0NOQCuJyrTXTV
	wd3rgwO0p4ZyMyaNVwH/Crj5K8zRPUwQ46CyrQ5uwLLvtrgtH7QC9auXJSSkr0XpY+YwiWxl2wadF
	WEA9D//7pReCpkH9O3CW3u7OpxvpKpqfUToUXqtNf/dwDxzj4PRZ1wfD3azsdlIbRPBzk/o3CIYOy
	gyc6QYfVwDw2nPel4TaTlwaXBN7CYRbaWSodONY1/MaiN/dDaTNZ5mqCtPmPI54eUrTmxio5dY2lB
	rGJ2qw4+fS/EugoYEQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo3cx-00ARep-5U; Fri, 19 Nov 2021 13:08:27 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo3cu-00ARdl-95
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 13:08:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637327304; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=peudzCRJza4nfYgRJiGKF6At1OyLtmPHdPcnrXolSWU=;
 b=peKDKu8D0S6JrOGkONkJk2nN6wlGqmvo47UDoccYhd76QwFyz7EbUp6UuhcQA++95qpYlZnQ
 snfdtdAl53PaBSLPuEdiJiJoIp25BO/V4R/2E0yv0WdwwOjHjksTpm373PKTD82r0IWWfo/l
 1t1BLYxbT6Eqg9jJtIm5mu/kJw4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6197a1c71e1d2f523349f3a3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 13:08:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BA9B7C43616; Fri, 19 Nov 2021 13:08:22 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 16162C4338F;
 Fri, 19 Nov 2021 13:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 16162C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 2/2] ath11k: Use reserved host DDR addresses from DT
 for PCI devices
References: <1637082058-6398-1-git-send-email-akolli@codeaurora.org>
 <1637082058-6398-2-git-send-email-akolli@codeaurora.org>
 <87wnl7dx69.fsf@codeaurora.org>
 <b1617fc74da2d65d663a82e4a4f538e2@codeaurora.org>
Date: Fri, 19 Nov 2021 15:08:17 +0200
In-Reply-To: <b1617fc74da2d65d663a82e4a4f538e2@codeaurora.org> (Anilkumar
 Kolli's message of "Thu, 18 Nov 2021 16:05:21 +0530")
Message-ID: <878rxkcmym.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_050824_686648_E64775D5 
X-CRM114-Status: GOOD (  18.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> On 2021-11-17 13:35, Kalle Valo wrote:
>> Anilkumar Kolli <akolli@codeaurora.org> writes:
>>
>>> Host DDR memory (contiguous 45 MB in mode-0 or 15 MB in mode-2)
>>> is reserved through DT entries for firmware usage. Send the base
>>> address and size from DT entries.
>>>
>>> If DT entry is available, PCI devices work with
>>> fixed_mem_region else host allocates multiple segments.
>>>
>>> IPQ8074 on HK10 board supports multiple PCI devices.
>>> IPQ8074 + QCN9074 is tested with this patch.
>>>
>>> Tested-on: QCN9074 hw1.0 PCI
>>> WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

[...]

>>> +		goto no_dt_entry;
>>> +	}
>>> +
>>> +	reg_end = reg + len / (aw * sw);
>>> +
>>> +	do {
>>> +		start = of_read_number(reg, aw);
>>> +		reg += aw;
>>> +		size = of_read_number(reg, sw);
>>
>> of_read_number() takes 'const __be32 *cell' but reg is 'u32 *'?
>>
> Yes.

My point here was that doesn't this mixing of __be32 and u32 when cause
a sparse warning?

>
>>> +		reg += sw;
>>> +	} while (reg < reg_end);
>>> +
>>> +no_dt_entry:
>>> +	if (no_dt_entry) {
>>> +		mhi_ctrl->iova_start = 0;
>>> +		mhi_ctrl->iova_stop = 0xFFFFFFFF;
>>> +	} else {
>>> +		mhi_ctrl->iova_start = (dma_addr_t)(start + 0x1000000);
>>> +		mhi_ctrl->iova_stop = (dma_addr_t)(start + size);
>>
>> I don't like casts, they hide bugs like the const issue above. Is there
>> any way to do this without casts?
>>
>
> u64 start, size;
>
>     if (of_property_read_u32_array(np, "reg", reg, 4)) {
>          ath11k_dbg(ab, ATH11K_DBG_QMI,
>                     "qmi fail to get reg from hremote\n");
>          return 0;
>     }
>     start = reg[0] + reg[1];
>     size = reg[2] + reg[3];
>
> I will this code in next patch. still needs typecast form u64 to
> dma_addr_t. no ?

I suspect that a cast is not needed, but not sure. No time to check either.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
