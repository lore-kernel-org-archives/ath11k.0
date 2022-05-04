Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41754C433EF
	for <ath11k@archiver.kernel.org>; Wed,  4 May 2022 11:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maQ07KiBzT6uctIvYX7ez50hjo7nelsuQ0UoaVyquzI=; b=gvjau/3Tzr0rAQ
	Y7srjp+8QYlgiqjvcbeIuUrSl29+89Zwob+iEIz0Tr8C9OGW9ORYseiB70cn/7QESZETvSNBtblS2
	2OOujFQ/Wns7tg+l7PXdPgKrQATjQISw8N+GcQnSua1ibjalOqH+0n9+yG8dPS0MkO4VzEt3EXcx1
	Ku+/JKZW8vcB3F7NBGXemNEQzVYR1VJQgTzQQxcepe5xrlrJtEAwEF1XSk3uV2qMbjQp6OgprNW4l
	rkqOMPWgd9XxxTWrASiLfHdtARn3cpYHVmDhHVbrY9k2FpKIAcemPxm+Z7QGgXmkvYHU+EvpJ9BC6
	raBPqPw3Jv4zDrEwTtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmDTx-00AYHt-Va; Wed, 04 May 2022 11:47:50 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmDTu-00AYFx-UK
 for ath11k@lists.infradead.org; Wed, 04 May 2022 11:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=/YhHlU416mXxVS2uu0nKAKDOzg4gDRQYAT19TdBjKa4=; 
 t=1651664866; x=1652874466; b=GYmTWqD+SPNnX7qBC+YjyAzNcSiYz7FLu1pNIaG70Wss1Ma
 9p+VJFHpnL4JP+EaDSiUchqFa8D8KQg+bM4B6UOxzAWML0/qEpxo/8h74bicpBVGrEcRndkRpL8H1
 XO2a8HRZ6HzxUs4a8MHUv+vmyCSbDrs1ffGFFe2DlhiZijgC14h0iCmkbKJtblcvzSgRYJiu/RcQg
 s2PNM9X3XrXq5Ts80KlDomW0vP0AlgWZmq5noCxHATNwoPeyyuWwpyeqn6yFXKTuBpVv6cjBJrLl6
 TOSd+3RUzM2Fkkt4109BWzOwrM6n1Y9kTFNS5AjgIM5WbVNFY/Cg1vl0Ifb6T8bw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nmDTq-0021OS-Rr; Wed, 04 May 2022 13:47:42 +0200
Message-ID: <7b53ed63ab1d50c9c7d7dd3e8597050c9e233944.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] mac80211: add support to configure 6GHz non-ht
 duplicate transmission
From: Johannes Berg <johannes@sipsolutions.net>
To: "Rameshkumar Sundaram (QUIC)" <quic_ramess@quicinc.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Date: Wed, 04 May 2022 13:47:42 +0200
In-Reply-To: <DM6PR02MB49379E377E3E7940540DF587E9F09@DM6PR02MB4937.namprd02.prod.outlook.com>
References: <1644914581-21682-1-git-send-email-quic_ramess@quicinc.com>
 <1644914581-21682-2-git-send-email-quic_ramess@quicinc.com>
 <a517835c51a5eaf00e87fdaaef47546f70ff0d42.camel@sipsolutions.net>
 <DM6PR02MB4937C53041172E9A52846A0BE9169@DM6PR02MB4937.namprd02.prod.outlook.com>
 <a537c6e02afbfa26eec2a54dbd8bc649f77ae3a3.camel@sipsolutions.net>
 <DM6PR02MB493734ADBBC6C996845B9EF3E9179@DM6PR02MB4937.namprd02.prod.outlook.com>
 <babc75d310031f9f92736d5da65679ca50542849.camel@sipsolutions.net>
 <DM6PR02MB49379E377E3E7940540DF587E9F09@DM6PR02MB4937.namprd02.prod.outlook.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_044747_057077_988636FA 
X-CRM114-Status: GOOD (  13.15  )
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

On Sun, 2022-04-17 at 14:30 +0000, Rameshkumar Sundaram (QUIC) wrote:
> > 
> > Well, I was thinking it would reasonably come with the beacon rate,
> > i.e.
> > as a new attribute like NL80211_TXRATE_DUP?
> Sorry not getting this, you mean hostapd would need to send new set of
> rates for this configuration ?
> The expectation is that user-space will set this bit in HE oper IE
> only if legacy rates are present in beacon or basic rates.
> 

?

I don't understand.

The point is - you're setting the bit in the beacon that indicates "I'm
transmitting it as duplicate", right?

But you're also using that bit to actually configure it to do (non-HT)
duplicate transmissions.

But fundamentally, those two things aren't really related, are they? Why
shouldn't you be - at least theoretically - be able to configure it for
duplicate transmission (or not) regardless of the bit in the beacon?

To me it seems "do duplicate transmission" is a property of the *rate*
you want to use to transmit, not really necessarily a property of the
*content* of the frame you're transmitting.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
