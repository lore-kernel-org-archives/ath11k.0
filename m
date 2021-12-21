Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC04C433F5
	for <ath11k@archiver.kernel.org>; Tue, 21 Dec 2021 14:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzLqxfzWNr9HaIw+6WAkOBC1do6S5i3RGgVlmxFdwhE=; b=keFHROJrUlAymv
	MCl8eNBWnu1iaHptswxGs1yl6IRQ5ePqXm8VJ0I2MxjiTBGGXeXimRWsqaUMbpqeggOBAGlqRoRwC
	44d3hccL/WWfMgAXWPn+aEJmCT2J/9sesbt7stpZba1Obvddfb0Sig+fDEfrMpiN7F9GgttScBRYl
	H0IdHUhMlyGiPwpH6bims0llcbGjNzoq+Gj7uY1gYkoawgL/O2EF6ubSI790FmLaEN0MGX/oYMthI
	pxGWyca6uNpKi82kyFn74Dv7HoL+9PO2hE5Xree4M4EPYWBaLxdAZ9tW9FtFFd2E7OARa2zj+hsIi
	SRGRQRTxFoJ93ZNCiN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzgUq-007Cgl-Cr; Tue, 21 Dec 2021 14:52:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzgUo-007Cfm-F1
 for ath11k@lists.infradead.org; Tue, 21 Dec 2021 14:52:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F36486162A;
 Tue, 21 Dec 2021 14:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6204C36AEA;
 Tue, 21 Dec 2021 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640098325;
 bh=5mR3eQPB/oPV2I0b1p+qdJEk7DtS8h1KiMdG4l6XgCk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JUszW+ihMHJu3aiuyZzh1/X0BrkV36q1vOWUU9xHLzfMp3f6C8jqGFNmtvZ/hQobb
 exVqPwGeJB3DXksskHdpUq8WBZAd2rGXvj1JTTRQ8MuVZbUMvwwfgbgVkmU1xXVBKO
 7DQPkb4eXkUKrE3LRzhv1VXFSdH2jl4qe/irn67JDdRzgdbN67YQm0mE367Ltz2Wvv
 MbiCQ/hzuVs96Mocqen8baRAx7RVoXtspKlWOPTlozEf+12Epn4P+Kh+5+47ox8VY9
 cp/Gvk42WUS2h5N3SfaoQ3/Rwr4AaDwR3QtZNMQJbN+xVOImjOgjWtqEWdOJIpKxUH
 9xSC+zh01+pcA==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: QCN9074: Incompatible board-2.bin for 6GHz
In-Reply-To: <2340060.uFBqQg8s0L@ripper> (Sven Eckelmann's message of "Mon, 29
 Nov 2021 18:19:39 +0100")
References: <2091899.pNsEtq2SQc@ripper> <2340060.uFBqQg8s0L@ripper>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 21 Dec 2021 16:52:03 +0200
Message-ID: <87k0fy6mek.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_065206_581340_BB73408B 
X-CRM114-Status: GOOD (  16.47  )
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

> On Friday, 26 November 2021 11:52:42 CET Sven Eckelmann wrote:
>> I found out that this is actually caused by the BDF. If I've extracted the 
>> board.bin from the TIP board-2.bin [3] (which seems to come from the QCA 
>> ATH.11.4 CS release). With this version, it seems to work fine. I haven't yet 
>> found out what the relevant change is - but if someone has hints then this 
>> would could be interesting for other devices which should be added to things 
>> like OpenWrt.
>
> I had are look at that for another board. And I found out that they changed 
> the size of various sections in the BDF and moved stuff accordingly. And the 
> one in Kalle's ath11k-firmware repository is even using different IDs. This 
> caused the ABI breakage which John described in the other reply.
>
> No idea how the firmware is supposed to handle this. At the moment it is only 
> clear that it didn't handle it :(

I have told the firmware team numerious times that the board file should
be backwards compatible as it creates problems for upstream. And I do
try to keep everything in ath11k-firmware (and in linux-firmware)
backwards compatible, but if they are not please do let me know. For
other repos I cannot do much, if any.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
