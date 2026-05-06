Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C0FCD342C
	for <ath11k@archiver.kernel.org>; Wed,  6 May 2026 20:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srk9N6x4OS8mAV/nGLNUxRKHC22Lg0AqoTFTMh9gocc=; b=VBT5CgjZgI8ghlHKI5UaGS38O2
	5PiQ2n1kNDsRiPnIY+PSN7VmEQw8sjNHI1IsFMPtRILM6Vwu9bH4ZOUQqvspzApFvflIjwrcgBXCG
	zGWGEbWT5keuRBtTDB9b2ZC10zj19GQU9kFk5IZpFuo83h1DBOGBLd16jxPQrcuy5oikiayBMzDN+
	qzNfpn68xGG0zL9MZTdTCPUTaUHf2dpe9sUzjv8RCzMUmzuQXkdrSzlOrpgYxnoIl0cYzrmPOrafY
	It8yVYaFI+XB8mEC9anwrF24WQTsHU0106FddbODrGhx7trZKbP2l533DU+cuJgrd28ZcHxXGNG/D
	ZJaQ+/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKitF-00000001zBd-0Rs6;
	Wed, 06 May 2026 20:30:41 +0000
Received: from mx0.riseup.net ([198.252.153.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKitD-00000001zAr-2s7k
	for ath11k@lists.infradead.org;
	Wed, 06 May 2026 20:30:39 +0000
Received: from fews04-sea.riseup.net (fews04-sea-pn.riseup.net [10.0.1.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4g9n7y4j0Wz9tNS;
	Wed,  6 May 2026 20:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1778099438; bh=srk9N6x4OS8mAV/nGLNUxRKHC22Lg0AqoTFTMh9gocc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qpIAfWAzjvB3ANhLP4mYlw7OUGtndDH4GtMtzx5RRjSX6IPzGg4X8R/VTejqTLVPS
	 qERoxHriCHfyGLAv6f2bFF2XWQxBALCz508JrG+4tXCqd5xYrdhKDIs64HFpkcyQBh
	 8Nti3L5GX3tnVfs4WPiKoJ5c/XT/fIwH/uwsHnSI=
X-Riseup-User-ID: B5D412F198E8899EDABFE04F17A73459F0107F3AED606021FB1B88E15F0B1FD2
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews04-sea.riseup.net (Postfix) with ESMTPSA id 4g9n7x3hdDz5wV9;
	Wed,  6 May 2026 20:30:37 +0000 (UTC)
Date: Wed, 6 May 2026 17:30:33 -0300
From: Santiago Ruano =?iso-8859-1?Q?Rinc=F3n?= <santiagorr@riseup.net>
To: Kyle Farnung <kfarnung@gmail.com>
Cc: Kyle Farnung <kfarnung@outlook.com>, Jeff Johnson <jjohnson@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"koike@igalia.com" <koike@igalia.com>, 1132343@bugs.debian.org
Subject: Re: [PATCH] wifi: ath11k: Add two missing Lenovo IDs to the quirk
 table
Message-ID: <afuk6c0n-TXXUySs@voleno>
References: <20260423211458.458911-1-santiagorr@riseup.net>
 <IA2P223MB1199153665E2AFF709BD2F52D02B2@IA2P223MB1199.NAMP223.PROD.OUTLOOK.COM>
 <aeuH2chCSi57RYVU@voleno>
 <CAOPSVF3=BmOUw5+nnk-EYnpP_ff7wXsFAaz6sHbw-brLy-HojA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOPSVF3=BmOUw5+nnk-EYnpP_ff7wXsFAaz6sHbw-brLy-HojA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_133039_786833_10EDC793 
X-CRM114-Status: GOOD (  23.16  )
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

El 26/04/26 a las 10:44, Kyle Farnung escribió:
...
> Feel free to just merge yours and I'll withdraw mine. I'm regression
> testing the WiFi disconnect issue I'm encountering, so I'll just focus on
> that. In the meantime this seems righteous.

Thanks, I've just sent an updated version

> 
> >
> > >
> > > I have the same "wake on power removed" issue, but I have another issue
> > > that's more annoying where the wifi just dies randomly. I only have the
> > > wake issue when power is disconnected, not when power is connected again.
> > > I mostly leave my device connected, so I only realized the behavior while
> > > doing the regression testing requested in the other patch.
> >
> > I've also been hit by a similar annoying wifi randomly dying issue that
> > you describe [deb#1132343].  With the patch that I attached applied to
> > 7.0.0, my P14s G3 AMD laptop has been running for more that 3 days, with
> > several suspends / weak ups, either with power connected or
> > disconnected.  And I haven't encountered that problem since it booted so
> > I concluded that the patch fixed it.  But chances are that I am wrong.
> >
> > [deb#1132343] https://bugs.debian.org/1132343
> >
> > The latest bad version I tested where the wifi died was 6.9.11.  I plan
> > test the patch on top of it.
> 
> 6.9 or 6.19? My issue started between 6.16.10 and 6.17.4.

6.19, sorry.  And I confirm it is still present in 7.0.3. But my P14s
Gen3  machine has been running on a 7.0.3 patched with
https://lore.kernel.org/ath11k/20260423211458.458911-1-santiagorr@riseup.net/
for more than two days, with several suspends and no wifi issues.

However, from your comment at
https://lore.kernel.org/all/CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=o9wVcFMc6f-yhmSBcZqQ@mail.gmail.com/,
I read that you are concluding that the culprit for the dying wifi is
rather 79266fd78df1 ("wifi: ath11k: HAL SRNG: don't deinitialize and
re-initialize again").
Could you please confirm that you have been able to reproduce the wifi
randomly dying issue with kernel patched with
https://lore.kernel.org/all/20260330-p14s-pm-quirk-v2-1-ef18ce07996b@gmail.com/?

thanks,

 -- S

