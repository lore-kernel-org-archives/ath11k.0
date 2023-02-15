Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D526C636CC
	for <ath11k@archiver.kernel.org>; Wed, 15 Feb 2023 07:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1e21CmXAgmsSYH0AEQRBsyNWTysuvQUhH/WQxA0t0g=; b=mW8a3hBJohXW3+
	MiUtGb9F8CY8uWrVYfOUKWxQB9SbSycabjFFstBeo8ZdIYTEV7ffkaAGacbo99902amcwvLGujxjC
	XJKeeQWDlLZaKRAlPKCKcS7PjDkZ+LawDre0SL0nUBXAkwqvqmGF69D+LRWPkj8lWejGv62AeBvt6
	96jy5y1CC3EDN3rG91ejlZS+gfvbWNa5OiCqUVRPf3YvhKFU+7KUWuQv5AJ9Jo1G5b6tq7nYPYwTU
	keK0bOyPLJ9aCqKS759jiQ1fsWjOMTtDtYokFubUo4SRpkWYMksRvTnVuHJABRdIswzVbkjU2kEjc
	KDSMcCfqY2Vvg7OXaNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSCGB-0053qr-Ln; Wed, 15 Feb 2023 07:31:23 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSCG8-0053pB-8i
	for ath11k@lists.infradead.org; Wed, 15 Feb 2023 07:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=mkqE2r3m51/LiSQIdo/az6Tf1nHb/Z9frMWJQw/+3Bg=;
	t=1676446277; x=1677655877; b=GAiKqvJXkFHmKG0XtkjmsEJuOcHFRICqqGKF1ix8BYPkk6s
	06v+7wSJizl0MAS4Ve1QY1wH18eW6bzEYCYsrd1u2aFbhc2MqvD+oVEb5nvmN3t8ri2YoWhzmqP0o
	FkWJqdGKPCr/LBqPL7SelbaGT5KMTi2jXFLB0t4NuTRQsiGRHG8SE2ERH0gAc91tYNnGbiTFOSb2O
	yL++S/zb/wt7FdXs0XHg8Ovrhb82WBDAa6PV7qZ/Y6ZSbkRZ1vADIf1Zd+eAU8WtMnk+vzBy+8DVm
	B6hXky9ThONWbVVlQsyiBsqjOPV+t34VeUeaceBeHFcaOQU8YOhT7bavH9Q4maug==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pSCFu-00Cy6v-1F;
	Wed, 15 Feb 2023 08:31:08 +0100
Message-ID: <4ab31b2407d9b2d930a2637730c4f3c0b2555c6a.camel@sipsolutions.net>
Subject: Re: [PATCH v3] wifi: cfg80211: call reg_notifier for self managed
 wiphy from driver hint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 15 Feb 2023 08:31:05 +0100
In-Reply-To: <bcaf5a88-76f3-c4ed-0fca-2c131d392f82@quicinc.com>
References: <20230201070327.27578-1-quic_wgong@quicinc.com>
	 <bcaf5a88-76f3-c4ed-0fca-2c131d392f82@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_233120_320851_ECDD568D 
X-CRM114-Status: GOOD (  13.14  )
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

Hi Wen,

> I see you have merged v2 to wireless-next.git and this v3's state is reject.

Yeah. Actually, I saw v3 only after I merged v2, but then I saw what the
change was and figured that was unnecessary anyway.

> So do you mean we should not keep hole BIT 24 in enum wiphy_flags from 
> now as well as hole 11/12 in commit 8e8b41f9d8c8/ca986ad9bcd3?

Indeed. The point of the comment saying "use" was to actually, well,
_use_ the hole next time. I haven't really enforced that since I keep
forgetting (and we're nowhere near running out of bits), but yes, the
point is that you could even have used bit 11 or 12.

> If that, then backport this patch will be more complex, because the 
> backport kernel already have
> WIPHY_FLAG_HAS_STATIC_WEP= BIT(24), then firstly the backport kernel 
> need backport other
> patch(585b6e1304dc ("wifi: cfg80211: remove support for static WEP")) 
> which is not really needed.

I guess it could use another bit number (such as 11) in a backport, but
I don't see that this really _needs_ to be backported? And if you're
using backports to backport the whole wifi stack then this isn't even a
question since it all comes in backports.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
