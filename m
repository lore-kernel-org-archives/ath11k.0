Return-Path: <SRS0=Hkj5=GP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50244C433DB
	for <ath11k@archiver.kernel.org>; Tue, 12 Jan 2021 08:18:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5CAF22D2C
	for <ath11k@archiver.kernel.org>; Tue, 12 Jan 2021 08:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5CAF22D2C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NUtQAqjjp4U33yaCGx9sMTqofaF222Io5x9d5KikSrY=; b=i3GhDjjIA/pHVQSMGZnHeGvZ8
	ENa2u62+g4bmj2dxkieg55PwcYnDUGndB6L40JhZEHWBvaoTstZo5T6m7Rh1Wy/dyE9lEKkTpzuoV
	AgqpjQZmJJ0Ck1zxwjeHsK5bUQiK30nhbarggFyhCz3I6aiHsTs+GpowOlovfR1OAGCLRk/oanKnQ
	H+B4OjNSpUGib8f1l5OsoEzW8VlBJOeSHmU9Oi6GS9iLnjf6AjDFd4c9T+IMJlO5PPd1fSDmRWpQt
	Q+Pn8AdQnSkz2itRAzR1wKlhgOPuBNWjzEi2Dg3k4x8pBrQsrlqNipMoRuSuqZYLgXiRgrVhQQst3
	2euXulvyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzEsX-0000Iq-Hr; Tue, 12 Jan 2021 08:18:13 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzEsR-0000FP-26
 for ath11k@lists.infradead.org; Tue, 12 Jan 2021 08:18:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610439488; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=2vajgpMaFR2QTnBdosonuKX7uPdySUR4aGWt7yV9zTg=;
 b=KGhQtHwDpv2/rlYrMZi4/blp4NxM73DKxUf7/aRk96Zei6T1RxRvAPlnKPw0VPJ6GIsgSI/Z
 q5qPMPk2NLTGKUZG3NzErZ9iVlfGMiBz6ysGbP5Y5H0jPXS/j/mPBCtFm0GT26cOljGXofkg
 +WY8Otxy8LmiALuTApbAOCaJwGs=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ffd5b3846a6c7cde7bc684d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 12 Jan 2021 08:18:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0DECFC43461; Tue, 12 Jan 2021 08:18:00 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BAAD9C433ED;
 Tue, 12 Jan 2021 08:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BAAD9C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wren Turkal <wt@penguintechs.org>
Subject: Re: Dell XPS 13 9310 wifi broken
References: <b50f70f1-7f1f-a19c-9747-fd94a33baf97@penguintechs.org>
Date: Tue, 12 Jan 2021 10:17:56 +0200
In-Reply-To: <b50f70f1-7f1f-a19c-9747-fd94a33baf97@penguintechs.org> (Wren
 Turkal's message of "Wed, 6 Jan 2021 16:38:39 -0800")
Message-ID: <87zh1ein63.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_031808_475843_170F024B 
X-CRM114-Status: GOOD (  17.89  )
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
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Wren Turkal <wt@penguintechs.org> writes:

> Hi ath11k experts,
>
> I am currently using Fedora rawhide and have installed their
> version of the 5.11-rc2 kernel. The ath11k driver is broken for
> this laptop.
>
> Here's a snippet of the dmesg:
> [    3.845315] ath11k_pci 0000:55:00.0: WARNING: ath11k PCI support is
> experimental![    3.845652] ath11k_pci 0000:55:00.0: BAR 0: assigned [mem
> 0x8e300000-0x8e3fffff 64bit]
> [    3.845674] ath11k_pci 0000:55:00.0: enabling device (0000 -> 0002)
> [    3.845708] ath11k_pci 0000:55:00.0: failed to get 32 MSI vectors,
> only -28 available
> [    3.845714] ath11k_pci 0000:55:00.0: failed to enable msi: -28
> [    3.845728] ath11k_pci: probe of 0000:55:00.0 failed with error -28
>
>
> I have also attached a full lspci output for the device in
> question. I did see the previous thread about this hardware,
> and I just wanted to provide another datapoint and see if
> there is any way I can help with this.

This is a known issue and there are proof of concept patches in
ath11k-qca6390-bringup branch to get 9310 working:

https://lore.kernel.org/ath11k/87blew3e4q.fsf@codeaurora.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
