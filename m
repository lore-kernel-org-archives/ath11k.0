Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD87C19F2C
	for <ath11k@archiver.kernel.org>; Mon,  1 Aug 2022 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0L3a3/Sc79WuUE5GByGe6SBjoDN0P43sVq+xTj4svY=; b=H5BLwfXpiB/UO4
	ZRxhZ2FaRiehPeuz/F0lK326FoK4gymc3d8UYjX8TYIxFoNlX7V9TvijBqOPw+P+tsLlZbCnkYB0A
	macyOKvwevqWZH0tnpewNvveKXrSW77LzacfneMu/Xy9H2cK5Bec7pHPF7ZdXRzWeTo96a8DG7Yxt
	wViPIFyeu7wjUjJkNEkZ5GJyAfY6ZKjIBsJzPIzzT99XWyn1q1OQkB3hRXpvlD0B2YnTJ7SKpbOpx
	VIeQPJLMbaRnfr3xYdBMQTUuhPYvceYt4qyt6k6lMzb6uR3ekBcGzUdlm+MBi1kx4efmpEvmg+8Fn
	dk+t3SGb+r3xfHGTa55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIS7j-004had-F2; Mon, 01 Aug 2022 09:54:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIS7U-004hQ0-Vd
	for ath11k@lists.infradead.org; Mon, 01 Aug 2022 09:53:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BF9EDB80EBD;
	Mon,  1 Aug 2022 09:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C1EC433C1;
	Mon,  1 Aug 2022 09:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659347629;
	bh=KgTzxBxEEN86aBnyZlmtsQ4h8fcKfVdVl2nqGvyQETA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RDvFACDOQJ1L8Zp7lXqfZRfSYgK3wzaHoLzoPWbGo4Syaqx7m7GB02tRL9RdUMZ65
	 9nnCon1ZsoTD9LGQOBz/vfs/7POzhHgm/s/f5WVYOy/OlvIIQIXu/HOsvYm3zjSV3T
	 vdzpHODRcjQu4FavCsltCyd36deDYtPEATTyiR4elFK6mNBpJJWbOuk5JmGH/qzgg7
	 /9JxLGeUj3TjtQQ+sT2jWTildyQJNfugjBP2WbPvqPOEFDvQ9X0P6HQz8El2v3FzKr
	 83JLPxsQxqmL65i7ZdTe3yavMjbdAnacwR9+6cwrv/Byy2uYWKeurpvtMc/6CE83qH
	 xwiqlzvsjLC5Q==
From: Kalle Valo <kvalo@kernel.org>
To: Antonin GODARD <agodard@witekio.com>
Cc: "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: ath11k and P2P
References: <AS4P192MB150315B3727210918C6A6A7EAD919@AS4P192MB1503.EURP192.PROD.OUTLOOK.COM>
Date: Mon, 01 Aug 2022 12:53:45 +0300
In-Reply-To: <AS4P192MB150315B3727210918C6A6A7EAD919@AS4P192MB1503.EURP192.PROD.OUTLOOK.COM>
	(Antonin GODARD's message of "Thu, 21 Jul 2022 08:35:45 +0000")
Message-ID: <8735egnvbq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_025353_215718_173C2E6B 
X-CRM114-Status: GOOD (  15.40  )
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

Antonin GODARD <agodard@witekio.com> writes:

> As of today it is known that P2P-Client and P2P-GO are unsupported features of the ath11k driver.
> Are we able to tell whether this feature will be implemented in the
> future? If yes, do we have any information on its development progress
> and its release date?

This has been requested before as well, can you file a feature request
to bugzilla:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport

That way it's easier to track.

> This message contains confidential information and is intended only
> for the individual(s) addressed in the message. If you aren't the
> named addressee, you should not disseminate, distribute, or copy this
> e-mail.

Please don't use disclaimers like this in public lists.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
