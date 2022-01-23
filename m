Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26CCC433EF
	for <ath11k@archiver.kernel.org>; Sun, 23 Jan 2022 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=aMuMIZ66D1gkKjbHpkWGRoIVy29pLO7KHTr1wtSUxRY=; b=Aqf
	/ib3lD7fPk86zdztbmIpOI/3BFaDlwIUynmHVjtIk08ZQLNmLF75s+993h/9JjeuQAwowV3gUTFWS
	I0cqjH1fB2iNaMkghKxIGOed89LrFLFRV+73wo0tvyIhLmANwP6AdbsmTToX3DwJ8yS0B3e7nrL8K
	3X8segQb1J152VCU28qloxgt6DeGthLEX3nyOnBbjaCzF6NrZHPi4uvChO8aqWWrU/6woofKD1WUu
	6/XDSk6ZWDgDA+XcIl2d62hY+pXlevaZJBafOvPyQh7yo/58H7c9NmUKcL0Hua36b++isNtib57Bm
	a9BAYDzXhM7d8Dgz6Vj5Uu97uTQ3RJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBcMF-000o4R-GI; Sun, 23 Jan 2022 12:52:35 +0000
Received: from mail-40136.proton.ch ([185.70.40.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBcMC-000o3L-0T
 for ath11k@lists.infradead.org; Sun, 23 Jan 2022 12:52:34 +0000
Date: Sun, 23 Jan 2022 12:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mitchellnordine.com;
 s=protonmail3; t=1642942347;
 bh=lickg72SyRtZHzrPkaGvDGGo/5dG0mEMofAD2jbKNeE=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=IsoxBYg/OYH5/bm6Bf3aUL0SbJv6gMSq/i7v/AsaJ8T11Mfgnjb0Ma9sFmSpwaBg/
 gwm0XGKjjA6xpvxwh0goVb3G6+7UYMHQ7ZuFdkOO01NXarV8bijUoPvXEkSTjNvdcB
 Ea1qHJWeBbJXKqga3fmJHhxHHnGWd4gIA4J7DOWOeDvWcPAqCdBMNCi0j3uyYikOzu
 SFUybhoTjYCKsgmXEHScJlq1+6if4XI05E/LvH5kYGKEWm9hGRObOgahCgvuUcDwo6
 MmKzJPjcDlu2xKP2Y/BogfNIh16dR329w3HFOGkoXly6v+2YrWNOJv8hw3pIQ4J+Pp
 UsaErufIm/1ag==
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
From: Mitchell Nordine <mail@mitchellnordine.com>
Subject: Plans for P2P mode support?
Message-ID: <H7fMpB-Y2BKrZtEA59FZxWt7VHiB9BewEfPindKTngaQym7Cfya_l1kq3fP9-tyBTahd5Gl0GEhndQps4FvVGfIhSYSwsMNyT28D4GxaAQw=@mitchellnordine.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_045232_720421_563D7399 
X-CRM114-Status: UNSURE (   4.89  )
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
Reply-To: Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi folks!

I spent the afternoon trying to setup `gnome-network-displays` on my Dell XPS 13 9310 (which uses QCA6390). It failed with an error along the lines of "No Wi-fi P2P adapter available".

After some investigation I learned that while the QCA6390 does support P2P, the ath11k driver does not[1] (yet).

Can anyone share any details on whether or not there any plans for P2P mode in ath11k on the horizon? Is this something that could be contributed in the ath11k driver? Or would we need some firmware update first?

[1]: https://forums.linuxmint.com/viewtopic.php?p=2004200&sid=f8111789afb51b5e66b80f26126b5944#p2004200

Cheers,
Mitch

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
