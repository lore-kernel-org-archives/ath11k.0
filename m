Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8A2C433EF
	for <ath11k@archiver.kernel.org>; Wed, 13 Apr 2022 08:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBF8M2T+fXEKgtOx3UHvxNZH5/XvoRLe6SShCd1iih0=; b=SNu301A39SCGaB
	aKd2RxpXp6XQWcc2LRYQfi0CLEUSvQTdavtWtdm69j16AnCN229+2+dwQMNg2PkwmXMdXM8CyI4Dy
	UgIo2xJdE8qAVA2pV3LbYM163SjOVCyK9RubPJgZe/uRYNs60Fmy7Rp4OjoaLDKkZJ12sU/7E9BrY
	nYEZo7b+BImcWBKe9DxH4LI8YS9Y+B9nvNgHsEUezD5aZtTv8lugoKEPcz5qCkLDqh6E2utK0gl0U
	z17icJy2o+ANXZds9gKNIcZYi8FmaN0hvulauM10AXkEKXGc/4RTNIuMjCf+6Y3DK7nz+gJYG4tSa
	QgVEliU4TZNPo9ehmpSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neXwr-00HVzY-L8; Wed, 13 Apr 2022 08:01:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neXwo-00HVyy-LN
 for ath11k@lists.infradead.org; Wed, 13 Apr 2022 08:01:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06D1C61651;
 Wed, 13 Apr 2022 08:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA25C385A4;
 Wed, 13 Apr 2022 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649836913;
 bh=FtbpBLI3sodTYr7nTa4m1RUMrfO+bJcwHpGDVHUskGE=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=MDvvZ/01yPjstafS6QNVYoLGIj1aDFvwyP7M67KwbR7wlhdQKL6KLSCpTIxF5RuD5
 pS/IVTaZl4EGEzBEb84pLFvBjeje6K3CuH+14OQ4veYf7OdFmR3n0cv3ULcSdXWBFx
 SwT1C6csl1F5V1TdraUqpLvk0vyR9Rbe02mOj0nH/vcu25U3SDxWr5vjFQWAZMduaX
 jIMibkcbGUUlsM+sPBSNyfPBcNdqMyGP1nZaob3YMhe3JI1gyLqG18QSZvp6x/5Tnh
 CCq0ScitdLh250pia34k0tgEpi1hU3Mc0nksV6r2jQsI/+xA4azTcygkTWV7Pn/F/T
 9N9zwns1vRdZA==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: QCN9074: Incompatible board-2.bin for 6GHz
References: <2091899.pNsEtq2SQc@ripper> <2947430.zJFXT1rtDI@sven-l14>
 <87sfqhmpho.fsf@kernel.org> <3277532.u7iglclnok@ripper>
Date: Wed, 13 Apr 2022 11:01:47 +0300
In-Reply-To: <3277532.u7iglclnok@ripper> (Sven Eckelmann's message of "Wed, 13
 Apr 2022 09:26:23 +0200")
Message-ID: <87o815mmxg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_010154_775538_AD89B24A 
X-CRM114-Status: GOOD (  10.29  )
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

Sven Eckelmann <sven@narfation.org> writes:

> On Wednesday, 13 April 2022 09:06:27 CEST Kalle Valo wrote:
> [...]
>> Ah, I forgot to mention that everything under "testing" directory is
>> work-in-progress, and might break backwards compatibility. To keep
>> things simple I now removed all backwards incompatible files from my
>> ath11k-firmware. Also now there's a proper board-2.bin for QCN9074,
>> hopefully that works better. Do let me know if you have any issues.
>
> I have now used WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1 (+new board-2.bin) 
> with the Pineapple6. And at least on first glance it seems to work.

Great, thanks for testing.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
