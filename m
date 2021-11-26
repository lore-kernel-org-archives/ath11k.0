Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9FAC433F5
	for <ath11k@archiver.kernel.org>; Fri, 26 Nov 2021 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQWFPliR9pL44y+aexOSCdeLSsGV/+YSuG89e9yj/8M=; b=WgV0FZd7amFKaM
	aPbjCeBeh8/6EH7qD7iF5XaRmHtTVBdQs2QY97sBSEhybrt8iYPSkRIIUkrurrpJeMEhCzxjNFmH3
	jKMZWby5EL18OQhy8SXUky+r7y2h4jjkCDtPSFZibqIQP9gBaBO7dQ50l0siJDQU716hBRN/fSSRT
	EO4NTQ1SHsYZdXNarbP44qwrcZQ7TnDQNkMNb9n9UWDCBXzGpET6LoTV0YTP+gmErph1xo1f1WcIo
	idJy1/CB47529bpXuVriyqnzEGkUm0BO1jPO8DkDLFPNA2iikY9uE/pYVe8HUtJ2XNwjaYuqBjjg8
	Awp8OUdUWxhrAIaPQsSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqYRW-00A0aW-6x; Fri, 26 Nov 2021 10:26:58 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqYRT-00A0ZC-4A
 for ath11k@lists.infradead.org; Fri, 26 Nov 2021 10:26:56 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637922414; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=D36i+TEzYvAfF+8CwLgTruoyqqi5b/grJJSwC8YVulc=;
 b=vSVJt4Gad3DK3vTwETeD5j5xKUdtgoGAbT7J+2AlxKTctQIkzgopkztEqAYAnd0SprYCStfc
 TONUiQPzHtcZvjr5Y2eXPbcO2ZsBGJos3u5nlcvRY962GAHXIxDKMipTykpeXBMN6eg9xv6r
 MigbmCOjjQW1Iiwb3DkCyxQRoiY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61a0b66edb3ac5552a267167 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 10:26:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 01DB2C447B4; Fri, 26 Nov 2021 10:26:53 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C7042C4363B;
 Fri, 26 Nov 2021 10:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C7042C4363B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v6 1/2] dt: bindings: add new DT entry for ath11k PCI
 device support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1637839211-1503-1-git-send-email-akolli@codeaurora.org>
References: <1637839211-1503-1-git-send-email-akolli@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163792240626.28516.5997258436480035214.kvalo@codeaurora.org>
Date: Fri, 26 Nov 2021 10:26:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_022655_263479_E9F7AD4C 
X-CRM114-Status: UNSURE (   7.40  )
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

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> Ath11k driver supports PCI devices such as QCN9074/QCA6390.
> Ath11k firmware uses host DDR memory, DT entry is used to
> reserve host DDR memory regions, send these memory base
> addresses using DT entries.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

Failed to apply, remember to use ath.git master branch as the baseline.

error: patch failed: drivers/net/wireless/ath/ath11k/core.h:194
error: drivers/net/wireless/ath/ath11k/core.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/mhi.c:339
error: drivers/net/wireless/ath/ath11k/mhi.c: patch does not apply
stg import: Diff does not apply cleanly

2 patches set to Changes Requested.

12638957 [v6,1/2] dt: bindings: add new DT entry for ath11k PCI device support
12638955 [v6,2/2] ath11k: Use reserved host DDR addresses from DT for PCI devices

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1637839211-1503-1-git-send-email-akolli@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
