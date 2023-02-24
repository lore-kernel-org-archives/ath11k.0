Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41646C64ED8
	for <ath11k@archiver.kernel.org>; Fri, 24 Feb 2023 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7TwFpWXStFekDzHie4dH8nnLcZ80AD+jH4MKC5SK3Y=; b=ar9fWyvXuaeRpC
	al+1vhx+txL7nCnFZoWbhWc6a1lLhYrT+cVDw6wAM2qiXCWakFljQ+neKDVC79p3sliV6xfTLL9MH
	za9QZpvMX7sicIJi5s4rKmMgqSaH4fIpiR7+CJKwjIqrqY7ZlN8zuDxZTTgXvB777/7/bolxK0c2Y
	Mzz+CGsMwKAt8pEHBW8Gqhz2JFWaV17t5QFu03Lvf3UCzKakAAUUjS9KGImYVl4OivxmEyIuwPJCF
	uFkgXVPQKHnq8+o2n/MOGTqXkTuDuKF+ZPMn/EcHPDefEqH/KpAA26rolgLj1lH8izldi5ReBqg7X
	WufnTkc1VLON/7By1u8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV7J-001wlw-L0; Fri, 24 Feb 2023 10:15:53 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV7G-001whz-7O
	for ath11k@lists.infradead.org; Fri, 24 Feb 2023 10:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=tkM+SFdwRaFOFd0Ny9sr17OCmX6BuWzOVwVIIiMjVYo=;
	t=1677233747; x=1678443347; b=ihOjvW/CQwzEPyKbMVfOaDIKuOOqGA7jRqaGz0mnndFaOCs
	kp3hpviR3G9zKOjQihNxBeA7U4MJQnlfPsZibtDd748y6PnVJveOduFOZGI+qni0HTKwlGf/EJCzT
	v6e4mIt06wKL/F3egjjFp9M+ZYUk4e/6mH2hoQAe6OfX41P8ILIJRmMUnkdxAOVFDRnIxMbMa0bL5
	3o1vs4SkPSfzjdERD+akg1CcWjKG6v3/Vp49MYOxlL/SN4Y9wlhr47Lpv/QjLhAmigDd2YQj6WJBW
	oUlZ1HYFxgZ2iIDNV5Xk2vuwSNtRBm+YZM5ksRN19lgaHl9StXNb3nNnQsvgROxg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pVV76-00498c-2G;
	Fri, 24 Feb 2023 11:15:40 +0100
Message-ID: <56a3651e48ae621afa4c50f1ba0d9fedeefb2c31.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: ath11k: Optimize 6 GHz scan time
From: Johannes Berg <johannes@sipsolutions.net>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, James Prestwood
	 <prestwoj@gmail.com>, Marcel Holtmann <marcel@holtmann.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	ilan.peer@intel.com
Date: Fri, 24 Feb 2023 11:15:39 +0100
In-Reply-To: <10e4b6bf-f375-e50f-063a-b44471359d25@quicinc.com>
References: <20221220043823.20382-1-quic_mpubbise@quicinc.com>
	 <5DAEA8B2-2B44-4A91-9E57-12B6C6B6C1FC@holtmann.org>
	 <2861463e-a097-7efe-bc75-f13c8faf9547@quicinc.com>
	 <378a1d63b3752ace7384c44d6f5184753fa7795d.camel@gmail.com>
	 <0b06dea9-d5be-1edc-62ca-576398d1bcd8@quicinc.com>
	 <0e7644cbfa9e4ba0d534681166ca467ea1684719.camel@gmail.com>
	 <10e4b6bf-f375-e50f-063a-b44471359d25@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_021550_299844_D04F26BC 
X-CRM114-Status: GOOD (  33.28  )
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

On Fri, 2023-02-24 at 15:38 +0530, Manikanta Pubbisetty wrote:
> On 1/10/2023 10:35 PM, James Prestwood wrote:
> > On Tue, 2023-01-10 at 10:49 +0530, Manikanta Pubbisetty wrote:
> > > On 12/29/2022 2:52 AM, James Prestwood wrote:
> > > > Hi Manikanta,
> > > > > By the way, userspace itself selects the frequencies to scan, not
> > > > > the
> > > > > driver.
> > > > > 
> > > > > If we see the split scan implementation in cfg80211, this is the
> > > > > how
> > > > > it
> > > > > is implemented. If NL80211_SCAN_FLAG_COLOCATED_6GHZ is set, it
> > > > > selects
> > > > > all PSC channels and those non-PSC channels where RNR IE
> > > > > information
> > > > > is
> > > > > found in the legacy scan results. If this flag is not set, all
> > > > > channels
> > > > > in 6 GHz are included in the scan freq list. It is upto userspace
> > > > > to
> > > > > decide what it wants.
> > > > 
> > > > 
> > > > This isn't your problem, but it needs to be said:
> > > > 
> > > > The nl80211 docs need and update to reflect this behavior (or
> > > > remove
> > > > the PSC logic). IMO this is really weird that the kernel selects
> > > > PSC's
> > > > based on the co-located flag. The docs don't describe this behavior
> > > > and
> > > > the flag's name is misleading (its not
> > > > SCAN_FLAG_COLOCATED_AND_PSC_6GHZ) :)
> > > > 
> > > 
> > > Sorry for the late reply, I was on vacation.
> > > 
> > > What you said make sense. The existing flag should not add PSC
> > > channels
> > > according to the flag description.
> > > 
> > > We can add another flag something like you pointed out
> > > SCAN_FLAG_COLOCATED_AND_PSC_6GHZ and include PSC channels if this
> > > flag
> > > is set. What do you say?
> > 
> > I'm no authority here, just wanted to point this out. This is something
> > that would need to be in mac80211 though, not just a specific driver.
> > It would be up to the maintainers and would require changing the
> > behavior of the existing flag, which then changes behavior in
> > wpa_supplicant/hostapd. So its somewhat intrusive.
> > 
> > But personally I'd be for it. And just require userspace include PSC's
> > like any other channels if they need those.
> > 
> 
> Hi Johannes,
> 
> What is your opinion on the changes being proposed to the 6 GHz scan in 
> cfg80211 that is being discussed in this thread?
> 

I don't think we can/should change the semantics of an existing flag
now, but we can certainly update the documentation to match the
implementation, and add more flags to make it more flexible.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
