Return-Path: <SRS0=1e+W=HU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6E2C433DB
	for <ath11k@archiver.kernel.org>; Thu, 18 Feb 2021 06:01:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44D6664E2E
	for <ath11k@archiver.kernel.org>; Thu, 18 Feb 2021 06:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44D6664E2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oizgj/8ZWzTki2ut9PMZF7pX74VeNhAeR3kc9B4y+Wo=; b=lQZMOlYHSfEXu9DOWndtqoFod
	tf9Hz7fic6gtYWaB0Xwg5S3kCXICMepAfjgHl/m37Ivy2KpjKG3NxKp22PTxdosJqE5qjHRZH3Pgp
	Cu0rSyEQ1TDhFbi5TCDD1tvL6Q23C+9zEdGbgynEKMNx1tHZSCitrc7psMu+PHKlPJD3DCw6KvZUw
	lNs4v1G2cQkqVzi31qQSVh7hFxig0+6n/VHIo2srPINXiR9iVjFk85TuMcT1Tla6nIIMgovejLh+/
	TDpwOS11Fk03LodI78ojHbsjn6ykApoxhb00GkaTwwnLGos88N6C2v00RSQIZvwzPR82r4df2tsQ/
	mJWWhX8ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCcNS-0005GX-8K; Thu, 18 Feb 2021 06:01:26 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCcNO-0005GE-7f
 for ath11k@lists.infradead.org; Thu, 18 Feb 2021 06:01:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613628084; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=gI+1h/G/WUEx8DeaPM4hymi+yrn5my1Zpz77PPJ4bho=;
 b=otBvGd15AuheOCxTuwJWKcduAiscZeLK+5f/8hw7CggTXo1/8jziG4k2L+dYci5b661N9GPl
 n5p3zBE4m2si/1gD6g3SPEAuyomuEW/4tAEgoK0eilEO5NHFKqNjYmRMzPqB4REXThQ6VZJ0
 jUFL6OKHY76ScN/k3Kh3CFDOBmY=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 602e029566a058a0ec7528cf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Feb 2021 06:00:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C3C5FC433CA; Thu, 18 Feb 2021 06:00:52 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 82D47C433C6;
 Thu, 18 Feb 2021 06:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 82D47C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath11k: Enable radar detection for 160MHz secondary
 segment
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1613480547-28810-1-git-send-email-lavaks@codeaurora.org>
References: <1613480547-28810-1-git-send-email-lavaks@codeaurora.org>
To: Lavanya Suresh <lavaks@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210218060052.C3C5FC433CA@smtp.codeaurora.org>
Date: Thu, 18 Feb 2021 06:00:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_010124_385687_51B68048 
X-CRM114-Status: UNSURE (   6.71  )
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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

788f805e8c0a ath11k: Enable radar detection for 160MHz secondary segment

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1613480547-28810-1-git-send-email-lavaks@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
