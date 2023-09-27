Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D83E80A9D
	for <ath11k@archiver.kernel.org>; Wed, 27 Sep 2023 07:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b465/v4cPkB8ye/pweVsXckr4m0PzFhRkci9/VGyhYs=; b=G3wsvo9U39wQ/U
	QluAFvP/hsEG7JJ3T+X+ZZrk8sKZBWKnPMRjxVdCNoB5QFcRAgg3Mjk2nbYAVytAWHSOJ70d5JGwX
	NdV1eP7Y7d4BcsUjTiFQrsfmeoNDV3EH5jL0eLU2yaOqGXUrvYDLjTuuHDu/yKFhxyg1wzszShDYH
	n7Jc+et5miiWg5GfOnc4JeMHqahj8D3k5rqn4vnRD6ynyBL7tuqYdrPPVYFX31MMrTsZO7f6IE+sK
	h0bKVrAEKG989WwaQMEo6G8ZuTaDFWliYUj/G08MRWp/5qezPaSfD+G841ylKFsea2HW9EbHu94m5
	yP3VopgeqiycLn/J4JqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlOn3-000AMc-0H;
	Wed, 27 Sep 2023 07:16:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlOmz-000AME-0z
	for ath11k@lists.infradead.org;
	Wed, 27 Sep 2023 07:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 17E18CE184C;
	Wed, 27 Sep 2023 07:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF6FC433C8;
	Wed, 27 Sep 2023 07:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695799009;
	bh=i0hdeZsdwJTN2HnDWoAdqYR54CzDZbQvG8/u4rENkv0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=hVAd+WFfuHwT/VFymA2SnCkSclwppQrcqatEj5bgdM9VqcFN+yXXDrCZWN5zsN650
	 ZhpgfOpqTVek9lGFS0mQSiekIPTE40YV4XFbeML4nqBw02IO4ZDTxpMSWG4QvBgWHP
	 XVWQ+b97PuPZuSFaRKwK4vrJHhio36z/L7v2oW6202bz8NrFzqV9NxWcHWhhsN8FUW
	 mF5Iy6h615rTTSBuVt7xbDUTYNheeSwi/MQudprNFtx2mHce5IeFVUub+HHyXqUqrp
	 twM3Pyl1vu7WIKgvir+akH0R5qYDS7RLDW8AqJ4LTRDe4cwme5ukYQTmbEZqZ7dGE4
	 +sluGgbfIWsoQ==
From: Kalle Valo <kvalo@kernel.org>
To: Tanguy Serrat <tanguy@squaremind.io>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: QCN9074: low HE-MCS index
References: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
	<87sf9v7xir.fsf@kernel.org>
	<CAPr+0HbwpA0KrV71ah8bQ_Gnn9Ch2PMZnHE3uqRUrNU8=DoMFA@mail.gmail.com>
	<87jzv696zv.fsf@kernel.org>
	<CAPr+0HbBEXXqTJ7Hv3cfKBB=rtZ+tq4Xn_YVLxsNz=kbn3b=Ww@mail.gmail.com>
	<CAPr+0HYQqU_xciRk5+y1PN_UqZi_EY0FacH43Bxfw-daCMgY4w@mail.gmail.com>
Date: Wed, 27 Sep 2023 10:16:46 +0300
In-Reply-To: <CAPr+0HYQqU_xciRk5+y1PN_UqZi_EY0FacH43Bxfw-daCMgY4w@mail.gmail.com>
	(Tanguy Serrat's message of "Tue, 26 Sep 2023 13:05:44 +0200")
Message-ID: <877coc84rl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_001653_571833_A8B77B24 
X-CRM114-Status: UNSURE (   9.99  )
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

Tanguy Serrat <tanguy@squaremind.io> writes:

> Dear Kalle,
>
> I hope you and your team had great vacations.
>
> Would it be possible to have someone helping us out on our #217652 bug
> with QCN9074 ?
>
> This is a strong bottleneck on our side that we really need to solve.

Unfortunately I haven't been able to look at this at all and not sure
when I'm able to. Can anyone else help?

The bug report is here:

https://bugzilla.kernel.org/show_bug.cgi?id=217652

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
