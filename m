Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603F3CE7A88
	for <ath11k@archiver.kernel.org>; Sat, 23 Sep 2023 20:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qr/RiMqiMJpD8tLFhrwexkB3FbaRkb+4tyNhf/UAxno=; b=kwwn2uDqffvSc0
	PAL4uzgp3U0uLyBIdN+Ix8YNSptV3eC8wseo89T9x5Veh8NQhS94huKcFfMMv3G1vuR4lHcKLbu55
	kVG3SmEui/kLGHL/CcfZT/sRFDsqN6P3ztjVC6nZE5xJdwO8m3vPUzNdXYEcYcrY4RoXN2vxFRgiV
	5L+CaIzF8AJHJx3kP1gaJFPG4gm6IXR/wJa6sJ3XNyuRmMPKFG+s2v4JAegbJecKryckWAFZ5eA31
	9HA9tsaq8+puNrNJWAW6nExcvybUOjZfcb6dz7BRm3gCsMJ7E2OvaL5YNjff5RkNGelMGigv0Q025
	fUxSyWSjui8oviI1DXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk8w3-00BPwa-1A;
	Sat, 23 Sep 2023 20:09:03 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk8vz-00BPwH-2c
	for ath11k@lists.infradead.org;
	Sat, 23 Sep 2023 20:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Y+/vL/8oN97i0mNFQgOviFMY8YQRqWnmHAvN5eOx1co=;
	t=1695499739; x=1696709339; b=GU4JW25YDd6W3iw+cz3Xnt0nVcgl8w4PTiwpLa2HY/nSLmr
	u8MnnOI8fwmjqMIIp4L6E90/b/qB1JhR/+qIhT0xuH5lVj90mBqFSsc7uDA/M0S1yi28KspD38EJc
	d5cHchy10F9duNpMc+HCpxZLepAfwX4n+KaXYXjnbET9aqXTnMxyMuT6Wv97Wfsz1t+lWocoIg5e9
	1uQleqLB72rxdENqJRg8cpbS/ymxFNjtexzqYSLjzuqI/iGU5WRZQwYp25Swa5CpMEGMK50/uU68l
	yNyy5GNZm4fjgtw8xFADYzjzx3wFRsDigooUbVm8KqUN8yoMxvCbkhAX/Vudwn0Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qk8vx-0006ha-2V;
	Sat, 23 Sep 2023 22:08:57 +0200
Message-ID: <75b4b34f9e49e1af2fac5fdf8a1d022f8b0b2d5f.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: ath11k: mac: fix struct
 ieee80211_sband_iftype_data handling
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Sat, 23 Sep 2023 22:08:56 +0200
In-Reply-To: <87ediqa674.fsf@kernel.org>
References: <20230921075440.1539515-1-kvalo@kernel.org>
	 <87ediqa674.fsf@kernel.org>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_130859_868160_B6661C12 
X-CRM114-Status: UNSURE (   7.50  )
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

On Fri, 2023-09-22 at 12:49 +0300, Kalle Valo wrote:
> 
> > +		if (iftd->types_mask & BIT(arvif->vif->type)) {
> 
> Johannes pointed out that I should use ieee80211_get_he_iftype_cap_vif()
> instead. I'll submit v2.

And I'll note that it's not just because it saves open-coding it, also
the BIT(vif->type) in mac80211 will be wrong because it's always STATION
even for P2P-Client, so you need to add the vif->p2p bit in.

We maybe shouldn't have done that ... but it seemed kinda nicer at the
time to treat them both the same except in special cases.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
