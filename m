Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F6FC00A5A
	for <ath11k@archiver.kernel.org>; Thu, 19 Jan 2023 14:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wibtjGZPKGnJvt+1vT7QXn1oLldxbP/oVzeGkl5bi6Q=; b=4BPOjRJzFJbM7p
	dV3qxrkOZ4OyJmkrAKSqnM4RTQJ0KOl79q31MYi1Rw05dC6DFfwyaZ0IJnRMv62+n7uWCX7jgXpji
	BZAZZquBXApROqEuDPxBma8m8WBGw6EA9wuW4SFO/ph6pjSzcz1l6JqO7X+m2x8Jb1tlIAs0E+OSe
	at8LbIMZYNCIs2T4lJmsuhnviRM8sx2zb68RqYjCeerYbwrrwJ4A8bGUIFibXP+qaMJLExF0FSjO+
	0dpYjzIcK3h1q2NhhZYPRQenbLCVyboADvJS2Yg9JbvdZVwXrlToT/1kjkU1dx2FMPRsiSi2XzT1z
	ucThjXghHv4yFgCrMl+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIVV3-005DBB-VI; Thu, 19 Jan 2023 14:02:41 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIVUn-005D3a-Rg
	for ath11k@lists.infradead.org; Thu, 19 Jan 2023 14:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=tO2mv6zDdENUjSDZ19YwiIs1l98gAiiQ0I/1yF2xPuo=;
	t=1674136945; x=1675346545; b=HaxXnJjH4KzmBPJMUHRFi6hvAkrrEDJQI6RTW0wdcecdBRK
	HPPVjFzsjgGE8feOy2L86kxQJ4fvdKaWRj5Fgx7Pny+1h7DZGc8iw0VNE2indyXMHgbI4D0YatyIa
	mEVxQ4fdp98tBeorupmeQRSXHXLTvHWLnXh/2eD22t55xBRSN8poJqkT80Y70conl/Fh3PM/VBN4p
	sM72W/P5N8A5JuxPybgjhrQnFcgb9EoyTe0umXgLbXitpfr77cR4QOkASn1MNXquC9hipKXLpVucx
	WL+gD16DFG0yRKwGZuJlW0DO2LT8QgKminSM4sKt5BTpL6jQwCOmzAOlX743vwsg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pIVUl-006X7C-1z;
	Thu, 19 Jan 2023 15:02:23 +0100
Message-ID: <74c57dc34af10537f98f5bb9b6ce80e5676e09b0.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] nl80211: add support to enable/disable bss color
 collision detection
From: Johannes Berg <johannes@sipsolutions.net>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>, 
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 19 Jan 2023 15:02:22 +0100
In-Reply-To: <20221226083328.29051-2-quic_ramess@quicinc.com>
References: <20221226083328.29051-1-quic_ramess@quicinc.com>
	 <20221226083328.29051-2-quic_ramess@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_060226_004109_97C85E90 
X-CRM114-Status: GOOD (  10.55  )
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

On Mon, 2022-12-26 at 14:03 +0530, Rameshkumar Sundaram wrote:
> As per 802.11ax-2021, STAs shall process BSS Color Change Announcement
> (BCCA) from AP and switch to new color, but some STAs aren't processing
> BCCA from AP and not doing color switch, causing them to drop data
> frames from AP post color change.
> 
> Provide an option to disable color collision detection and therefore
> not to do BCCA to mitigate the same from AP. If it's required in case
> where STA supports BCCA handling, then it can enabled in AP using this
> option.
> 

You should probably split this into cfg80211 and mac80211.

Also, this doesn't really seem to make a lot of _sense_ since nothing in
the kernel actually acts on detection of a color collision - hostapd is
acting on that.

So since you can easily make hostapd ignore the event, why do you even
need this?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
