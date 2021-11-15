Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12770C4332F
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:50:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C641361BA9
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C641361BA9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXnHHO/SsW0jjmeRpgBdV6y6gNkLtF0GuZBAiBV8xu8=; b=CnRMyNuzLdmQXL
	B/CSNTwNZGK/aNZfE+aSQkz3cmcdKy6PbIbo5lFFHtRZufshhY8Rc9VjC8AvmbmpxHFSthK8I4rwe
	NagfOdBA4d60hxmS7jCh0c+/cMUGfY3AwII6kLZegEvYcTpx97Kwzm5sSS6db8A3IwHspSapgv2qz
	kEOCx30EvGuDpKqr2/NtZcjsuZhj4HrKn/xEGcS0p/JIj0g88gyum80xZ95yv9nkKW/fOUVXUcZ9v
	+4lkF7gWui0pH5XbcAxehr66i/FzP/MU6P58tSVDaGFYaBmuPVvvqV5gWkGq5K77xk4aK18gSla1s
	m//GFc1/V/4+f9RK/s2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYdJ-00F0fb-SM; Mon, 15 Nov 2021 09:50:37 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYDD-00EtqG-RO
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:23:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636968220; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=51ZJd/BR9naZgNiUMYvpRqSj1Wh4i31hMiePREeDHEs=;
 b=tzmN8LKQzaeXdgK+KGMAYKX7DhW8Zdx3mrr5J0bIylUXdy5HGBmQ7RCvwktvvWl9b4SOpYeb
 ILwhUFcpXOda1mO1BojF8GG28F+D90GX8oqbpszAScLg5EcpCfPDr72Rw/djYZO9nUcvhtXr
 ibDDgcMPLZXHS3lZphjd8754Tbk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6192271abb7027b8e18c0a5d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:23:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 881CEC43616; Mon, 15 Nov 2021 09:23:37 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F8B7C4360D;
 Mon, 15 Nov 2021 09:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2F8B7C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: remove return for empty tx bitrate in
 mac_op_sta_statistics
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211011084957.31024-1-wgong@codeaurora.org>
References: <20211011084957.31024-1-wgong@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 wgong@codeaurora.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696821403.13305.6349062465191543646.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:23:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012340_653980_1659321F 
X-CRM114-Status: GOOD (  10.10  )
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

Wen Gong <wgong@codeaurora.org> wrote:

> Currently in ath11k_mac_op_sta_statistics() there is the following
> logic:
> 
>     if (!arsta->txrate.legacy && !arsta->txrate.nss)
>         return;
> 
> Unfortunately if this condition is true then the function returns without
> setting parameters that follow the txrate. To address this issue remove the
> return and instead invert the logic to set the txrate logic if
> (arsta->txrate.legacy || arsta->txrate.nss).
> 
> The same was done also in ath10k in commit 1cd6ba8ae33e ("ath10k: remove return
> for NL80211_STA_INFO_TX_BITRATE").
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1d795645e1ee ath11k: remove return for empty tx bitrate in mac_op_sta_statistics

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211011084957.31024-1-wgong@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
