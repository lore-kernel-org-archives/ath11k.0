Return-Path: <SRS0=6W4N=GS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08509C433DB
	for <ath11k@archiver.kernel.org>; Fri, 15 Jan 2021 10:11:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5726D235F9
	for <ath11k@archiver.kernel.org>; Fri, 15 Jan 2021 10:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5726D235F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tdqskxPftUDN19MpIBscK4cUywW6ZBBddqHdo23wRdM=; b=uKm+pSGuJODuY3oMVL9tOk7ze
	BZ9FJGEqu4nCTkYIi/2wiEwj4osHHnHYO14+NZIs4YG8p1LvAniMH04BRfNWeY4BVHXAHz1Xs7LcZ
	2LiLcHNriCYlAO/ZKHW2bQdQ/UOvOCEqvYbPwT06p3SSFqgcsVGBTJkCokY7bztiZDz9/YJzAeRsT
	WjTkwy/9oaNjcC9tbBPgKn27DvRWi2asb2LZxAyqYXJ+aEKS4gerBHLntFPLf3Vn6gdJp5ea6Lqzi
	JUCTtoXTe03BMIOtOu3p0BooEmUdodp1+f77Ps7ZMrUulAIVcSm08jC3HOe7nWG6SdxZterK8WOm2
	C8htbf5tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0M4H-0000od-KG; Fri, 15 Jan 2021 10:10:57 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0M4F-0000nr-Id
 for ath11k@lists.infradead.org; Fri, 15 Jan 2021 10:10:56 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94) (envelope-from <johannes@sipsolutions.net>)
 id 1l0M45-006bJg-Ax; Fri, 15 Jan 2021 11:10:45 +0100
Message-ID: <faca6aa3128471b3ed8c82a2116c25ad8bc149b6.camel@sipsolutions.net>
Subject: Re: [PATCHv2 1/2] nl80211: vendor-cmd: qca: add command for ap
 power save
From: Johannes Berg <johannes@sipsolutions.net>
To: Jouni Malinen <j@w1.fi>
Date: Fri, 15 Jan 2021 11:10:44 +0100
In-Reply-To: <20201223124622.GA12620@w1.fi>
References: <1598257589-19091-1-git-send-email-vnaralas@codeaurora.org>
 <4b4a0d79a243c1c3b8044730da0493c96ba294bf.camel@sipsolutions.net>
 <871rilf2th.fsf@codeaurora.org>
 <dbaa655c3f15f800f73b7c19f2b1a054@codeaurora.org>
 <87eelr1oq9.fsf@codeaurora.org>
 <f6c148a3-73de-1481-5f63-2deecb599468@broadcom.com>
 <81ced18ac5b87a17cf31797cf91669bc@codeaurora.org>
 <87sg9rtugu.fsf@codeaurora.org>
 <60c779b7c17b8ea40c2bba08d8fca98e83581580.camel@sipsolutions.net>
 <20201223124622.GA12620@w1.fi>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_051055_628784_F149D19B 
X-CRM114-Status: GOOD (  19.03  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org,
 Arend Van Spriel <arend.vanspriel@broadcom.com>,
 Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-23 at 14:46 +0200, Jouni Malinen wrote:
> On Fri, Nov 06, 2020 at 11:41:06AM +0100, Johannes Berg wrote:
> > I suspect that SET_POWERSAVE might be confusing.
> 
> Why? Isn't the use case here very similar to the existing station mode
> use of power save even if the power saving mechanism is more of a vendor
> specific extension that applies while there are no associated stations?

Yeah, true, fair point.

However, set-powersave is a bit of a legacy API with state in the
kernel, and sometimes restrictions on how/when you can set it etc. I'm
not sure it's a good idea for those reasons alone?

> > Perhaps just with an attribute used in START_AP (and CHANGE_BEACON if
> > needed) would be sufficient?
> 
> NL80211_CMD_START_AP with a new attribute (or even re-use of
> NL80211_ATTR_PS_STATE) might work for a case where this does not need to
> be changed dynamically during the lifetime of the BSS.
> NL80211_CMD_SET_BEACON (which maps to the change_beacon() callback)
> feels like something that is currently limited to Beacon data updates
> with its use of struct cfg80211_beacon_data instead of struct
> cfg80211_ap_settings..
> 
> That SET_BEACON name is still from the old NEW/SET/DEL_BEACON time.
> Should that be renamed to NL80211_CMD_UPDATE_AP if we extend this to
> changes that are not really targeting the Beacon frame payload itself?

I'd be surprised if we don't already have non-beacon state there ... but
it looks like only very little non-beacon state, namely the FTM
responder state.

Renaming seems reasonable, we've done it before with START_AP.

> And should the cfg80211_beacon_data argument be replaced with
> cfg80211_ap_settings? It looks like we already have some struct
> cfg80211_ap_settings values like inactivity_timeout and beacon_rate (and
> maybe some HE parameters?) that one might want to update during the
> lifetime of the BSS..

That also seems reasonable.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
