Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69728C282C5
	for <ath11k@archiver.kernel.org>; Mon,  3 Mar 2025 07:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViqyJ/2/uaF2Cbb0IielSxYCgmhmABTV975Wz4BBQVE=; b=wCxO9Lim8IWiLUNwOa7tUbL1AO
	BBNj99tIy3uRgWatcEBzcv3IEdxdQz1Btb9zcwDzbcDrFw1uspRl4FHOCTmRlnw8dmskqa+umH2tz
	9tTN0J3esPiycZCVOaWHDuflchW5DIelE/R0mi+8DAkzXYL3J2ESuzg4IDMc0V7kFYeLGzY07z2Yt
	Mh79xAuvFY0qVsbMpsuol52F81nFaklYs3JB67Zb504wRP2FCFZacjhIrSQgBgwH0mkoq9Q+J9Sw+
	9qE7SGcbjMrO242Gnyrmsy6Ihl+LAaCzl+rNkTCZ42wCKYEywsZFHKec68tUKZfezSnb1r9hvP2++
	XTyeSoCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tozxD-0000000HOLy-17gX;
	Mon, 03 Mar 2025 07:11:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tozxC-0000000HOLj-07Er
	for ath11k@lists.infradead.org;
	Mon, 03 Mar 2025 07:11:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EFE2E611CB;
	Mon,  3 Mar 2025 07:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B5EC4CED6;
	Mon,  3 Mar 2025 07:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740985863;
	bh=zmZzLghaj28fS0mz2nIeCdQRxgIUthXc2QKh7/R57yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShSSPLglfGBf5GWuTrRSWIvj4kuRLoz500gaDN1pxsQJJzHv3sB6Sg9iqnX4Bm6li
	 Iq3+PFl9ZtZEOeAiYcptv08smtq8qcrNOPHMlTpupxKzgvJnouerFs8APsMisCANFG
	 riPK5L/nVsA05XxlOfEc89YJrShVc+KBlCn4R3Bm+C6KL3enpUeX/0pXmLhD6uqPOF
	 GnsNya3n3Q2uNdDiQxZM1PXwjB5SaPTRL5kXPm1TznxYz3jG+1KOLbhzvemuOjueiz
	 r3OVJttLG3i747qq9zd3VzLdashpsTjpueR6MIIEOEA0eDOdLxYQqlGJBuKN1UsRuu
	 kHBaPq4Io3HwA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tozx3-0000000059s-0qJS;
	Mon, 03 Mar 2025 08:10:57 +0100
Date: Mon, 3 Mar 2025 08:10:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: ath11k: WCN6855: possible ring buffer corruption
Message-ID: <Z8VWAWl5UdZQYGgr@hovoldconsulting.com>
References: <Zh6b-38tGGXo-ee7@hovoldconsulting.com>
 <Z8Gr-IMD-UZTU-X5@hovoldconsulting.com>
 <1f8fa248-c18a-4bb9-b995-0961f7f3fa37@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f8fa248-c18a-4bb9-b995-0961f7f3fa37@oss.qualcomm.com>
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

On Fri, Feb 28, 2025 at 09:07:32AM -0800, Jeff Johnson wrote:
> On 2/28/2025 4:28 AM, Johan Hovold wrote:

> > The ath11k ring-buffer corruption issue is hurting some users of the
> > Lenovo ThinkPad X13s quite bad so I promised to try to escalate this
> > with you and Qualcomm.
> 
> I've escalated this with the development team.

Thanks, Jeff. Just let me know if you need any help with testing patches
or firmware updates. We have a couple of users that can reproduce this
very easily and that are also able to test patches.

Johan

