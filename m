Return-Path: <SRS0=mtRf=IH=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819A2C433DB
	for <ath11k@archiver.kernel.org>; Tue,  9 Mar 2021 11:04:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E32B65253
	for <ath11k@archiver.kernel.org>; Tue,  9 Mar 2021 11:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E32B65253
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bcqpTbAAcVcSntsyf4e7+iiKq19HUA8p9EmeGfr79XQ=; b=RNo8PaxMF1A1rFpyWzXRv7Omv
	m2CpfpqF6ccK+22AO3CHdNrv/LROZ4grOxFu2tLHp+EGOWZNHGiOmDlekmp2C7+vzQRrMe6q51Q36
	h2KHNv6UmtuCfxik4Q48OQrq9I8/moS4MT622bI+oM58OB6SPXdUO37A6q0wO33anpuKG0HUCfuYP
	ZG2LpLUIs0USlwo/BQODHt7Ml2sqHRKZW7wbD3Vp9Nb+Nuwamh+cVAb7eIUBFU5eGDIg3DHLMf3fp
	o0mLE4R4OWJldpkCVaS+oZFpP/kJYWOCySbbn+W00ywFU2O7CSdhMwJUsCzFJpahAXG8KzXpXhUhS
	z6ZzjKtLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJa9d-004Fpr-I1; Tue, 09 Mar 2021 11:03:57 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJa9U-004Fdk-NF
 for ath11k@lists.infradead.org; Tue, 09 Mar 2021 11:03:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615287830; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=IGZc1gOCO6ryrX2y2Ulh5Hjc13TCZJDZVJpHST0oSik=;
 b=WzQSNdTWYTU674cbArMbt8swg1jgzTj60DOppzl5E6L0zryuLfqAfcdilYxblsMwW9ur43a0
 awpdA4Hh0JAweo6jJQgpH8AsmazzjXapnzNy1bNd6GBiYa8KMNGAJYcIVk8aw9g0g2kakid8
 GoizCj1HO4t1IK7wnZBYk2I0RUs=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 604755df6df184e952c6bf42 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 11:02:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4B60EC43462; Tue,  9 Mar 2021 11:02:54 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D078FC433C6;
 Tue,  9 Mar 2021 11:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D078FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add support for STA to handle beacon miss
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1614340859-28867-1-git-send-email-lavaks@codeaurora.org>
References: <1614340859-28867-1-git-send-email-lavaks@codeaurora.org>
To: Lavanya Suresh <lavaks@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Lavanya Suresh <lavaks@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210309110254.4B60EC43462@smtp.codeaurora.org>
Date: Tue,  9 Mar 2021 11:02:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_110352_984083_AE67541B 
X-CRM114-Status: UNSURE (   8.41  )
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

Lavanya Suresh <lavaks@codeaurora.org> wrote:

> When AP goes down without any indication to STA, firmware detects
> missing beacon, and sends wmi roam event with reason BEACON_MISS
> to the host.
> 
> Added support for STA mode to trigger disassociation from AP,
> on receiving this event from firmware.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01717-QCAHKSWPL_SILICONZ-1
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

26f697923729 ath11k: Add support for STA to handle beacon miss

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1614340859-28867-1-git-send-email-lavaks@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
