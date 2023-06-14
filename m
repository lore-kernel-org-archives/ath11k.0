Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0558AEB64D9
	for <ath11k@archiver.kernel.org>; Wed, 14 Jun 2023 18:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xi2TQJCLW74vcYjX6aF/T8rS1EOK+8HX0H1FRiTgGBs=; b=PLiRKNh5qXDTn0
	MVyArYswE/3IyL8T3pcLhebHKDzA3LAYkqGJ8hBYH41nBt6glU6P6zehQJ7AgOl+WnUtICr9RScZk
	sq/XhF9MGDftkKx25tZKqIDP/2XgQbkdc7MpT5Lzpg+jSzU4pd3XrP+MfUt4KoIZ8zIa2oIpxK3BL
	9CSVf9haehz96QcORb0iE1DHHVDetgZZLPXnzKMiRtbeeXYH/yHN5sDyh6on4TbS5teqqKrn8c8lw
	/DWmPhHihHwP1tEw/9uE0w7O6uboxHcZSqLr6H8TGsHatnRtOARGA5pkX/kPLZbbycGTHcwiUzEtk
	TVSJGXBWW/E60wnNA/jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9VIh-00CRk3-2M;
	Wed, 14 Jun 2023 18:32:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9VIe-00CRjQ-2X
	for ath11k@lists.infradead.org;
	Wed, 14 Jun 2023 18:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=VIVempwRAnUTae1kulh+NMBkImnt8hqihQQr0dy+2EM=;
	t=1686767575; x=1687977175; b=qtBhnm9Ad8JoZLDSKjARE0hnSGcXrNsZwizXewxBvx/l6ap
	Wl6PL28We4oDPlMk6lUHWvqeyKkxIbQopbOfC+DU6XkGEkg+NDkRyVOV4Ni+lDdKU0q8OYFxyZpEX
	X1QD+2NjjJT9qaTam2bzKY1GJnW8Xm6rrNlgVYE+rzZ7ImNBbTztWRuY9JruGBee5fYDSNVVmIZjD
	7BB4KtwDt7BZiD36dRk1S9U9HftrYEBEMpxYz67MjdAEBIikCU87baHuxb/Y7b+b4dTbCn7Mtx77K
	abmblTsjVbHstF5GXDCTeN8EC3+nLWgAOkPC86L3Rfyrt3cQWmk1tjAmuN4WDZBg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1q9VIX-006Ix5-00;
	Wed, 14 Jun 2023 20:32:49 +0200
Message-ID: <6f8db032286923845202c7d658f1d39db79a758c.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Wed, 14 Jun 2023 20:32:48 +0200
In-Reply-To: <1c26c205-0240-7670-117d-02a7af068724@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
	 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
	 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
	 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
	 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
	 <c15e368e-2fea-a1d8-9c0d-db9278ded5e5@quicinc.com>
	 <113761966918b2f390d3c9304307b42a0b4a829b.camel@sipsolutions.net>
	 <76863dec-1b2f-b933-7c5e-21c732de4bc6@quicinc.com>
	 <2cc79101249548f2a92c14af6aff6121143907d6.camel@sipsolutions.net>
	 <1c26c205-0240-7670-117d-02a7af068724@quicinc.com>
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_113257_118480_E903484A 
X-CRM114-Status: GOOD (  11.66  )
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

On Wed, 2023-05-24 at 15:41 +0800, Wen Gong wrote:
> 
> May I add a new ops in struct ieee80211_ops? like this:
> 
> u16 active_links(struct ieee80211_hw *hw, struct ieee80211_vif vif, u16 
> new_links)"
> 
> then ieee80211_set_vif_links_bitmaps() call the ops to get the links for 
> station and set the sdata->vif.active_links with the return value from 
> lower driver,
> it means lower driver will dynamic select the links count at this moment.
> 
> If lower driver not register ops active_links, then keep current logic.
> 

I guess you can can send patches for whatever you want :)

But I have no idea what you're trying to do? Why would you need to have
a callback?

Was this for link selection in the driver? We should have a patch
somewhere that adds a BSS_CHANGE flag for when the valid links change,
so the driver can select others.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
