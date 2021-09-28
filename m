Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1082AC433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D268F61131
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D268F61131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39o3zUFgGlqXmgq+MPoUACH6kwt7918lJZd9O1VZ0XE=; b=dRbylE7H3muVOM
	509ehIhgL5yeI7dEAgg9CYosrKfJIuZQVJcKtsI1Vc00mk8b5YnMLn53f8U4df7tBQZbIP35UKdpQ
	oFxWA60YRjMime2CVcUzZGqzcAIUbTBztoJq/Y22eZ+QnJy9I1y/nc7bcO5gt8nPPxIPY3audMLf8
	AB/XuurGckTZbe55l1ff7eaA7EkaZeejAeQ0FVEvaC3Mld6DEk2X8ujq02+cdMwQAcPVqjx/8KJcv
	Dg3zkz2PsxmgA9zLTHrbgE/p9aB08FDOb7V13d7JBy/mTuovzMUeCXiHa8fKpwwivR1tIlO9K7O1Z
	6NY1lQl6zg+SLSgJpoQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVAmN-006swX-1k; Tue, 28 Sep 2021 10:56:07 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVAmJ-006ssF-3h
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 10:56:06 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632826564; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=BzIw2gqW3XboP6+x63I5TMHdKixIQoCk1euEID7NjiU=;
 b=B9LBEsCBoV3Qh058sPaFjgw3eJLdeIodqari86+jv/uwMNwlJYyT9UojrjLtswddLNIgmpSF
 toDKTnA0ChKphHS5+yk/+/6e3WD4iH/WcWpPA8NmgxUSr4kXfFLspg5z+lmy/DZBeZfe9pTE
 FyPiO8DG7XgJkaueGFJ9d0KYXVg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6152f4c0713d5d6f9601eb42 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 10:56:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 14FE4C4338F; Tue, 28 Sep 2021 10:56:00 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 11C50C4338F;
 Tue, 28 Sep 2021 10:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 11C50C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix some sleeping in atomic bugs
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210812070434.GE31863@kili>
References: <20210812070434.GE31863@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 kernel-janitors@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928105600.14FE4C4338F@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 10:56:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_035604_339812_3AA6A0A2 
X-CRM114-Status: UNSURE (   9.71  )
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

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The ath11k_dbring_bufs_replenish() and ath11k_dbring_fill_bufs()
> take a "gfp" parameter but they since they take spinlocks, the
> allocations they do have to be atomic.  This causes a bug because
> ath11k_dbring_buf_setup passes GFP_KERNEL for the gfp flags.
> 
> The fix is to use GFP_ATOMIC and remove the unused parameters.
> 
> Fixes: bd6478559e27 ("ath11k: Add direct buffer ring support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

aadf7c81a077 ath11k: fix some sleeping in atomic bugs

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210812070434.GE31863@kili/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
