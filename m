Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492B9C63707
	for <ath11k@archiver.kernel.org>; Wed,  7 Dec 2022 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRbryq4QJ3cuY1pHgwDBv8UfowMuS/4OQUkTCY21Jpk=; b=L7LjqDrLJbBeyM
	q1y0uj/+bsPUplA0bnJcgrHJWopX1SRRmWLRCOJnf043GtdkW7L4ThXe6+EpZOZ+YG9Xwb2NouPgI
	BJAsI2PLQy38my7ziow9xDbIY6yBpTG42abR6AkyIcB1BXVR+JwgPx1x6ETRoNFpio4jjAqU4X7S2
	rTAW6oh4MW3IQsiIzQFNwG90mr4PWWwaR+Mg9I47FQFjBqTQxf2oRcrKrypME+DVIN9PLfUnV9C1J
	MbfuLRKTE/THJWR2eQj+XAOKCt1+3U0hUdwbXv+PnHJI+IazVOc0BLFsUsXuYsD00/3+5er4+sW2v
	chdH6cLKf796I/v2bG3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2u8K-00335c-Hj; Wed, 07 Dec 2022 13:06:44 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2u8F-0032zG-G9
	for ath11k@lists.infradead.org; Wed, 07 Dec 2022 13:06:43 +0000
Received: by mail-pf1-x42e.google.com with SMTP id t18so7041487pfq.13
        for <ath11k@lists.infradead.org>; Wed, 07 Dec 2022 05:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mcab1o1WZcapaZGwYzco9EoH6siRKI9u1E26wQ+oeaw=;
        b=KIm5RG20/7EPv6TQDpNq8WN3r/D9gi4w7LSGi4jfisMGBq+gO/zF69BI8Dc8UM1vtm
         6cPpbQUxXccej7+IC3SYeSlKzj8mO1Xn11Rqns4UJcNePUdeMMb6gEnQRHH2Pj0BMFfR
         T9uH8a1q1NocR2+6qXh4HjEZx5/VOY9kon/wmQomEG7tqEjOu5wGTLBa7C+wcGvjLDIe
         +6pKr0OFIoZB0XC17AU1AkTJE89l1Mi4HmfgsYRFYpAgcNnL5E6QxfwxWo80DyLSDidF
         vBZT6i4RFCJdQQ8y6Lmuin/U47odI/pWf6u35gbcULVEevAo5nG2AzuAXdM7Lld+nxKc
         Rzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcab1o1WZcapaZGwYzco9EoH6siRKI9u1E26wQ+oeaw=;
        b=QZk7wrDxs/HuPGC8itgt/dn8eCLRGAzpoYw+J6X4hdUpj/PwDHROlCAedjxIto2PlV
         zLzdhHE1wsZ7ZiDxFOd8ZzbdHJyxegsZUJVdnJTYs+/+7c5y6/3Q3gdkyy9NbCM4EwHK
         /J5102snTvVBPN3VnMZhxHKuN1mZkfodFBZiAV4QSC7XCBl2/XDZYj8mV93VnoEyyqzU
         Sd++fnAJkIdyToPVrlEezJsGNdx3yABx1seOk6Zyitf9Cde/xt7bIfcRPV3fN3JilpB+
         Qq3kzqOHNnPpuV8J+9y4aePudBoXxA7G7lKSNAO/au0KaB5WIDDME4dbqfr/w9/fftos
         FniA==
X-Gm-Message-State: ANoB5pktLYDamZrqC1sN5vHzWqCfptKSKtXT4GrOIRx4ZcZZ4xjZAGBB
	7xzmXmd9vR/8bVt5wWUnI+IbDegM3JnaMlIwyXC4pPiWKK5NNQ==
X-Google-Smtp-Source: AA0mqf69M3u94U8qKcI8d7nMqL4kF224wZqdWE1mGHGAlML4dx9PLB221c/Ml1AH7LAXjfuv6pXUXa16NwWHXvKKRfg=
X-Received: by 2002:aa7:9911:0:b0:576:796e:8128 with SMTP id
 z17-20020aa79911000000b00576796e8128mr23003165pff.68.1670418397164; Wed, 07
 Dec 2022 05:06:37 -0800 (PST)
MIME-Version: 1.0
References: <CACDmYyc7G=pv5gBpwxm=tYChnbnmtTV990aEDCieLeKvwr=pOg@mail.gmail.com>
 <878rjj2ww9.fsf@kernel.org>
In-Reply-To: <878rjj2ww9.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 7 Dec 2022 14:06:26 +0100
Message-ID: <CA+HBbNF4MrEKjG=cVmu0d6UyO6NDyw=cVoG93hrkxVKQLF1h+w@mail.gmail.com>
Subject: Re: wifi: ath11k: ipq6018 monitor mode is not working properly
To: Kalle Valo <kvalo@kernel.org>
Cc: Legale Legage <legale.legale@gmail.com>, ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_050639_561730_7010ADD2 
X-CRM114-Status: GOOD (  13.96  )
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

On Wed, Dec 7, 2022 at 1:58 PM Kalle Valo <kvalo@kernel.org> wrote:
>
> Legale Legage <legale.legale@gmail.com> writes:
>
> > I'm trying to use wifi monitor mode on ipq6018. Captured frames are
> > malformed. Tested with 2 diff kernels (4.4.60, 5.14) and two diff wifi
> > fw (2.6, 2.7) with the same result.
>
> v4.4 was released back in 2016 and doesn't even have ath11k. v5.14 was
> released over a year ago so is considered old from ath11k point of view.
> Please try a more recent kernel, preferably v6.0.

I am gonna guess that 4.4.60 is QCA downstream kernel.
The issue with mainline kernels is that there is no remoteproc support
for IPQ8074 nor
IPQ6018, I have been working towards getting the IPQ8074 and its working with
remoteproc patches added but the situation is not ideal as for example
coldboot calibration
does not work which could be a bug in the remoteproc patches I am using.

Regards,
Robert
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
