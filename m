Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CE6C83F14
	for <ath11k@archiver.kernel.org>; Wed, 30 Aug 2023 09:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xm5xvYedMsnOvcxigsBD/cuGtYxB1lNkE+imt/BtV+E=; b=om7P4oqfLyT8sl
	SyUJZmtgSZ4/ZerVVcDAxDnNIC1e3EVTmU6EynW2BV7ZEQl8JFAxS7QYoukfMGIkykoIpwVKKTrnn
	/apz2zxyS1ePzfRmggFcbf836U+Uuksxv+2LGJXCHXTpjCwZRfeGtM/iqRYHsScwqVCQUv8wB+8un
	11nlhJ3sAVMw2LwTs1N8qUvT1hgyLJnQCHp0qAv440BgLvEDvJ7VI1gN51Lse27Za9gXluWpS9nJ1
	0dLGHZ3BJrtB7uzw7cjjkak2xip4nY4rSqEmGh+Elo3dDMwhYGtQPeoXhHPYMOScXQGqnAW3m2ZvT
	OCT/rXnAAMuh7YU0TLUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbHvZ-00DBKb-32;
	Wed, 30 Aug 2023 09:55:57 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbHvX-00DBKB-0E
	for ath11k@lists.infradead.org;
	Wed, 30 Aug 2023 09:55:56 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qbHvQ-0002P7-2Q; Wed, 30 Aug 2023 11:55:48 +0200
Message-ID: <8a737241-f216-169a-8bd3-d0832439b99e@leemhuis.info>
Date: Wed, 30 Aug 2023 11:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression v6.5-rc1] PCI: comm "swapper/0" leaking memory
Content-Language: en-US, de-DE
To: Kalle Valo <kvalo@kernel.org>, Ross Lagerwall
 <ross.lagerwall@citrix.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath11k@lists.infradead.org, regressions@lists.linux.dev
References: <878r9sga1t.fsf@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <878r9sga1t.fsf@kernel.org>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693389355;05091fec;
X-HE-SMSGID: 1qbHvQ-0002P7-2Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_025555_253739_99281C5B 
X-CRM114-Status: GOOD (  16.77  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi, Thorsten here, the Linux kernel's regression tracker. Partially
top-posting for once, to make this easily accessible to everyone.

Thx for the report. To quote one aspect:

> v6.4 has no leaks.

I pretty sure you mean stock 6.4 here. But FWIW, the culprit was
backported to 6.4.y and 6.1.y, so they latest versions might be affected
as well.

For the rest of this mail:

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 30.08.23 11:21, Kalle Valo wrote:
> 
> I noticed that starting from v6.5-rc1 my ath11k tests reported several
> memory leaks from swapper/0:
> 
> unreferenced object 0xffff88810a02b7a8 (size 96):
>   comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
>   hex dump (first 32 bytes):
>     80 b8 02 0a 81 88 ff ff b8 72 07 00 00 c9 ff ff  .........r......
>     c8 b7 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  ................
>   backtrace:
> unreferenced object 0xffff88810a02b880 (size 96):
>   comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
>   hex dump (first 32 bytes):
>     58 b9 02 0a 81 88 ff ff a8 b7 02 0a 81 88 ff ff  X...............
>     a0 b8 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  ................
>   backtrace:
> unreferenced object 0xffff88810a02b958 (size 96):
>   comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
>   hex dump (first 32 bytes):
>     30 ba 02 0a 81 88 ff ff 80 b8 02 0a 81 88 ff ff  0...............
>     78 b9 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  x...............
>   backtrace:
> unreferenced object 0xffff88810a02ba30 (size 96):
>   comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
>   hex dump (first 32 bytes):
>     08 bb 02 0a 81 88 ff ff 58 b9 02 0a 81 88 ff ff  ........X.......
>     50 ba 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  P...............
>   backtrace:
> unreferenced object 0xffff88810a02bb08 (size 96):
>   comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
>   hex dump (first 32 bytes):
>     e0 bb 02 0a 81 88 ff ff 30 ba 02 0a 81 88 ff ff  ........0.......
>     28 bb 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  (...............
>   backtrace:
> 
> I can easily reproduce this by doing a simple insmod and rmmod of ath11k
> and it's dependencies (mac80211, MHI etc). I can reliability reproduce
> the leaks but I only see them once after a boot, I need to reboot the
> host to see the leaks again. v6.4 has no leaks.
> 
> I did a bisect and found the commit below. I verified reverting the
> commit makes the leaks go away.
> 
> commit e54223275ba1bc6f704a6bab015fcd2ae4f72572
> Author:     Ross Lagerwall <ross.lagerwall@citrix.com>
> AuthorDate: Thu May 25 16:32:48 2023 +0100
> Commit:     Bjorn Helgaas <bhelgaas@google.com>
> CommitDate: Fri Jun 9 15:06:16 2023 -0500
> 
>     PCI: Release resource invalidated by coalescing

To be sure the issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, the Linux kernel regression tracking bot:

#regzbot ^introduced e54223275ba1bc6f704a6bab015fcd2ae4f72572
#regzbot title PCI: comm "swapper/0" leaking memory
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
