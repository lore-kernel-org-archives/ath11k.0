Return-Path: <SRS0=yLF1=KT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734A4C04FF3
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 21:30:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EBD0610CB
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 21:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EBD0610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVpP4ljLnARhtG9vIEhL/zhh0btxGaKURI+2j1sa+Jk=; b=iwfQR1OWQ2Wh6G
	hfyZ1Rui9Hjq6BoQFbcGyVBl9r2oXnaDaUpceaX5xSC5BRcS7IqsRGw8F52hHGMTB4hGwtABgUr0T
	DIWoImzkxwg1ez6R1cW/6YaXdafjlUpjEAEmR8XfmHDwV3UVBmblvRiIoJJDUp9Bma+RpEiWH/G2f
	xbUXLmSsJZG+961Uc33KBb7lwL41jtzP6iIJeGdYJk7oSlTqGDH3ukSeknEFpijC3LnISuMxB94yM
	Ht5Fb9aZII/9ZD2ytE85njXgV0qsrd7bO74AM9ijGcUjl21GD4YAY/uchraUPp4ruEqXcIMYIER1/
	4SVxfNjK0CVvC6YOIvsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llI9X-001ww4-PA; Mon, 24 May 2021 21:30:23 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll3Fm-000hbk-5P
 for ath11k@lists.infradead.org; Mon, 24 May 2021 05:35:51 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621834549; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=aCeZloNWIr+9qJLmE8MblU3PgPnuO3Zl8vpP89RVOa0=;
 b=ELC4p7uPmnJpLcLSRG/Y/FHiECx47tUtX6N5macgNwV19pTk+yVKoPdcOXsWsm9/em64iQpW
 pyoMRBR7BRpQZgvX6DOF7FuGdvxDeaiwr19CWPsFdLGuzWRAoKbp835nX9fAlM8E+WmtSc2t
 Uq0DL4veYnyFjDUDxBqaLmIPc2U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60ab3b337b5af81b5cc20a6b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 05:35:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6F488C43217; Mon, 24 May 2021 05:35:47 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AE14DC433D3;
 Mon, 24 May 2021 05:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AE14DC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k/ath11k: fix spelling mistake "requed" -> "requeued"
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210423134133.339751-1-colin.king@canonical.com>
References: <20210423134133.339751-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 ath11k@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210524053547.6F488C43217@smtp.codeaurora.org>
Date: Mon, 24 May 2021 05:35:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_223550_304440_80CAF475 
X-CRM114-Status: UNSURE (   6.39  )
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

Colin King <colin.king@canonical.com> wrote:

> There are multiple occurrances of the misspelling of requeued in
> the drivers with symbol names and debug text. Fix these.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

17818dfa8f2e ath10k/ath11k: fix spelling mistake "requed" -> "requeued"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210423134133.339751-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
