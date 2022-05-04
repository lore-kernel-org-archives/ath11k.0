Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E85C433EF
	for <ath11k@archiver.kernel.org>; Wed,  4 May 2022 11:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJV0L58NC6Z0mm6RbGTqtheeympL3S7Pm8liuN/s06U=; b=x82JF0HujCYkYi
	1nG0LJmVXAejRCo7RX9givVQWtryu9NoWanRU/YWWAJLkWzXPIWE58Y20bjXX1Ll6gck/BRWCXfDc
	qajb7Pr9XMzPazXRHFTSk4OKNfd/ubq1U7cfWr2WK9C2doaZFdzbNfWweObgZUt2nl6wtijcOR3UX
	XV7Ccj/aGKtanjpq1QUBvvYKCTNmvCeulHMBVmN19m0eeuWm3raAB69Z/3Ecwy2klnMIpb2fRnG1t
	5kBkrxQVgMhVFJctcJ20gxGdLDTeL2tHcaqiN6DENikYY4xIvqYwkoYOftS3Nx91uimPaNbE8Qzrj
	zIWSZt287W8Js5fcJadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmCyD-00AOpc-RP; Wed, 04 May 2022 11:15:01 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmCyA-00AOpH-No
 for ath11k@lists.infradead.org; Wed, 04 May 2022 11:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=iUj47hOsQY4WwZXF5zIQ8HlvN/uG2gB6rA9TwZr7GM8=; 
 t=1651662894; x=1652872494; b=qFE7vmxsZUZyGjTNzYbtFahXiQiaP9ie1IifuEDo6jKVdD5
 y2kTnl4b1ahd814hyXFKXFSzqBXSLb4ufc3YODdBu86YhAxeTIAMgCML8hVh3R3cw0kPigIpqOeOq
 8EfgiJ/6CtOJtb077huGPelz9/DH8dR4ibQ4IKffJjRmC28JeBmMJB+KDT2PmVTE09FjyYxDO7m8n
 jOdqzyrKdI99fi+pnNqs0wEMmil8nFbNmPrzGyx0awo7we9oBjk6uon9uAeQpIF59PfgewddvbboJ
 x3rosSqRaLHxX2w+O8Jk5U7/CAaKQ/q8Gp5v29qbIGflYcdYf30iQdzy9x4TGswA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nmCy3-0020xz-Nw; Wed, 04 May 2022 13:14:51 +0200
Message-ID: <1c08cc9fca6e0a5f8fe02c7324a28ea2ad818354.camel@sipsolutions.net>
Subject: Re: [PATCH v4 1/3] nl80211: Extended ROC support for 40-80 MHz
 bandwidth
From: Johannes Berg <johannes@sipsolutions.net>
To: P Praneesh <quic_ppranees@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sathishkumar Muruganandam
 <quic_murugana@quicinc.com>
Date: Wed, 04 May 2022 13:14:50 +0200
In-Reply-To: <1647857797-19749-2-git-send-email-quic_ppranees@quicinc.com>
References: <1647857797-19749-1-git-send-email-quic_ppranees@quicinc.com>
 <1647857797-19749-2-git-send-email-quic_ppranees@quicinc.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_041458_822077_6BB349D2 
X-CRM114-Status: GOOD (  10.58  )
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

On Mon, 2022-03-21 at 15:46 +0530, P Praneesh wrote:
> Replace struct ieee80211_channel with struct cfg80211_chan_def in
> remain on channel apis, because the channel width information is
> needed to handle centre frequency of 80MHz, and it is available
> in cfg80211_chan_def. Also, add SUPPORTS_EXT_REMAIN_ON_CHAN feature
> flag check before driver ops call.

Couple of more things ...

   1. Please split this into cfg80211 / mac80211, many of the changes
      are related to mac80211, but also many related to cfg80211 only
      (all the fullmac drivers), so I think it'd be nicer to have it as
      two separate patches.
      
   2. You're not exposing _any_ such capability to userspace, so when
      userspace requests a wider channel but not supported, it's
      silently ignored for all the cfg80211 drivers. OTOH, for mac80211
      drivers, you reject a wider channel. This can move up to cfg80211.
      
   3. Why limit (per the commit message, not sure about the code) to 40
      and 80 MHz, rather than allowing any bandwidth? Maybe somebody
      would want to use even smaller bandwidth (5/10)? Perhaps drivers
      should expose a bitmap of permitted bandwidths (rather than a
      single flag indicating support)?
      
   4. At least in the brcmfmac, mwifiex and wilc1000 cases, not only do
      you ignore the bandwidth, but you even pretend in
      ready_on_channel() that you used it ... that seems even worse than
      just ignoring. Also, in some of those cases you send it as higher
      BW in the ready event, but lower BW in the expired event ...
      
   5. (I don't want to know what happens in that staging driver ...)


johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
