Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D704FED3DF
	for <ath11k@archiver.kernel.org>; Fri, 24 Apr 2026 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SB+7sytiJrz+IBEYLdZpkqol/yi+0XTJuxrciQQ6nB8=; b=Qfoa1cxljO0xpQNrHL3hHDsDN+
	fVgBvCXb9MVhySNeZuwtvjZzXZK0QO7sGyqESEmrn2nmkKLbBembnm9963UtqAQsnvQrcEtWym53m
	RI1fBvDvw65cYu/yiKyqEenphPzybL9upaph8D/Gcy3YxRDBtgR8JbGM2TC/ZFIngUiUCWjOFmrkg
	7ECgl8RWWXYQ+OpB12tchkqQptuD+YuwkN65DcjokCVeIdDLErUgM0C7V0z52sUrncF+T7N8+u1eG
	wlxTw/nkZYjmw7+wxdxu434N3dATXh39uYqJnF+BZXUui4foCh7Kxl322v+I8OCqjEvdFpx0wwSvw
	GbpWFkWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIAu-0000000DMj8-0CSD;
	Fri, 24 Apr 2026 15:10:36 +0000
Received: from mx1.riseup.net ([198.252.153.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIAr-0000000DMil-2E79
	for ath11k@lists.infradead.org;
	Fri, 24 Apr 2026 15:10:34 +0000
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4g2Gc82pqGzDq6T;
	Fri, 24 Apr 2026 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1777043432; bh=SB+7sytiJrz+IBEYLdZpkqol/yi+0XTJuxrciQQ6nB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjAdZdoTdOhAUZ8PWypgg8rv2AMA8YH+m0vc+/CYhXexg3q/Syh/KFxbGqHTna9EF
	 K7arQ3yrHPpRlqUotJ8ZgAa2S6cTRVgCi3JGksPVDO109oGTBm2vAMpMAiYI/HVAm/
	 z9JDlBYEZjQB2nggNoFPrMMg/y+SnPJ9zkwIJEF8=
X-Riseup-User-ID: 7B37399610335E7FAE1B027EA79580CEA696040A5320EB4D035349338FC95F65
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4g2Gbw21nbz23Qn;
	Fri, 24 Apr 2026 15:10:20 +0000 (UTC)
Date: Fri, 24 Apr 2026 12:10:17 -0300
From: Santiago Ruano =?iso-8859-1?Q?Rinc=F3n?= <santiagorr@riseup.net>
To: Kyle Farnung <kfarnung@outlook.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"koike@igalia.com" <koike@igalia.com>,
	Kyle Farnung <kfarnung@gmail.com>, 1132343@bugs.debian.org
Subject: Re: [PATCH] wifi: ath11k: Add two missing Lenovo IDs to the quirk
 table
Message-ID: <aeuH2chCSi57RYVU@voleno>
References: <20260423211458.458911-1-santiagorr@riseup.net>
 <IA2P223MB1199153665E2AFF709BD2F52D02B2@IA2P223MB1199.NAMP223.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA2P223MB1199153665E2AFF709BD2F52D02B2@IA2P223MB1199.NAMP223.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_081033_636386_3E43FBC5 
X-CRM114-Status: GOOD (  18.98  )
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

El 24/04/26 a las 02:07, Kyle Farnung escribió:
> > From: Santiago Ruano Rincón <santiagorr@riseup.net>
> > Sent: Thursday, April 23, 2026 2:14 PM
> > To: Jeff Johnson; linux-wireless@vger.kernel.org; ath11k@lists.infradead.org; linux-kernel@vger.kernel.org
> > Cc: Mark Pearson; kfarnung@outlook.com; koike@igalia.com
> > Subject: [PATCH] wifi: ath11k: Add two missing Lenovo IDs to the quirk table
> > 
> > Commit 0eb002c93c3b4 ("wifi: ath11k: Add missing platform IDs for quirk
> > table") added some Lenovo platform IDs to the quirk table to address a
> > wakeup from suspend issue [1].  However, at least two more platform ID
> > are missing in that table: P14s Gen 5 AMD, as reported by Kyle Farnung [2]
> > and P14s Gen 3 AMD.  This commit adds one ID for each.
> > 
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=219196
> > [2] https://bugzilla.kernel.org/show_bug.cgi?id=219196#c23
> > 
> > Tested-on: P14s G3 AMD.
> 
> Lenovo products have a pair of IDs, you'll want 21J6 [3] and 21MF [4] as
> well. I submitted a patch myself [5], but I've been investigating another
> symptom.

Thanks for the notice. I will adapt my patch to remove the conflict with yours.

> 
> I have the same "wake on power removed" issue, but I have another issue
> that's more annoying where the wifi just dies randomly. I only have the
> wake issue when power is disconnected, not when power is connected again.
> I mostly leave my device connected, so I only realized the behavior while
> doing the regression testing requested in the other patch.

I've also been hit by a similar annoying wifi randomly dying issue that
you describe [deb#1132343].  With the patch that I attached applied to
7.0.0, my P14s G3 AMD laptop has been running for more that 3 days, with
several suspends / weak ups, either with power connected or
disconnected.  And I haven't encountered that problem since it booted so
I concluded that the patch fixed it.  But chances are that I am wrong.

[deb#1132343] https://bugs.debian.org/1132343

The latest bad version I tested where the wifi died was 6.9.11.  I plan
test the patch on top of it.

> 
> [3] https://pcsupport.lenovo.com/jm/en/products/laptops-and-netbooks/thinkpad-p-series-laptops/thinkpad-p14s-gen-3-type-21j5-21j6/21j5
> [4] https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-p-series-laptops/thinkpad-p14s-gen-5-type-21me-21mf/21me/21me000pge
> [5] https://lore.kernel.org/all/ba4d194b-6d31-4d8a-a6a6-da116f9f56ac@oss.qualcomm.com/

[snip]

