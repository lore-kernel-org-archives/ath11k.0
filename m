Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B52C433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 07:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVut8rHjmELpRf7EGE7jUvZdcSILaWd/CqM7nfqlw+g=; b=4fnMaZ1CPQtyem
	u5AFBahhM+gE/54m1mav/qSxomk9zILpe7jQ/z/0DDO8Z6JspibT4/SECLl8Lc5KjjOLO/ELqjMyD
	cxU5aFMWKbTldVYSqkFiz32gEuW+ZoFuJv2MvCKS1PLosGR4djSwfuqCaY8m1t4LjDIlBR0bBWIP6
	3mDXaXK5gU9o1JamgDEKkUEQvB+8UfJF7eKS0JiWFaupLYTReKcSW2AZZBOtb2tSSKfsjpRD+XS+T
	NnWawGijSoqootldCZkK8TMm/0JhcBUaUzjEYvE/nnERgNLQboKcLJW0uXsIEIk/Pq5DHwUxaYCvE
	yVaStPNb+HXmGtfRGvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvEKs-00FCKL-K4; Thu, 09 Dec 2021 07:59:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvEKq-00FCJa-Gc
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 07:59:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A2C7ECE245B;
 Thu,  9 Dec 2021 07:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C78C004DD;
 Thu,  9 Dec 2021 07:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639036760;
 bh=7usM8Vbzbt7a1NhxXqycqXWoO9LCXTfcFvZdVhjm9/U=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Mf9H26Oyq6oVoTZpwcFL+iPOu0W2niMsBMuhcrJg/36GCepmIKD8APRtzCU3a7BWy
 DZwr88C76kvk611BGBUGXCHjOaOiAXu2NHBkVJSkedoRrwj4/DZHq6S28yMJmmp1pX
 OGJvCBUqv/dy9buOCqjt+ImxIGjVA7AQBtpjEko8yNbu4x4bWlXMOqgM0bJggtiz3u
 GZ4l0PPbrNL9lLbqITb8hXrH7K7d4/NrhtlbX32CNrobn19W/ojq6MV0jg+jlVTGcB
 JqcU3IGwCn/0LRHOw/la5pbiRUW93RbUP0t8fkuCmDPXVOHFHIMs2wsz5tupcS1at9
 3xGAvFdgAdFbA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix buffer overflow when scanning with extraie
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211207142913.1734635-1-sven@narfation.org>
References: <20211207142913.1734635-1-sven@narfation.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <quic_wgong@quicinc.com>, Sven Eckelmann <sven@narfation.org>,
 stable@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163903675519.20904.4795349677435567607.kvalo@kernel.org>
Date: Thu,  9 Dec 2021 07:59:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_235924_765835_4FDD1F7D 
X-CRM114-Status: GOOD (  18.59  )
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

Sven Eckelmann <sven@narfation.org> wrote:

> If cfg80211 is providing extraie's for a scanning process then ath11k will
> copy that over to the firmware. The extraie.len is a 32 bit value in struct
> element_info and describes the amount of bytes for the vendor information
> elements.
> 
> The WMI_TLV packet is having a special WMI_TAG_ARRAY_BYTE section. This
> section can have a (payload) length up to 65535 bytes because the
> WMI_TLV_LEN can store up to 16 bits. The code was missing such a check and
> could have created a scan request which cannot be parsed correctly by the
> firmware.
> 
> But the bigger problem was the allocation of the buffer. It has to align
> the TLV sections by 4 bytes. But the code was using an u8 to store the
> newly calculated length of this section (with alignment). And the new
> calculated length was then used to allocate the skbuff. But the actual code
> to copy in the data is using the extraie.len and not the calculated
> "aligned" length.
> 
> The length of extraie with IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS enabled
> was 264 bytes during tests with a QCA Milan card. But it only allocated 8
> bytes (264 bytes % 256) for it. As consequence, the code to memcpy the
> extraie into the skb was then just overwriting data after skb->end. Things
> like shinfo were therefore corrupted. This could usually be seen by a crash
> in skb_zcopy_clear which tried to call a ubuf_info callback (using a bogus
> address).
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Cc: stable@vger.kernel.org
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a658c929ded7 ath11k: Fix buffer overflow when scanning with extraie

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211207142913.1734635-1-sven@narfation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
