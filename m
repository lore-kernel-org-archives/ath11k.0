Return-Path: <SRS0=aNMw=OE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3759C433EF
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 08:36:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0FD56044F
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 08:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0FD56044F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSKEDOkhfbNSLJFyv5tmeHIXFjPTOI7Fdodx/SCPha0=; b=Y/ek9AFEwddJjy
	lSeNa9vXqe8KvGwXoAVJt0m0XzuBuydn/GI4MhPhmUAo3u1xqGL4UWuYhdInmdijz6tEIdEyl9KNJ
	8rYvl8BbkMv8n+dGIuybteJlJVA3wN3siLVEQXaemY1yiFmSxva9Ijtd9xbNB4rEprLWQD4wjoON9
	t+nI/KPywBt9JreLFZZTD95qxyN5lYzyNuzXgywc1OhmIgIH0eAjfsf6Ei1c+LjJjF91OrYxtlqEf
	NfIAwIMd1neQgvQf6N087wH+2UNmJoETPwBz6JMuPe5DZ/huokLX7mn9xITl1Vf6L2S0m0r5PY7i1
	+DqR3DGe0ahWyfYdFjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ3vp-004iwX-1S; Tue, 14 Sep 2021 08:36:45 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ3vl-004ivD-Oy
 for ath11k@lists.infradead.org; Tue, 14 Sep 2021 08:36:43 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631608601; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=ThxMhkVj/OTj4p4TH0zWh6uCc1CbZd7A1TXlOIaUUwU=;
 b=Z42GcYdQZJLJDM5Nw3Ob0Ax0W4wW/HUBbur1ICP8X1dC3k28pjcaJsWuIwKTb014OZVj/MQW
 m2C8cgRK94idMc77OWLvf61PU8KEYBajLcMF+sESTxR4TADdorWgfLuaJoXGAK1s1ajPN4u+
 /rlczhO56kgX0NwB6Wa7yOInPp4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61405f18507800c880500db5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Sep 2021 08:36:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 466C7C4360D; Tue, 14 Sep 2021 08:36:39 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F3F1C4338F;
 Tue, 14 Sep 2021 08:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6F3F1C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: Split PCI write/read functions
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210913180902.193874-2-jouni@codeaurora.org>
References: <20210913180902.193874-2-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210914083639.466C7C4360D@smtp.codeaurora.org>
Date: Tue, 14 Sep 2021 08:36:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_013641_928681_ADAB568B 
X-CRM114-Status: GOOD (  13.32  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> ath11k_pci_write32/read32 tries to wake up MHI before doing actual
> write/read work, which means each time a u32 is written/read, MHI
> wake up is performed. This is not necessary in case where we do a
> large amount of write/read, cause only one time of wake up is needed.
> So split each one into two parts, the first part does MHI get/put
> and the second one does actual write/read work.
> 
> Also avoid the put operation if the previous get operation fails.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This causes new warnings:

drivers/net/wireless/ath/ath11k/pci.c:177:6: error: no previous prototype for 'ath11k_pci_do_write32' [-Werror=missing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:224:5: error: no previous prototype for 'ath11k_pci_do_read32' [-Werror=missing-prototypes]

I fixed them in the pending branch like this:

--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -174,7 +174,7 @@ static inline u32 ath11k_pci_get_window_start(struct ath11k_base *ab,
        return window_start;
 }
 
-void ath11k_pci_do_write32(struct ath11k_base *ab, u32 offset, u32 value)
+static void ath11k_pci_do_write32(struct ath11k_base *ab, u32 offset, u32 value)
 {
        struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
        u32 window_start;
@@ -221,7 +221,7 @@ void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
                mhi_device_put(ab_pci->mhi_ctrl->mhi_dev);
 }
 
-u32 ath11k_pci_do_read32(struct ath11k_base *ab, u32 offset)
+static u32 ath11k_pci_do_read32(struct ath11k_base *ab, u32 offset)
 {
        struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
        u32 val, window_start;


-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210913180902.193874-2-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
