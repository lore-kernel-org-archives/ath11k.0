Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB55C4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 09:06:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA50B22DBF
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 09:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA50B22DBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h2y1UmeHyWrpNJnfqsFk5g0gbhk8qXy6Frqp4S0vfl8=; b=UqUB6fwdnAE93YgFW0FjyABks
	xRChgyj76RrJVIKApBGWLuwOQjrCUDPYOiMWw3LkdbbvUf1wCuUXkC+grdcnIl0RLja7U0n8iT06I
	1uIxLWaf1bcKoY6ch9QT4aY/+2wqiAasBGzP/M+OZz1uE2kbEmxAjk8N2Qj2+m3ZwWgsWDUK4zu9/
	iNGYz2i/B9EmL6i7QXeneVFCJiAamLrEdetBhqQdsHpuoFHXsRu5VCigbIxNoYdA7nf4lifVT7PSH
	xg3N7sHKBOYc4p4i0gy8IkHS8RDMgfqZX8GrtcSD5S9E2d+r9b7ywWJHXsRE2637fih9REsOJ7zlw
	wE+Okm1/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpSlB-000743-TZ; Wed, 16 Dec 2020 09:06:13 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpSl8-000734-Us
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 09:06:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608109571; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=QIAiSIfGteTfftpeFpmU8XTLiCAnt6Lfk6Zo648dcP8=;
 b=B9XEgwjbL201X31xZEzU1rwBu06pEyo/MvqI0LZEYg7HlCy6/HeQHGb1ITdSzM4c5UZpFadI
 ejpKPUrt2Nq/NB+1zmi/hyUDf+HtcyOr4qhTOg3KmdGWCq1KWlVWeY3ST6jQkn20lAEQPce8
 ZR81P7CNolnNXXM3+4e+x+YtrCU=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fd9cdff031793dcb45a8483 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 09:06:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 21305C433ED; Wed, 16 Dec 2020 09:06:07 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E3F4C433C6;
 Wed, 16 Dec 2020 09:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4E3F4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/2] ath11k: Fix error code in ath11k_core_suspend()
References: <X9nF17L2/EKOSbn/@mwanda>
Date: Wed, 16 Dec 2020 11:06:03 +0200
In-Reply-To: <X9nF17L2/EKOSbn/@mwanda> (Dan Carpenter's message of "Wed, 16
 Dec 2020 11:31:19 +0300")
Message-ID: <87h7omxgqs.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_040612_003771_BDB4C8D5 
X-CRM114-Status: GOOD (  19.87  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>,
 kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The "if (!ret)" condition is inverted and it should be "if (ret)".  It
> means that we return success when we had intended to return an error
> code.
>
> Fixes: d1b0c33850d2 ("ath11k: implement suspend for QCA6390 PCI devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index b97c38b9a270..350b7913622c 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -185,7 +185,7 @@ int ath11k_core_suspend(struct ath11k_base *ab)
>  	ath11k_hif_ce_irq_disable(ab);
>  
>  	ret = ath11k_hif_suspend(ab);
> -	if (!ret) {
> +	if (ret) {
>  		ath11k_warn(ab, "failed to suspend hif: %d\n", ret);
>  		return ret;
>  	}

I suspect I created these bugs while cleaning up the patches. But I
don't get how I missed them in testing, that's a mystery to me.

Anyway, I'll queue these two to v5.11.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
