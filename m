Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0324C433EF
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 09:25:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F323611C8
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 09:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F323611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1eQM+dv5NakMlhx2m7Y9zp1rpOBMzdB3qi2lXG0PHE=; b=4vOLgpy2eGHRnR
	msiWdDQSkwdJX4kRaz+l9LS3G3Mn76Z2WotoxZLNOM1Whp7fT1OpshcW0gSY68HgYIUFoN5X15kuk
	LT9d8A5PZixCZuntIO0fxCQesVvmnj0WNND1HoAnxdcx9bQYqOYgxBVA5Sfq0hTNVXVzRiqb30KTu
	EyhDnEKT0VxWYwXhVqyDdq0inCMAbPRl1bOG/NZhyZT7W9T93b0+CgftbEKMJmvlRaDuuaezvFQny
	Igp87YYnw3IZdpupvowSyuNlGwPoBoJxlhSDaz11AeAlRG+DW5F9jpK7dMwXXHIvh996EuRbtX/I7
	4jXwJQzKVbBmn4HefeHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQndl-00Ag0K-Cj; Thu, 16 Sep 2021 09:25:09 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQndh-00AfzX-Dc
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 09:25:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631784305; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=IPhXCKvdXm+Nl0Ww0FI4Vofwz04YQUSCYLkPUwkNMWQ=;
 b=AXRoYsqBmN5cfvwfw4uhIb1XIwIbdkf7jOVNOppolf2SE0tAbjhFF2AiL32rKvr8B1ZTnFyv
 WbtCHN+zpRBPakQamZnKZrpM04TWfFsMdeyjLp6AWPa0ssTs7QwHD00IYu9hkY+Mp4uJ+3Cq
 pCPdoyHLvJRvgYHP4lgPmB4nJPc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61430d60b585cc7d24d9c8a0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 09:24:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E3033C4361A; Thu, 16 Sep 2021 09:24:47 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7ADD7C43460;
 Thu, 16 Sep 2021 09:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7ADD7C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: Rename atf_config to flag1 in
 target_resource_config
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210720214922.118078-1-jouni@codeaurora.org>
References: <20210720214922.118078-1-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210916092447.E3033C4361A@smtp.codeaurora.org>
Date: Thu, 16 Sep 2021 09:24:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_022506_155511_3B10EF0C 
X-CRM114-Status: UNSURE (   7.18  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> The flag's purpose is not only meant for ATF configs. Rename atf_config
> to flag1, so it can be used for future purposes.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

7e9fb2418a4c ath11k: Rename atf_config to flag1 in target_resource_config
9b4dd38b46cf ath11k: add support in survey dump with bss_chan_info
feab5bb8f1d4 ath11k: Align bss_chan_info structure with firmware

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210720214922.118078-1-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
