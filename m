Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB88C433ED
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 00:14:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2279613C7
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 00:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2279613C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oXSmaltzKWtZcu2ZlwvMRyKwxhHv6Z/ZP3hJAdadbKI=; b=N+VqJAROV59bOv9Ug3/PNcY6r
	SkQcfIXCquotEdaGQRVqYSbILTcYk/4B544kGuR8oQF/W4Q6ABJeJqLcBiJ7BCayF5OOxn5QKdEiD
	KMQMPpmYZ7PHLtTD7C1TltuN99NkARAvA2bbFfWnDeLOUb2phDdJwKd3bUvPz1bZN+JODsFiOIbmT
	UQBl+hodjRcCuN19OGa/p5yOlvxezHn6ECBa1XKhzxE3f1cTeZ4IHIb9BUtjWwBd7ZQONhFw81uWD
	/RJ4B5/qzxfZpf3wb8gnniAQc7Yb8awURSbZAKxT50Ob4X6kMgC8YWwQ6zYXjTAw4IJPtT8jmzIPa
	TuuWpeNPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leRf4-002gPm-Qw; Thu, 06 May 2021 00:14:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leReq-002gOw-B8
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 00:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=5fwKcjHax50dfp3M7rm8cG/FTAK0v0ueeXfFMFBGvSw=; b=GlxfI/Mt9REFYDAu4oHsFFLg+6
 n3k+EPtcWDtXmufZ2I/JWE7Bpo79nwzfu6oBWpJeilCTmRE9w7ZEvsY6Q+8FE5uUktchabyARugIC
 QtSUM1AjR0yUtbWAc9N+q1vCqmDe1SvMaYV92n2F3MRiJu3L/CBODELwYahFZmJzTTtWszayYhvSi
 gblia+xdNOQp2g0fukhjn28dBfRF7DUTqsI5T4DdYhoiYqdZH4VA8zvhH4azClD0bTEGBNUmRXjCe
 Y7Y8plO9ZXvyGNzjkMbN6q2UnFTp1TL4rAMWNLHvhfUXb4Ybj2JwXFbhauQyJGNn7fMfTdeIFH8wI
 fdh1z3nw==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leRen-005QPe-0w
 for ath11k@lists.infradead.org; Thu, 06 May 2021 00:14:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620260061; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5fwKcjHax50dfp3M7rm8cG/FTAK0v0ueeXfFMFBGvSw=;
 b=NByCVXl0VmdY/rtji1KyggHb/et3CjdEMfdH4tYmdLS7bJYJ0QGDawdJ4y2nkgvC4EUTlDq/
 QV55UrCOsstLsNKZqRmEvVv3I9hrmgoB4FlgxSpddCro4PjWDNB8e6EDnE+cpbfslLcfpMev
 xJkpNmuTLvec1x1bmZfqcRtHkAM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 609334db8807bcde1d265c97 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 00:14:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 470C7C433F1; Thu,  6 May 2021 00:14:19 +0000 (UTC)
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hemantk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 457B6C433D3;
 Thu,  6 May 2021 00:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 457B6C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 5/6] bus: mhi: pci_generic: Set register access length
 for MHI driver
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 linux-wireless@vger.kernel.org, kvalo@codeaurora.org,
 ath11k@lists.infradead.org
References: <1620234501-30461-1-git-send-email-bbhatt@codeaurora.org>
 <1620234501-30461-6-git-send-email-bbhatt@codeaurora.org>
From: Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <eb0ead5a-94e6-d5c5-4450-04e4515b59b8@codeaurora.org>
Date: Wed, 5 May 2021 17:14:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620234501-30461-6-git-send-email-bbhatt@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_171422_011977_0B446B2E 
X-CRM114-Status: GOOD (  13.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 5/5/21 10:08 AM, Bhaumik Bhatt wrote:
> MHI driver requires register space length to add range checks and
> prevent memory region accesses outside of that for MMIO space.
> Set it from the PCI generic controller driver before registering
> the MHI controller.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
