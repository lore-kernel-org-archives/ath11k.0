Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA65C433EF
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 14:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yw8fhJitZ2t0DaIPAejX/i8YX1jPdfStG/IgGBs//kI=; b=h16Zvyp4J7RrqD
	aoSlg4Lke676Yvxr5y7IskVSYx/20uxj37dX89YsTpbj1Gr4ovpNOy7XWnj1IkRV9P0GFXvOOmd+j
	qFFp2w+fgZunGLeJBsA2VC73jFNNvSEmO42QEsclo6Df3Kf2RclyCOXBSYO3e+tQ53YmtDoYifMUy
	l+72YA8ruI2jGm3vaN7OG+G9rCKtLqWaPQr9HH/KLeMSdAtXJFjR0nXxsfl62R0qCwxZKXlD9RNPW
	nPu5umHzIMCXRrTR3ADpJ7jEyIK+/YXzqP/jJ+2ACU8yb+UNkIKwGAjJPRoo1jHUkUPKPkJaQ/2Uk
	0gfEz1HrhFdBZWLRmyJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpANn-00GsDr-U9; Mon, 22 Nov 2021 14:33:23 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpANl-00GsCS-9L
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 14:33:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637591600; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=ZHpkgoNKWuKGIQ5C01H85WdRGNvZkXSL+ZCzdACppfY=;
 b=GmaSBqtn6/NoaEjO7Z2upHph3/56W1c2xNnpvamV/1zZMJ9Wm9PhCvyk96JVLvnC45zFlt5W
 nySVGjYGjMF1JGe6KdArrCXyVGheXQAFfhEj+dhW2miLrW8Hw7g7S0LaNeTvaYlqVn723sHi
 iyHnD36uCnGwl2B4KCxrhQNjZxU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 619baa2fdb3ac5552ac0cbfb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 14:33:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 08ECEC43617; Mon, 22 Nov 2021 14:33:19 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 950A3C4338F;
 Mon, 22 Nov 2021 14:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 950A3C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: calculate the correct NSS of peer for HE
 capabilities
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211118095453.8030-1-quic_wgong@quicinc.com>
References: <20211118095453.8030-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163759159549.17469.13861131586880509051.kvalo@codeaurora.org>
Date: Mon, 22 Nov 2021 14:33:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_063321_429735_DFFBD30B 
X-CRM114-Status: UNSURE (   9.26  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> When connected to 6G mode AP, it does not have VHT/HT capabilities,
> so the NSS is not set, then it is 1 by default.
> 
> This patch is to calculate the NSS with supported HE-MCS and NSS set
> of HE capabilities.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01280-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3db26ecf7114 ath11k: calculate the correct NSS of peer for HE capabilities

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211118095453.8030-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
