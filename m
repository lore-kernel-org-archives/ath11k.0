Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C8AEB64DC
	for <ath11k@archiver.kernel.org>; Tue, 11 Jul 2023 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTfclSHJuHDfhrK7ZVE61oNt0d7JHO2Pz0PoWu3nqMo=; b=n6tUme7gfYDnly
	/YJ7ZipxYWnBC74V9vSFX0x9Lk/90aqYNJKjdFG+2QmwrdW2oxwpDQxdzXE3i99skz4JPJXLJN+CF
	zkeAdhUc8HHdh+GSgLqhHkD+uhvxWKpUsPZLUQtBgQSaWrgm3SFXE2wef2sB6RGEU7l+kcw9Y/UU6
	gdDqv87sR1IVsTrvUk7HjkGMWg0chbV6WcdLAtrJk6dSq5Q8ZLH/mummisebqRM8dYRV7pAbTAi27
	GZLoKoyUw2+E3cqCRu+NhAaISNDPhHLutT87jlfEx6B4150558BPm8Xm1uxeviM5zeScni98XX78Q
	x7VYz6ByFupc2wB7KagQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8uY-00E8uJ-39;
	Tue, 11 Jul 2023 08:39:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8uW-00E8tQ-1S
	for ath11k@lists.infradead.org;
	Tue, 11 Jul 2023 08:39:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E5F6561370;
	Tue, 11 Jul 2023 08:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00BEC433C8;
	Tue, 11 Jul 2023 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689064791;
	bh=q7EtRyCQvg7IYCgRZu9s9oqzdmwkD5neDr870LsRjec=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Y+Q+Og/mHbgQq1XviTqJuneBkUvnm3IOP91Ad2C8j8KPFqNAxevFrgQXwoU3BT+xs
	 HXImcONrAz06/rVVCvC51uiVejksenNd0EgpPcdGR8ywCos5Qror6qDyPfr3UkX5Bz
	 /FcOOuF9EwzSTYv1ua9fznL2Nl5MHCgKSi/Z0TLJ3IPRLNY8Quoi1oFfk4jv8IWaB0
	 CTD1t6jrrOIXgn/aIUtwjDoiCL4iijs667GYobBhRY/sjHoKC6YjfrExvD2QncHpTc
	 hTy/bn+BphrhrDJ3n+Wl/79idIFFqFCp4Vh/hePJRLEOhiw+nAPogy7R7+Ta0hdgvb
	 PSK++YS6K6i8Q==
From: Kalle Valo <kvalo@kernel.org>
To: Tanguy Serrat <tanguy@squaremind.io>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: QCN9074: low HE-MCS index
References: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
	<87sf9v7xir.fsf@kernel.org>
	<CAPr+0HbwpA0KrV71ah8bQ_Gnn9Ch2PMZnHE3uqRUrNU8=DoMFA@mail.gmail.com>
Date: Tue, 11 Jul 2023 11:39:48 +0300
In-Reply-To: <CAPr+0HbwpA0KrV71ah8bQ_Gnn9Ch2PMZnHE3uqRUrNU8=DoMFA@mail.gmail.com>
	(Tanguy Serrat's message of "Tue, 11 Jul 2023 10:15:50 +0200")
Message-ID: <87jzv696zv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_013952_531768_A88C6813 
X-CRM114-Status: GOOD (  13.44  )
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

Tanguy Serrat <tanguy@squaremind.io> writes:

> Dear Kalle,
>
> Thank you for your reply.
>
> I have opened two separate issues:
> 1) https://bugzilla.kernel.org/show_bug.cgi?id=217536 - related to a
> previous issue I encountered.
>
> 2) https://bugzilla.kernel.org/show_bug.cgi?id=217652 - related to this feed.
>
> I have tested 3m apart, as described in 217652, results are just
> slightly better in terms of reported MCS. I still seem to be missing
> all capabilities over 7. I have attached the full dmesg log and
> .config file to the bug report

Thanks for filing the report, we will look at bug #217652 and get back
to you. But do note that this will most likely take some time, our
backlog is long and people are also taking vacations. I just came back
yesterday and I'm hoping to take more vacation later this month.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
