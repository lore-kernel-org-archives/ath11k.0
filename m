Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E44D0C5F4
	for <ath11k@archiver.kernel.org>; Fri, 25 Oct 2024 09:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Message-ID:To:From:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zx4rS994+52QgjDFKp6HcNDGGadUJCetWnImp7GoXTM=; b=KDVqZWLRec8jBublrMlHKP69e6
	UhRLA8GorLD+D6vT+SaM3WVcjvPXrCUoW+QqRbvjzQgPUXeOBiuaG5mbFFTMT6/G/hUM569/bPfkn
	qMctiXSv/lL8U0v5MWZaE7e9Roh8wThCdsDxwSWoqkTKYrPpt4VoPvWxyBdX22X/l+WziA+ERfx1C
	+6mLBS9nZyBvuWAZZwVUJ6vkLJRZbl3u03SiKfFSqBAI5QhxEAxqDeF2hmpwmLzNLbcd5TU9nWWyX
	3/ERsyAkGvzEW+m0bRvRc+uhlTUtQJw5lyzP+owTg4u3T6YVEqGZe1FD/FebzLpytx+xXeFNblWgp
	2nDPDFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GYi-00000003AKS-2epm;
	Fri, 25 Oct 2024 09:24:40 +0000
Received: from resdmta-c2p-566137.sys.comcast.net ([2001:558:fd00:56::c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GYf-00000003AJX-3wn6
	for ath11k@lists.infradead.org;
	Fri, 25 Oct 2024 09:24:39 +0000
Received: from resomta-c2p-555954.sys.comcast.net ([96.102.18.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 256/256 bits)
	(Client did not present a certificate)
	by resdmta-c2p-566137.sys.comcast.net with ESMTPS
	id 4GYRtpWHKz35p4GYXtVlyf; Fri, 25 Oct 2024 09:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=20190202a; t=1729848269;
	bh=zx4rS994+52QgjDFKp6HcNDGGadUJCetWnImp7GoXTM=;
	h=Received:Received:Date:From:To:Message-ID:Subject:MIME-Version:
	 Content-Type:Xfinity-Spam-Result;
	b=bdvoZxe9nUUx81KH/ae39XgsZ+yPKFO5fbSI4TZBeAfShk5MGvTF9JxDKpAPbHbGg
	 UlgwetmIcps8uYtSSkWFNf0Gr51zgeNDNCIGcA2LBFUYvhaycptpIDrWDja8hd9QKC
	 zmB32+1o/kiGqQtSnIwvadr+lw3roIDgV6hCl2mfQctJPD+yFfMix3smf2PtonS8jE
	 D6Z/o9FRyDbM9y3y8nn6Itim2MUr1qzuX0Y9QtIJwZWTnRBLvZ24sUBVXJCX1thXgo
	 fsncrVZ4eXQ25HnZsBgmnmPNSxb/xiG9WHthObkj+vApedDrY7WRBC3zw3N0wU7PhX
	 du4wAFDMQe/3Q==
Received: from boobie.home ([73.69.89.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by resomta-c2p-555954.sys.comcast.net with ESMTPSA
	id 4GYAtSeYmSjQd4GYAt7jPH; Fri, 25 Oct 2024 09:24:08 +0000
Date: Fri, 25 Oct 2024 05:24:06 -0400 (EDT)
From: Ameer Antar <ameerantar@comcast.net>
To: ath11k@lists.infradead.org
Message-ID: <2102926591.3.1729848246704@boobie.home>
Subject: Is it possible to use multiple QCN9074 devices on the same system?
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CMAE-Envelope: MS4xfGHQerAwqF4FtsjSk9tFbTyaJiZttay/qAqqJE9bHh+cxlvHAfXA0pgvzC3W28zDNLxbEL9rlQ6e4QzIE2zbIaUZN7Ldv3UyyBMItSa6JoxB6OyFa4K7
 uKbHGoTPvxnVJYbm3Do0YFLR8S/AjhqY7PPtQkdmdpFDv427x9BLs2iIYvCmn4hDZDwLWbf+j01DGg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_022438_055742_3C662822 
X-CRM114-Status: UNSURE (   9.12  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

I would like to know if there is a way to use multiple QCN9074 boards using
ath11k. I have several boards which use different radio spectrums, e.g. 5 a=
nd
6GHz. Unfortunately all these boards are unfused and map to board id 255. I=
 can
get either one working by updating the board-2.bin file using ath11k-bdenco=
der,
but it looks like both radio versions have the same exact identifying info,
'chip_id 0x0 chip_family 0x0 board_id 0xff soc_id 0xffffffff' ->
'bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D255'. The only differentiating pr=
operty I
could find seems to be the pci bus slot info, ie. bus/device number. Is the=
re
any way to override the board id per device based on either the pci slot in=
fo
or even the network interface name?

I also suspect there is another issue beyond this regarding having multiple
QCN9074 boards [1][2] which I'm not sure is resolved or if it will be.
Unfortunately now I have to always use devices which use separate drivers f=
or
the different spectrums, but this is far from ideal. For many devices, AP
discovery requires a neighbor report rather than PSC, so in most setups hav=
ing
a 6GHz radio requires at least another radio to function properly.

Any advice/comments much appreciated.

[1]
https://patchwork.kernel.org/project/linux-wireless/patch/20221105194943.82=
6847-2-robimarko@gmail.com/
[2]
https://patchwork.kernel.org/project/linux-wireless/patch/1614160542-27882-=
1-git-send-email-akolli@codeaurora.org/

