Return-Path: <SRS0=GJml=HS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91854C433E0
	for <ath11k@archiver.kernel.org>; Tue, 16 Feb 2021 08:06:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D55064DFF
	for <ath11k@archiver.kernel.org>; Tue, 16 Feb 2021 08:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D55064DFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RdzUdkQM8R7WxkyHSow7VnPyTlRa4NR0ADFFt441+YI=; b=pOyzk0/gtdRBKyS8o0/pqbfb7
	UqmmW7iPMcna9kJKL4uMOidKW37xOZj6s0iyl6VS+iv7s8qcDer1GM2dTCzVL7Y1gSYab/SHZA6YR
	q4xXNX+ZRCaugTD9Z7IJrGCaQGHdkz26M3R3LoTG5kMbh3C6lP1rvqXpT3XzEYU8DSPrgyMBWVLb+
	gJWYisdP3SyToAhIO9uXpaz4ikiYyjWzXD4XDGKRSW3DBowm5ib2B+lARaz1DFlItQf7U6t5ls75S
	BlPyamQVKsavBsIAmmm8V2lUutXfty4v0iFZqe11qv38L1PLva37+n9bk8owoZTP5IJAKLmWMosaw
	a0LnEyvLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBvMu-0003NU-KH; Tue, 16 Feb 2021 08:06:00 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBvMq-0003N9-Fv
 for ath11k@lists.infradead.org; Tue, 16 Feb 2021 08:05:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613462758; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=tJ6C42INmApIrIlT9JTyql3jM0HePBh9i0Xg9yfaMzE=;
 b=eLE6RsVlgU3WTImJedG6nLZgXZ05cCCOzt+dz3XBtVwrbD0Fsd1EocP4CltkaEq65fuIdYHb
 6/TEo/YYEDkGBkihoT0YpUNuG6mTPW2DpZs22tk1WUZ/Jv/LQGtEHvoKGE8BueqUkGTpEZez
 6KfbaHG59EZMoqz1CgODIoXAd2Q=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 602b7cdb8e43a988b78cbd9b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 08:05:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 446B0C433ED; Tue, 16 Feb 2021 08:05:47 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A048AC433CA;
 Tue, 16 Feb 2021 08:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A048AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Enable radar detection for 160MHz secondary
 segment
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1613460276-25469-1-git-send-email-lavaks@codeaurora.org>
References: <1613460276-25469-1-git-send-email-lavaks@codeaurora.org>
To: Lavanya Suresh <lavaks@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210216080547.446B0C433ED@smtp.codeaurora.org>
Date: Tue, 16 Feb 2021 08:05:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_030558_501001_DF5F13DC 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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
Cc: Lavanya Suresh <lavaks@codeaurora.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Lavanya Suresh <lavaks@codeaurora.org> wrote:

> WMI_CHAN_INFO_DFS_FREQ2 needs to be set in wmi vdev start command chan
> info parameter, to enable radar detection for secondary segment in 160MHz.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01717-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>

Fails to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:5757
error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1613460276-25469-1-git-send-email-lavaks@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
