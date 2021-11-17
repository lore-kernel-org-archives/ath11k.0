Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6BFC433FE
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 09:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71A176187F
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 09:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71A176187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfGIfdnhQRVE/Uvmd0+J88OnFNsbAv9i9c0y5QgNnD4=; b=njoCbFaPY429F2
	QYsu1S7dPtpFm95EN0ck7ou1SBH9944q7y2qWNXgIvenVxRLiR0KYnzM3ez3yuPSM8Z2PMpeDa/+/
	70a4E5bodY0yDmBV4QNh1U8+FIwOeLLHVW7ACNGv4MjJyszhrGH0zISRdZM67eLPIT2wwFvI8+Yoh
	dMRJ5ugMwvZfyB8VkuonLipsnOU3rdCQ72NcvlKrUQaGGApyzeUVl99/yJGfJbAmJur/3iUem4Lja
	zXCow4LLBOr7l510v2YiPVaM/t4D8VbXKE9FFK9+N/MMAw7eo1aAaXiQKwWtwHoSzq3lp3luw87Ia
	xdjAHXfdNyewcQbV/+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnGrN-0044nx-5h; Wed, 17 Nov 2021 09:04:05 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGoq-0042fm-S2
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 09:01:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637139688; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=u5n52TZT1wtrTRHaAceu6U1TzFg1GLFIVdwevXoGm4M=;
 b=XaP7mQfgSMHua6Uzwi78NMejZw9/lg2t2wGuQ46ACNhDvn7Bhgxebf5ee1vTZSjDID5+xxlo
 2D3+eS+XryOA5RPJvZz6daDUmTCO5xLz9d0GadCgH7ntC/8AEu7IwD0+YoqwOMAn7Cf37S0I
 uRoUKW7aSMJQL5pL6w3bzPOJS9g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6194c4e811cd6d4077b63b70 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 09:01:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 12225C4361B; Wed, 17 Nov 2021 09:01:28 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 826FCC4338F;
 Wed, 17 Nov 2021 09:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 826FCC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: support MAC address randomization in scan
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211012191638.8749-1-cjhuang@codeaurora.org>
References: <20211012191638.8749-1-cjhuang@codeaurora.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713968455.10263.9448398259570217242.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 09:01:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_010129_091799_A7E991BC 
X-CRM114-Status: UNSURE (   7.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Carl Huang <cjhuang@codeaurora.org> wrote:

> The driver reports NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR capability
> to upper layer based on the service bit firmware reported. Driver
> sets the spoofed flag in scan_ctrl_flag to firmware if upper layer
> has enabled this feature in scan request.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>

Fails to apply:

error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:7888
error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/wmi.c:8983
error: drivers/net/wireless/ath/ath11k/wmi.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/wmi.h:6056
error: drivers/net/wireless/ath/ath11k/wmi.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211012191638.8749-1-cjhuang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
