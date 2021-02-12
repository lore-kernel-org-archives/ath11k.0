Return-Path: <SRS0=PtVs=HO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A03C433DB
	for <ath11k@archiver.kernel.org>; Fri, 12 Feb 2021 07:43:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EB6164E57
	for <ath11k@archiver.kernel.org>; Fri, 12 Feb 2021 07:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EB6164E57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IzPM2usPqyrz3KE1m6a9RiZ87rIhW3RZJroD/vrK/nc=; b=Y9+BlhgZ1ZG5KYXrVRZASQcMo
	/lnRupVvYebFbh19RcNBdwP7pfeIZUSUwzEkWk1OIh4eBPFfaZUQknLeQXS4g09t6qhn9O5YkWIb6
	EDkwqergmBvrPWEXbr0XewlIQOLYWR2hR2hw76G/Bn4wONL3rq4Gl0BxLzbWeBRWERMXLdJHlvkQu
	QxIbTd5FeOEIBlQdp4R+K4M/Tw04b23plOd/0a7GoPX4fw7inW0G1Ota0qpK6qIUyjat5vPFjZ+O3
	6cEOdYh5/zfpO3eoLIguCmqXF5vCVAsHTavLXZsa+61e47ZbDaZbcVTiRa3+kdv8mdxfGBChHHOJy
	LzYtZk4bA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAT6j-0000fm-MG; Fri, 12 Feb 2021 07:43:17 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAT6h-0000f4-02
 for ath11k@lists.infradead.org; Fri, 12 Feb 2021 07:43:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613115794; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=LDoAUfbUTIjS2lFBCekC02HTmp2Bvakc1GmRUWKV17A=;
 b=D+ZuaAvtN09tMmZFNsc0LyTHY0Auk/S0ANjqb8j1LNgXf+GE/2JJaxKLf1AYfk5Tyhf69k8D
 6rzOAuRrNfbKiCTyW6oGm0rkA+mC8BcQK0EiDTx1DLul+BvQLc3/RBC8Z4KmEu6ohoJ0vfnH
 AhUsT10iy8HaUMF+TLP2lhtPzyk=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60263191e4842e9128d00ccc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Feb 2021 07:43:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 99276C433CA; Fri, 12 Feb 2021 07:43:12 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 24DFAC433ED;
 Fri, 12 Feb 2021 07:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 24DFAC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: wireless wiki: ath11k missing in drivers page
References: <CAM+r-RhxY4TA4zPm6e6ah9RWdBY67J=5oRS3+=+EQMomKa10QQ@mail.gmail.com>
 <CA+icZUUM8cPUvwVRFqodZxNs=4pVaBJGCWu6mL=9T5tym_OmeA@mail.gmail.com>
 <CA+icZUX7+bOgqPTtwNjXO4PCvjAm9T7akWvDxV47QPMR2auiSQ@mail.gmail.com>
Date: Fri, 12 Feb 2021 09:43:09 +0200
In-Reply-To: <CA+icZUX7+bOgqPTtwNjXO4PCvjAm9T7akWvDxV47QPMR2auiSQ@mail.gmail.com>
 (Sedat Dilek's message of "Tue, 5 Jan 2021 14:40:36 +0100")
Message-ID: <87blcpspde.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_024315_067791_0764491A 
X-CRM114-Status: GOOD (  12.97  )
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

Sedat Dilek <sedat.dilek@gmail.com> writes:

> On Sun, Jan 3, 2021 at 1:50 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>>
>> Hi,
>>
>> recently someone asked about issues with ath11k devices.
>>
>> So, I checked the wireless wiki pages.
>>
>> In the drivers overview [1] ath10k is listed and linked [2] but not ath11k.
>> Smart enough I found [3].
>>
>> Can you or someone else add the link to athk11 in [1]?
>>
>> Thanks.
>>
>> Regards,
>> - Sedat -
>>
>> [1] https://wireless.wiki.kernel.org/en/users/drivers
>> [2] https://wireless.wiki.kernel.org/en/users/drivers/ath10k
>> [3] https://wireless.wiki.kernel.org/en/users/drivers/ath11k
>
> Thanks to whomever fixed the drivers overview page.

Thanks from my side as well. I updated the entry now, for example ath11k
does not support IBSS.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
