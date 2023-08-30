Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF12C83F01
	for <ath11k@archiver.kernel.org>; Wed, 30 Aug 2023 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yKa0XWADbbZsBNXWHNYVr0E4U3KjUcAVIq/qS9S5/ek=; b=NawUDz92lKRk79
	yNcx4HL+jc2Hkd923KuXnNQ5WR9lZDbd4p7iSgchl/ycwGzPJ+4nqC7Ns/Z8JiPtxYjGjq4EtP1LZ
	/xWqiuo28s4SU722R9cRsxV+mOP0wvMTQiKn125Zzw/lLMxxal3I8SXfJRL98qIKz5J/eA2Xnzo09
	E/4xPnbsKlr0AhL2uMaMYdOBM/wJm6pazH5fRTIXc10+p3YuGiueBUGrnKYDpJr5atOicUJQezYef
	5Majm6/rkWSumufNQ/xnp5EFlpzPGqO5YfG9Y6Qpc6tv1p1KAfzA+jlgMcRRmurx2d7Cb0RrfL89g
	UlRLuZVY0GZ3VpUahttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbHOW-00D8ny-0y;
	Wed, 30 Aug 2023 09:21:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbHON-00D8n1-2S
	for ath11k@lists.infradead.org;
	Wed, 30 Aug 2023 09:21:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B6286106E;
	Wed, 30 Aug 2023 09:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241C4C433C8;
	Wed, 30 Aug 2023 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693387298;
	bh=siIZODpxnuFofigGdK4dwZYoGFyU6ZVlCj0AGqstUXY=;
	h=From:To:Cc:Subject:Date:From;
	b=NgYUZygmBVLwFbvipWgScmV9bhRY4kEtxv+LxE1ZR+6xyl9Ra9l+OKjTkwsKUnCLD
	 beOWKm9nyL1Va+AILsLgv0NtwJ2QtqXMLv8ynDEuGiIwgZVZMt16SIOHzWgxPuZsVN
	 xeLpsiLkB27M4lZ/rwqit+jHi9YByXMQjBcgdZxxb19C2y+hzqxYHKYG7Sd6rgWYJB
	 K58+CwM9JjdL3H3y/i5yaHv7FD8sfAfdnK17j8OSiwPXnt7bFmP5S7jI+0rEoCdy1F
	 nppDZS0xW0zmchJck+DBVrBKJVLogG9rnkW+0dtk7EMGUAWgGLjnalXMzHZwviC1QH
	 wy9DkZFZ+4FVw==
From: Kalle Valo <kvalo@kernel.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, Bjorn Helgaas
 <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
    ath11k@lists.infradead.org, regressions@lists.linux.dev
Subject: [regression v6.5-rc1] PCI: comm "swapper/0" leaking memory
Date: Wed, 30 Aug 2023 12:21:34 +0300
Message-ID: <878r9sga1t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_022139_841293_85F6F8A9 
X-CRM114-Status: UNSURE (   8.14  )
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

Hi,

I noticed that starting from v6.5-rc1 my ath11k tests reported several
memory leaks from swapper/0:

unreferenced object 0xffff88810a02b7a8 (size 96):
  comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
  hex dump (first 32 bytes):
    80 b8 02 0a 81 88 ff ff b8 72 07 00 00 c9 ff ff  .........r......
    c8 b7 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace:
unreferenced object 0xffff88810a02b880 (size 96):
  comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
  hex dump (first 32 bytes):
    58 b9 02 0a 81 88 ff ff a8 b7 02 0a 81 88 ff ff  X...............
    a0 b8 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace:
unreferenced object 0xffff88810a02b958 (size 96):
  comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
  hex dump (first 32 bytes):
    30 ba 02 0a 81 88 ff ff 80 b8 02 0a 81 88 ff ff  0...............
    78 b9 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  x...............
  backtrace:
unreferenced object 0xffff88810a02ba30 (size 96):
  comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
  hex dump (first 32 bytes):
    08 bb 02 0a 81 88 ff ff 58 b9 02 0a 81 88 ff ff  ........X.......
    50 ba 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  P...............
  backtrace:
unreferenced object 0xffff88810a02bb08 (size 96):
  comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
  hex dump (first 32 bytes):
    e0 bb 02 0a 81 88 ff ff 30 ba 02 0a 81 88 ff ff  ........0.......
    28 bb 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  (...............
  backtrace:

I can easily reproduce this by doing a simple insmod and rmmod of ath11k
and it's dependencies (mac80211, MHI etc). I can reliability reproduce
the leaks but I only see them once after a boot, I need to reboot the
host to see the leaks again. v6.4 has no leaks.

I did a bisect and found the commit below. I verified reverting the
commit makes the leaks go away.

commit e54223275ba1bc6f704a6bab015fcd2ae4f72572
Author:     Ross Lagerwall <ross.lagerwall@citrix.com>
AuthorDate: Thu May 25 16:32:48 2023 +0100
Commit:     Bjorn Helgaas <bhelgaas@google.com>
CommitDate: Fri Jun 9 15:06:16 2023 -0500

    PCI: Release resource invalidated by coalescing

Kalle

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
