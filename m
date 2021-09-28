Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEE5C433EF
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 13:23:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 475C561139
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 13:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 475C561139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+u8OgG2NZXtvSwLF+vpmSF1NFg1gkZnQCc0E+Ahc3J4=; b=hfXfOe665D+dhL
	8TtVP4CZ7SceYl+/JKf1kCSV5Dq4YoU1Rky8417NeMOaN/tEY+wpEdYNvWTwUsvEXu9cqfJLuWX5/
	kccmtxEDotRJ7MV7TRyRphugfRLbb39tCL7+E+ZGCUIqWZRTn6vfCcrUhcD+NWh++mRlOqXXD/Nhz
	zmzuDYzFdAqtRf3OmQXsyhS3nARioRJ6VMuswrojrMod5gwhAtSajFGnqWv8SWtTDdbQ/bcvGmdBD
	KEshEnSjH37nWj2zEtCLabLgUJ6z4QZ2GJUxb7m11di6UN3luvBQDsUhnS94K3+L0NVgBL7gf2cN9
	uUvewmpF+VFPJ03M+lXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVD4b-007KEb-6N; Tue, 28 Sep 2021 13:23:05 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVD4V-007K7q-15
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 13:23:03 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632835382; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=WBk27qcFzuvtnx+A0S6t+bXXtqabwrqjpgZSb+TuFyE=;
 b=Mv8wi2a/3FMVXnhL+VJSNs7c5e8QyP9Vzn0UmpOWQFDg+Y+A2HC8PzSK+un8ha8DW/R88GDN
 IPXsiwlvWvuE+YWOx4lJgtr3oFDWKiabZdvCwS+NJdhI66M5PyZbuaavWlM0LyZ3uUoj2yKE
 1VecS5IXrlbzJqJitK+i6YTx1DM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 61531722713d5d6f96daca93 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 13:22:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 367ECC4360D; Tue, 28 Sep 2021 13:22:41 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8B6BAC4338F;
 Tue, 28 Sep 2021 13:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8B6BAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: re-enable ht_cap/vht_cap for 5G band for
 WCN6855
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210804181217.88751-2-jouni@codeaurora.org>
References: <20210804181217.88751-2-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <wgong@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928132241.367ECC4360D@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 13:22:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_062302_587722_0E47554E 
X-CRM114-Status: UNSURE (   8.94  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> WCN6855 uses single_pdev_only, so it supports both the 5G and 6G bands
> in the same ath11k/pdev and it needs to enable ht_cap/vht_cap for the 5G
> band, otherwise it will downgrade to non-HT mode for the 5G band. Some
> chips like QCN9074 only support the 6G band, not the 5G band, and use
> the flag ar->supports_6ghz which is true to discard ht_cap/vht_cap.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

54f40f552afd ath11k: re-enable ht_cap/vht_cap for 5G band for WCN6855
74bba5e5ba45 ath11k: enable 6G channels for WCN6855
0f17ae43823b ath11k: copy cap info of 6G band under WMI_HOST_WLAN_5G_CAP for WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210804181217.88751-2-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
