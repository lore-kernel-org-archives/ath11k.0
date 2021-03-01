Return-Path: <SRS0=Rum7=H7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96343C433E0
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 10:59:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3702E64EF0
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 10:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3702E64EF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NfMVq/1O4mO8sEzeyY4pXwzxRpw2U4NSY2rc5sd9aC0=; b=ya9V2g/5/MjY1J+nlNtiIV52s
	75+7/wsDwBPYdQnRG/oCdPXnnOwoxusWzYtozpj0UzYEjAVXd+SpYg0tMDrFDReDognZBgionR/MU
	M/QGSTnzGv27iUgxMVpm0jGZ3pgB/L/dv74hP8aNOKpeSVY16PMBbqfNTpTdpOtjYHCj/H1JI6MVo
	lrCyYGWwEHT6QqIiwlOjZfc/BxKd+XaL529GhpRwp6BVRRO5oiR/Vtj/MngpJ8SXnnvLRD2gAPCMZ
	DPvlcemmRZz82iY8nwVxHGHY3GyOC6OowuRcIPcPyAMaK53pTtysykmIL0yvdQ8NabGy7Ydc6qD0b
	1dNO6fHjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGgGj-00052s-OY; Mon, 01 Mar 2021 10:59:17 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGgGe-00051C-NZ
 for ath11k@lists.infradead.org; Mon, 01 Mar 2021 10:59:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614596354; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=PUWvBal5eDewRKrdOtC3UaIdrbBkYlWWtvnC47/UQIs=;
 b=wARN+tFU5X2LfN/4rdJk5zaFY1cRVPhlVslohcXfSnzrpeXp1Mea8S2fxNj6mHxjHLPH3NCr
 En6vRP+Lax9NiY7v2vJMOa/9dP9oFqx1EXYN+tXaolfi1k0U5txSWXuCndhMsIFaJQv+BsdI
 hTerNz4aihhM1hApUoAAOEYqvYg=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 603cc8f58f0d5ba6c58144fa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 10:59:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 66AF3C433ED; Mon,  1 Mar 2021 10:59:01 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F0601C43462;
 Mon,  1 Mar 2021 10:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F0601C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Sven Eckelmann <sven@narfation.org>
Subject: Re: IPQ8074: hw2.0: Wrong mac address for 2.4GHz PHY with firmware
 2.5.0.1.r1-00004
References: <12396947.EVyyLHbfrO@ripper> <4391993.8BYWHWz4yj@ripper>
Date: Mon, 01 Mar 2021 12:58:57 +0200
In-Reply-To: <4391993.8BYWHWz4yj@ripper> (Sven Eckelmann's message of "Mon, 01
 Mar 2021 10:46:56 +0100")
Message-ID: <87wnur87im.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_055915_065226_63FB31E9 
X-CRM114-Status: GOOD (  10.97  )
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

Sven Eckelmann <sven@narfation.org> writes:

> On Monday, 18 January 2021 09:14:54 CET Sven Eckelmann wrote:
> [...]
>> Now with the new firmware WLAN.HK.2.5.0.1.r1-00004-QCAHKSWPL_SILICONZ-1, it 
>> suddenly uses a mac address which is not part of the pre-cal data.
>
> @Kalle, the QCA firmware team assumes that this is fixed in 2.5.0.1.r2. Could 
> you provide this also in ath11k-firmware?

My plan is to upload it at some point, but don't know when exactly.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
