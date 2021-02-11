Return-Path: <SRS0=Y6aC=HN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A2CC433E0
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 07:07:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6782064E66
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 07:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6782064E66
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GH2fXPkybd3X/EHeJGpgypc/IOndM9g0xnc1RPZdmkY=; b=3e4m6rLmjv1YusrSfbpC99Dqx
	809bcg8mOyTdd7EvhUYqkMn5VH1dpj0JOefwHulawbcTGRJsxGfsnzVhoD6HbKr2h6wdymuNnBE+4
	dav8cT2mrWykgh5E32KQziX+VlzHSv9snwbI5SEUuXM3ds/yNeSrzKfM3vXZW1E+48LDqGzyXwSKp
	+md6SZdrv8NGri4bhPkibS4GnCbEtuZM+ulFbuUI4nVKdcQPFJNQbGcSyzaoYVMsiKJqfnCDxyGw5
	jiw/uVvarMiPBm9hECyMDDEwP7YavFwjaBS2B1c7U/tolobgbfiil/kIlyq6uLAOnyFU7FOLQBy9p
	ts0BBYTkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA64m-0002t6-Gm; Thu, 11 Feb 2021 07:07:44 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA64k-0002s9-KH
 for ath11k@lists.infradead.org; Thu, 11 Feb 2021 07:07:43 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613027262; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=bTWpo1acmuHQQrJMGxIYPKewbdbOilh/v6Xg0ZUSLcw=;
 b=NSWvonP/yNkww4QSkDrXeLUvhUlccQ7zmws6OQBg3R+k6rR9+V7E3839nhhjofQo1CKRVfW6
 CuWVDnJZagr1EvuBBvhk1ZmbI3oitvlpuikBSh2dpmAggABeOC8+ZHHvddlp1MqliRqwYWC5
 m2tMqnJ7yB7KHWYsn3XNau8UQAA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6024d7bd81f6c45dce4b8e38 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 07:07:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1539EC43461; Thu, 11 Feb 2021 07:07:41 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C7EA6C433CA;
 Thu, 11 Feb 2021 07:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C7EA6C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH 0/6] ath11k: support one MSI vector
References: <20201223030225.2345-1-cjhuang@codeaurora.org>
Date: Thu, 11 Feb 2021 09:07:35 +0200
In-Reply-To: <20201223030225.2345-1-cjhuang@codeaurora.org> (Carl Huang's
 message of "Tue, 22 Dec 2020 22:02:19 -0500")
Message-ID: <87czx7t748.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_020742_730472_3A7A23E1 
X-CRM114-Status: GOOD (  13.11  )
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

Carl Huang <cjhuang@codeaurora.org> writes:

> This patch set is to support one MSI vector for QCA6390.
>
> Carl Huang (6):
>   ath11k: get msi_data again after request_irq is called
>   ath11k: add ce and ext irq flag to indicate irq_handler
>   ath11k: use ATH11K_PCI_IRQ_DP_OFFSET for dp irqx
>   ath11k: refactor mulitple msi vector implementation
>   ath11k: supports one MSI vector
>   ath11k: do not restore ASPM in case of single MSI vector

I did some cleanup and before submitting v2 I noticed the patchset (both
v1 and v2) is crashing during suspend on my Dell XPS 13 9310. We are
investigating the reason for that and will submit v2 once those are
fixed.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
