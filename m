Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C679CC43334
	for <ath11k@archiver.kernel.org>; Fri, 22 Jul 2022 07:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAD0dBju5eVPzLcwlOafK5MvFqMsd2emLxO4m/qGHgY=; b=1Zrn8xxNud5iQM
	kMMK3FJjlmMWH7FNnAHFGUliEVexVTUBH6eQmWQ1gSDlPTcppu2ylSpLGXgRdkfjRQWg6CdGsLDcK
	Q7XBLq1S3z/ivyZ/YtapF97W/MyXyOZ/AIf6bXKu25WVqCD15yA9opUDVlspL9DWZx7FyAxWsoXdW
	RDqzqCbP15CKLKOGgJrHkcP02tbvM530zHwJ2XrMpM3zVs3+nQFt59NnNteJUIpKwJ8qkhh9yP2F9
	css1rsI0c2DK0QvMl35H+2RdyVvVI7KlHfmdj/oSBsnp720qa9utB+/JecEcyYrfiKjRdYIjSAK+a
	F23FvY3xgL+D+puCKcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnV4-000mnR-TL; Fri, 22 Jul 2022 07:55:06 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnV1-000mi8-6X
	for ath11k@lists.infradead.org; Fri, 22 Jul 2022 07:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=bT0SRECV61FQpDU/9mgiJdmvScp2+x/xiqSm91nzE4k=;
	t=1658476502; x=1659686102; b=qI/KggowaOS/wNDLdY3skprlpNwVVEtFcH1tDw/Y06S6tC8
	JmU/0ZnHjuEXPrxs8a+j9GOQ+Ml/LWM5F4ypSCC7U6JSTJDSfFIlJAVCwBSrgDRpD3KqG/Xqg/IYP
	WtJtv4YStO28qFDkEW2+wgZhpLnybNCqXNGD42pFqdl3e4NiEF5C+RXSJ4C3UFiSEDSvuuLDtOyK+
	+O7ydiEvx4KqvkdMlWff8FCcicuRyyHCQr4NGDe0qz07G/NTzV4Y+zLc3PjMA6fV4gcQ0jPX3Maey
	XUChKf45hHcIos7rN54/LoesFPsG4rVI2V+ITZR8lEQkqFbPjxtNk7q9o0UfFa2w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oEnUx-005DXd-0B;
	Fri, 22 Jul 2022 09:54:59 +0200
Message-ID: <0a400422546112e91e087ce285ec5a532193ada3.camel@sipsolutions.net>
Subject: Re: mac80211/ath11k regression in next-20220720
From: Johannes Berg <johannes@sipsolutions.net>
To: Johan Hovold <johan@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 22 Jul 2022 09:54:57 +0200
In-Reply-To: <YtpXNYta924al1Po@hovoldconsulting.com>
References: <YtpXNYta924al1Po@hovoldconsulting.com>
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_005503_255711_45A0BBFC 
X-CRM114-Status: GOOD (  13.60  )
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

On Fri, 2022-07-22 at 09:52 +0200, Johan Hovold wrote:
> Hi,
> 
> After moving from next-20220714 to next-20220720, ath11k stopped
> working here and instead spits out a bunch of warnings (see log below).
> 
> I noticed that this series from Johannes was merged in that period:
> 
> 	https://lore.kernel.org/all/20220713094502.163926-1-johannes@sipsolutions.net/
> 
> but can't say for sure that it's related. I also tried adding the
> follow-up fixes from the mld branch:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/log/?h=mld
> 
> but it didn't seem to make any difference.
> 
> Any ideas about what might be going on here?
> 

We think the "fix" is this:

https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/commit/?h=mld&id=dd5a559d8e90fdb9424e0580b91702c5838928dc

Do you want to try it?

Note that if that fixes it, it's still a bug in the driver, but one that
you'd otherwise not hit.

Anyway I'll do some tree shuffling today and get that in.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
