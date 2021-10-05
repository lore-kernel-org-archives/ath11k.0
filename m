Return-Path: <SRS0=ASgL=OZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741CCC433FE
	for <ath11k@archiver.kernel.org>; Tue,  5 Oct 2021 14:30:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B8561264
	for <ath11k@archiver.kernel.org>; Tue,  5 Oct 2021 14:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40B8561264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84S0mAMoVMWJ8sPyq1kNvXHBRbNuYmdF+0LKL0T9tpw=; b=nfU2OmOk7xh82k
	tnmcbGP6cKbryqurqq4n+cKyos503GTK2qNsmSf9W4WUcPAkM2K4jOcUDKxVpNcthkCj+XLzZc24g
	M9HwAXBS7WZG10b5v21cF6jSuccy6WbVziwwjNmdsp+n0YQSJSsa52zQLgmlGeO1Wk9vj0MYxLy+v
	tYPocXYR9P7SobkVsZ7MgN2U1/Ho0AKr0GzzSAHqTE9l/rwq+2NEY40uRLxFPAWPk551PdUUWIClS
	ValRwyZpFcc3oYudobyroGK5ciw2atU/98lj0G8AW0LZzB6eQwq/NCPxIbT2j6SGgWqiQpx8GdbVn
	1LwE9bqw0s1J5s6Ep7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXlSH-00Armz-Ui; Tue, 05 Oct 2021 14:30:05 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXlSB-00Arlu-DA
 for ath11k@lists.infradead.org; Tue, 05 Oct 2021 14:30:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633444202; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=FxJv+xfRfX0wiXpi4iHFEWoHOtv7gBTnYPqMLSJu+pQ=;
 b=hjY0w4B6HoHbXvsRJDVS2E5kHN6Xr5JystAncWt2d804QgzbIkkn54doIahwDKEsOVWAiA7U
 A6bREXDBku7HCH1X2tJ9+abQB3oXZw8Md5K1oyim31rv3xBnvxsKRw+HM7UDhdueLmVwfr/z
 NdbpL8eWjjqdoXD8wFd08bCiwOc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 615c614b4ccdf4fe5759a592 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 14:29:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4F093C4360D; Tue,  5 Oct 2021 14:29:30 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A00F6C4338F;
 Tue,  5 Oct 2021 14:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A00F6C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Remove unused variable in
 ath11k_dp_rx_mon_merg_msdus()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210927150743.19816-1-tim.gardner@canonical.com>
References: <20210927150743.19816-1-tim.gardner@canonical.com>
To: Tim Gardner <tim.gardner@canonical.com>
Cc: ath11k@lists.infradead.org, tim.gardner@canonical.com,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20211005142930.4F093C4360D@smtp.codeaurora.org>
Date: Tue,  5 Oct 2021 14:29:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_073002_806264_05520EE8 
X-CRM114-Status: GOOD (  12.15  )
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

Tim Gardner <tim.gardner@canonical.com> wrote:

> Coverity complains that a constant variable guards dead code. In fact,
> mpdu_buf is set NULL and never updated.
> 
> 4834err_merge_fail:
>         null: At condition mpdu_buf, the value of mpdu_buf must be NULL.
>         dead_error_condition: The condition mpdu_buf cannot be true.
> CID 92162 (#1 of 1): 'Constant' variable guards dead code (DEADCODE)
> dead_error_line: Execution cannot reach the expression decap_format !=
>   DP_RX_DECAP_TYPE_RAW inside this statement: if (mpdu_buf && decap_forma....
> Local variable mpdu_buf is assigned only once, to a constant value, making it
>   effectively constant throughout its scope. If this is not the intent, examine
>   the logic to see if there is a missing assignment that would make mpdu_buf not
>   remain constant.
> 4835        if (mpdu_buf && decap_format != DP_RX_DECAP_TYPE_RAW) {
> 
> Fix this by removing mpdu_buf and unreachable code.
> 
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: ath11k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7210b4b77fe4 ath11k: Remove unused variable in ath11k_dp_rx_mon_merg_msdus()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210927150743.19816-1-tim.gardner@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
