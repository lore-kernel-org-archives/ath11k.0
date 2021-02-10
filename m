Return-Path: <SRS0=WqG4=HM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210D0C433E0
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 07:46:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B72A464E2F
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 07:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B72A464E2F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=egFgUrSt/fdgNgvydLsQ7BFjdiMaJ5205KvmiUm7ndY=; b=UJPMkUYIsOOq2DRTdaoJgtO0z
	kDEdGcnZBOQaXhxIErgY3IOczvZB2K8LfJX5dLM4FXpcTnMgEquGjlhgrH50jcURB5P77UMzr8t6R
	gJQApk1hBMHxOINF36fOx5XIuixVUMt3Sa3wCUSC9aGBb9XCgA5g3ZuXZ/INp92k/fr5m99eCjMZS
	3JGGyx9F2XPaRH8SNEs+rulDsYxsyDDh8ePK2ePHX6981HHBLyEiJQJ9kmmvDDxzgHGRpOZCJUCmn
	4YGw94MeznDc4zdAVQnF9YsbFRX0NBvhl8hiEJIXgXJJgLBLtLdl6W+V+npbvOsEuSxpaZ+TKU4Fi
	H/HChnFcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9kCm-0007ow-0z; Wed, 10 Feb 2021 07:46:32 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9kCj-0007oO-KI
 for ath11k@lists.infradead.org; Wed, 10 Feb 2021 07:46:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612943188; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=iSB3ttwA0JFsbKBWrzyvbO2MfU9rmRMghR0q+MB5dO8=;
 b=HMJpeSk5FEFL5uMK7WQBWUzGwuKu4+LMGp11JFs1CpCG2soF2nuyYbhymu6WYqRmKr7shb7w
 QZzYZYpDaMluMH3Xw5SU21VPjowMItW21tw5YBs4YpsqU3/jQ/yvI+W6RdUOJI796LwCvj+i
 AwaMzhEivH/XUx9dyp9hTErYlo4=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60238f53e3df861f4b180219 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 07:46:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F115DC43461; Wed, 10 Feb 2021 07:46:26 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EFF00C433C6;
 Wed, 10 Feb 2021 07:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EFF00C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: fix a locking bug in ath11k_mac_op_start()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <YBk4GoeE+yc0wlJH@mwanda>
References: <YBk4GoeE+yc0wlJH@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210210074626.F115DC43461@smtp.codeaurora.org>
Date: Wed, 10 Feb 2021 07:46:26 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_024629_724597_CF99AA52 
X-CRM114-Status: GOOD (  10.41  )
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

Dan Carpenter <dan.carpenter@oracle.com> wrote:

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
> [kvalo@codeaurora.org: move also rcu_assign_pointer() call]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c202e2ebe1dc ath11k: fix a locking bug in ath11k_mac_op_start()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/YBk4GoeE+yc0wlJH@mwanda/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
