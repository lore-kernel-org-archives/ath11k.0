Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B21FC77B72
	for <ath11k@archiver.kernel.org>; Thu, 20 Apr 2023 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHqT9L15pvkA/0D5VoS/vfwWp2LfMxT0ik5L5Hwj7N8=; b=0S2IKm55ZXpB5E
	75DJWU/0xfG81rC8og+FhrA7w3Q12SI4Nm39cBelkrvCrt45ThPbGJ/wI/BvlLImamafxiASUBzID
	/nyG+CwyEmObExCvcJ6E0ual6CN1M8lcs2a9b3oBBN5FaN5KEQgrmKRr9NQwWhZEULswHlUrnTUfg
	2FYrKTVEUHF0x+abxOVcfZ74GGf33hDaRopqT7JYD7Oxnkvfgbh/SOJGyehbAEFVL25WEmDMTWkbv
	heBnHS6F+3GMc+WS7KuCsm7IectO1oMD15aj90EwQ5d+xIMtuV357RfdBNRsQ1/sieU4RAr3OpFbO
	b/p7GeaAGW/twuOBDENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTDP-0081wM-0h;
	Thu, 20 Apr 2023 12:16:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTDN-0081vf-0n
	for ath11k@lists.infradead.org;
	Thu, 20 Apr 2023 12:16:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE98C648EF;
	Thu, 20 Apr 2023 12:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988C3C433EF;
	Thu, 20 Apr 2023 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681993000;
	bh=RXI+pMWiZEOieE+i9B8p6d7OkVfOzzEZB+dDqbwTcN8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=l9ZqVTjgo/RxiXT0KIlnEnSrL7l1k5XYm4kxDkLM5VQysqalDex0xcdBzXK/rl+wI
	 wEkbjjGUxCJD08080IvfH/8MUCw2ePwDUxgd+XeiJafhaYI22MvlgAHN97qIFv0cls
	 4M8SWd9Ksv288SoOr87DLJNkq3XjjZXe8r3hfWtmuyBDes5+AurhLe8ntMeOAqEwx7
	 pbbzYVgffuQTSePXdPkB+ZZ2hnEcdwSJEofwrZWDxnD+nmrkHEYXXRmfhtEb9m/3gY
	 mn+kF+ErqgAN6DbopLfJLl3v4P+5kJDt0yXhJnf35/5SvIwHsz1SdE1tJFkNlGc3Yy
	 OjlK2RFZO4zZw==
From: Kalle Valo <kvalo@kernel.org>
To: Doug Brewer <brewer.doug@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: QCA9074 problem on rk3568
References: <CAG0V13RiyW0HptSbZ6vxoTCmdjzrYZ9MQxCqKuiczJL9znW0-g@mail.gmail.com>
Date: Thu, 20 Apr 2023 15:16:37 +0300
In-Reply-To: <CAG0V13RiyW0HptSbZ6vxoTCmdjzrYZ9MQxCqKuiczJL9znW0-g@mail.gmail.com>
	(Doug Brewer's message of "Thu, 20 Apr 2023 13:49:40 +0800")
Message-ID: <87mt32vjdm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_051641_324997_F348BE76 
X-CRM114-Status: GOOD (  12.57  )
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

Doug Brewer <brewer.doug@gmail.com> writes:

> I tried to install linux kernel 6.3-rc7 on my rk3568 evb.  It seems there's
> a problem about MHI:
>
> [   11.340558] ath11k_pci 0002:01:00.0: BAR 0: assigned [mem 0x380000000-0x3801f
> ffff 64bit]
> [   11.341399] ath11k_pci 0002:01:00.0: enabling device (0000 -> 0002)
> [   11.422849] ath11k_pci 0002:01:00.0: MSI vectors: 16
> [   11.423335] ath11k_pci 0002:01:00.0: qcn9074 hw1.0
> [   11.660846] mhi mhi0: Requested to power ON
> [   11.661271] mhi mhi0: Power on setup success
> [   31.716289] mhi mhi0: MHI did not load image over BHI, ret: -5
> [   60.551942] mhi mhi0: Device failed to enter READY state
> [   60.552544] mhi mhi0: Error moving from PM state: Firmware Download Error to:
> DISABLE
> [   60.553376] ath11k_pci 0002:01:00.0: failed to power up mhi: -110
> [   60.553972] ath11k_pci 0002:01:00.0: failed to start mhi: -110
> [   60.554532] ath11k_pci 0002:01:00.0: failed to power up :-110
> [   60.567907] ath11k_pci 0002:01:00.0: failed to create soc core:
> -110
> [   60.568488] ath11k_pci 0002:01:00.0: failed to init core: -110
>
> Any idea how to fix it?  Thanks.

I would first check that the firmware files are not corrupted.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
