Return-Path: <SRS0=2hxC=FW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315C9C4361B
	for <ath11k@archiver.kernel.org>; Fri, 18 Dec 2020 09:05:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC6E723A5B
	for <ath11k@archiver.kernel.org>; Fri, 18 Dec 2020 09:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC6E723A5B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vRG1x4TQplLn/fYuvuGZ6j0kkVY5gDSWQUBuM8wwIz8=; b=OtcR9PQtMI8ql0M8Qd/ylUcfT
	UpwDKPa6q9rlCTtkoZN6+0IpHklNhIa2ZqKklIMmTO4BrLhpCKbPswnXqKSwoNGM90bzdrK63WEda
	ClK2MAZX4NawETLxyHBedHfg5E7rOJ0jT2iup3B84qfCFwg1PNQHKjulY0ltVzJmIdwqtzCjUY1E5
	EZFlgLXG3wFqhkOjO5LMIz9P8YTp6BvZAGHGk00u7TySZeWQu78QQgtX+4rvbV3c5ID7eRtA985gR
	eDnSIgYF1P/jx80xZeREls5AWXmxe6aNr8eEYWjlDOh2jzpwbdWuHa3q+RZYIaMFnqIUJPiitawfi
	OrYN07jOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqBhE-0008LO-U7; Fri, 18 Dec 2020 09:05:09 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqBhA-0008Ke-RT
 for ath11k@lists.infradead.org; Fri, 18 Dec 2020 09:05:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608282306; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=opbN+J0bR0up7fcnsxUQhaf9pOkqB0FicjgwecoPD20=;
 b=W6SmRd1RUF2kRwgK35r6A0sk4z3PIsvSJO3yq2uS9rKphnJZNLzgJTaqQOuSUUvPWAezFHOf
 8Y+1TRqYNYRuCW1+Zwm0pDwbkTCXELYEWB1t8Po1Cm9IEW98i59y504MXaj5Vx9HOPfgxr8e
 FEo4xxTWeUozfl4C2R4F3Bl7cuw=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fdc70ba93a3d2b1cd12f969 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 09:04:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4C8E4C433CA; Fri, 18 Dec 2020 09:04:58 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D8094C433C6;
 Fri, 18 Dec 2020 09:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D8094C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: pci: remove unnecessary mask in
 ath11k_pci_enable_ltssm()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1608143051-5386-1-git-send-email-kvalo@codeaurora.org>
References: <1608143051-5386-1-git-send-email-kvalo@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201218090458.4C8E4C433CA@smtp.codeaurora.org>
Date: Fri, 18 Dec 2020 09:04:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_040506_628886_7D1E588A 
X-CRM114-Status: UNSURE (   8.42  )
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> 0x10 is a leftover and unnecessary, GCC_GCC_PCIE_HOT_RST_VAL is already defined
> to 0x10.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

562934ada52a ath11k: pci: remove unnecessary mask in ath11k_pci_enable_ltssm()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1608143051-5386-1-git-send-email-kvalo@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
