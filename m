Return-Path: <SRS0=1RzP=HL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50A9C433E6
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 07:47:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE6264E5A
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 07:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EE6264E5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IsTaCcCFhKJ1VskvPozNhmlZ0k0uuKbDtB3HddDiB6s=; b=XqNo+IPylN3sY6I67LxtScOHm
	Kb98xxmbsm4PgqoNscAwThDaG3He2N/3mQLev1o4gdjte/sy7XZK7Xpg74lhn8f1PHkoPtM2fHBwT
	m+bXuGiy+mFTgC5jD/EUncJkmjHJeOVnmD6hE87iit7ByApzxmHprODvGoSwsMvKGZ9Ha8QaYwApC
	27MOaUdbG0t+b67V8bQOxLz0aedtwxDbQVHWbperPFYZE4Zk07jyYrc5jZD1HFJTlclWe+IibIQxY
	4fM226VnECjGWR9RanMx4tlI2tg9JdJLONH763oPmIbJvmRl7oyYU3qBRj5vDXu0peErb5/sz/ihc
	UrXWnzvRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9NkM-0005Iz-Lk; Tue, 09 Feb 2021 07:47:42 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9NkI-0005Hv-05
 for ath11k@lists.infradead.org; Tue, 09 Feb 2021 07:47:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612856859; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=W9E2hKL9FEOwJG8sgNFLZYNgLl8yBkWRrvp0gt3S8CI=;
 b=rQPQGC1nKsuDf925SIzgMT60dMCp7TTt1C+KnqiiDYJece762ix+LZL2rrJ6fpElTZlB0bJt
 bjkINgf5lFCw6H90y31d4SlVILBAYzrW8elS5+RrAvUvaduA0LVwE1aCJMiX3xtpRZk8ygQe
 oUCA48gXxIDvso5jyGgz8DtkRf0=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60223e034bd23a05ae48a532 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 07:47:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C19E0C433C6; Tue,  9 Feb 2021 07:47:14 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 79DC3C433CA;
 Tue,  9 Feb 2021 07:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79DC3C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] ath11k: fix a locking bug in ath11k_mac_op_start()
References: <YBk4GoeE+yc0wlJH@mwanda>
Date: Tue, 09 Feb 2021 09:47:10 +0200
In-Reply-To: <YBk4GoeE+yc0wlJH@mwanda> (Dan Carpenter's message of "Tue, 2 Feb
 2021 14:31:38 +0300")
Message-ID: <87ft25vg1t.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_024739_963355_287A27CE 
X-CRM114-Status: GOOD (  22.18  )
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
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Carl Huang <cjhuang@codeaurora.org>, Peter Oh <peter.oh@eero.com>,
 ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> This error path leads to a Smatch warning:
>
> 	drivers/net/wireless/ath/ath11k/mac.c:4269 ath11k_mac_op_start()
> 	error: double unlocked '&ar->conf_mutex' (orig line 4251)
>
> We're not holding the lock when we do the "goto err;" so it leads to a
> double unlock.  The fix is to hold the lock for a little longer.
>
> Fixes: c83c500b55b6 ("ath11k: enable idle power save mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: reviewers were concern that v1 was racy
>
>  drivers/net/wireless/ath/ath11k/mac.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index c1608f64ea95..464d3425488b 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -4248,8 +4248,6 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
>  	/* Configure the hash seed for hash based reo dest ring selection */
>  	ath11k_wmi_pdev_lro_cfg(ar, ar->pdev->pdev_id);
>  
> -	mutex_unlock(&ar->conf_mutex);
> -
>  	rcu_assign_pointer(ab->pdevs_active[ar->pdev_idx],
>  			   &ab->pdevs[ar->pdev_idx]);
>  
> @@ -4262,6 +4260,9 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
>  			goto err;
>  		}
>  	}
> +
> +	mutex_unlock(&ar->conf_mutex);
> +
>  	return 0;
>  
>  err:
> -- 
> 2.30.0

But now rcu_assign_pointer() is called while conf_mutex is held,
previously it was not. I didn't check if this creates problems, but just
to be on the safe side I modified your patch to keep the original
functionality. Please check my changes in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=8eff3667c211072a2107271139b81cbf8c7fd10a

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
