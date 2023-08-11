Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F591C0015E
	for <ath11k@archiver.kernel.org>; Fri, 11 Aug 2023 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=or8DuAlGPCfXKfkOUi3fJFHrl9DsLXx8+1kyNPSBgnw=; b=bsPUDvVDqKJUFf
	OKUM/XGBD/A1XFMbzEaF1X8p37bYh3N4zCPmVEBGTLfInBxG4AUfIsSYZRHOYOI5nhKfwy5SRGD43
	msPsmC9TiwGkUpa6gjxskQ/76MMnN+UIZchwOLXFaH2KPSt1HtxOnCSAmq/c4jA1dacfkHZ70iXoj
	fhc6uzIBiV6kVFGVxgZZwRkzE3HL68MDV63uP0tL//L615o7y1tACjZYqogRybiQhfWhcdaE7bWxs
	77JA+wby18Y3WZHZfgxLs5Kgi3wDYUFFt+SIxZ9z3uNacgUs1q6ZrL0/4FEBsukGiosJsoEnH/uCt
	h9O/VyNV7y6UuiQLiY5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOIz-009wnU-1G;
	Fri, 11 Aug 2023 09:19:37 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOIw-009wn1-0q
	for ath11k@lists.infradead.org;
	Fri, 11 Aug 2023 09:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4Sar5Lcc0N8EDoByeYYF1XXtTNCXfHKAoUEecHC/FLw=;
	t=1691745573; x=1692955173; b=ErUr0mEDbH+o4MjpelAfXrN3/8aiFcrdERtE8qeZOed+wTm
	dJloxZuRRIWNcm9AG7tbcIA4fs0pDrz/8FJ9Pn2SFZsqqI2M1EjvnORrxwGkEIKFw00Y9nkGkXkEH
	udpxy/TRCduYNnYPd8ASI1JRGikAjYjzPHJc19q/ktXY2mfg6O3Wnb+yiuLvOISMyYFWASF2ZdPuK
	zcRYaMf3mLqiMSk3RqTG+v9HJDpfYGrK/oIRnjIdzGs67NrN8mbX13fYm4xYq11yjK+gJC9uKHRGy
	tSD2++M5DCWiF3hhXVfXdvn5YlloHH5nZ1TKUcia5iudewEkRoy+adrxfMml4W6A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qUOIt-000p9a-32;
	Fri, 11 Aug 2023 11:19:32 +0200
Message-ID: <30ad9d872e0555d801e9b22c9a72edb0f62a61a6.camel@sipsolutions.net>
Subject: Re: parsing the multi-link element with STA profile wifi: mac80211:
 support MLO authentication/association with one link
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: ath11k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 11 Aug 2023 11:19:31 +0200
In-Reply-To: <b5de662d-fd49-7b94-f617-89d4761c175b@quicinc.com>
References: <48715509-62fd-2307-e38f-176234b482c1@quicinc.com>
	 <f240b33d507daf898480b0a11eb27d4475e45164.camel@sipsolutions.net>
	 <571d8ecf-2ca6-8b7b-6e15-be12c56e9f88@quicinc.com>
	 <e40ee96ab2a8d9d079d3a06b7b1c615ab25a2403.camel@sipsolutions.net>
	 <2842f57c-e383-fb9e-d994-95336cb65e0d@quicinc.com>
	 <6a33a41b5aa6c98d95ff934fbb6a10dfe78e6e6e.camel@sipsolutions.net>
	 <2d3a6578-68c5-a0f3-b18b-bce2e67d3fdc@quicinc.com>
	 <b5de662d-fd49-7b94-f617-89d4761c175b@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_021934_301083_91745E68 
X-CRM114-Status: GOOD (  10.15  )
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

On Wed, 2023-07-26 at 14:30 +0800, Wen Gong wrote:
> Hi Johannes,
> 
> I guess you have already fix it in some patch, right?
> 

No, I don't. We've not seen this, it's not been a priority.

<rant>

Look, I told you how I think you can fix it _literally_ three months
ago. I was on vacation for pretty much exactly half of that time. And
during that time you ask if _I_ have a fix? What have you been doing for
the past three months that prevented you from fixing it?

Upstream is supposed to be a collaborative effort, not a place where
I/we do the work and you keep asking me to make the changes you need for
you!

Sure, it there's a bug, and we should probably be fixing it  too, but if
that's not high on our list right now because we don't experience it,
then I don't see why you don't just send a patch!

I even get that you might not know whether something is a bug, and when
we determine that it is, how to fix it. But we cleared that up three
months ago, and all you've done in this thread is ask whether I have a
fix for you. Why?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
