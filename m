Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF74C432BE
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 08:20:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D278D6102A
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 08:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D278D6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhT8lW/HDg5aVcEARjgglFQxi2BpN3QOmRx38i3FM5c=; b=3fO4XcebA0mQMA
	1aHq6kNk7RZj7+oLdz2pT2juwTd41vi9nEUwFhrhMHQzoYnjxZ1loIWqdmkud7yAFX9l2LuqOa7Uf
	6qQvOOty637ijMldonSubAg+f4yveujU8h6HirY94fMt3M1AuWVTM9nNQds8VHw28TbvBvQDl0F5z
	HCXBat52kKleC13sWjMZ3yK3ExHgDnRm5mLVuj6HS5vnheIOApmlu1a35LDS+5JT9NSetlqAtal69
	9VgYF4XOJyEbanBCcH6VKFGhQyxmtkkXrRMIUsH6L40Nnl6L0h9cZhqk3ZzIli70bxEHo567jH0jc
	xKGCXabKg0hS+XHmRzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJX6b-00BwL4-UF; Fri, 27 Aug 2021 08:20:53 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJX6W-00BwKa-G0
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 08:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=HHrMeXbykUDL/YEPXeS3l+FmwS0oZlKQaJGFstXR11Q=; 
 t=1630052446; x=1631262046; b=OBLx0G1dFooo91aLAvxcYj7D6lnQh1bJLBXo/AJaiwRr8z1
 JXL9p/Ry1bNLfcDZfGdXh+gNpvsnHUnrZHqgZ9oISXQeIHjE5VeluEmBKc5QC1INIeFfVJ/9xzfw5
 MW/u0n/3oimVOcgmR8KESQOJxa6NID9WdLrOsg08uUjBp7jAN5YNYTVow92hup+TTyF4Du33RwBo8
 WP4TDD1M4ZQe6a77h4BCJSrBHadv1RGcpDTjm2IHGcMG55DN9mcjLPDCzOXRLLRy90evRSAJAdWDj
 q/yDOmAxAMbva1IiXOQNZVizKmpIla6v3xkWeUUEXs1HcNiwlWiFhg04MQ6VY80A==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJX6Q-00GX75-Fy; Fri, 27 Aug 2021 10:20:42 +0200
Message-ID: <3483aeb87a81dea538af3a2640cd49831274320f.camel@sipsolutions.net>
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element
 and power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Fri, 27 Aug 2021 10:20:41 +0200
In-Reply-To: <01d9e4eadbb0d87edbc026fc719858a3@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <25fcede26b99604a03d0b321b7120db4@codeaurora.org>
 <48ad47869e703cbef437378c508d6a5b64c160ae.camel@sipsolutions.net>
 <db22a4cb9a07e3845a50f436c7052feb@codeaurora.org>
 <0680b508a7864e02f55d763851f7460baa73b53f.camel@sipsolutions.net>
 <110489059796b17849d0f32fb5189828@codeaurora.org>
 <27680423e824dd67217cc6f1e62f9ac0a1af78f2.camel@sipsolutions.net>
 <01d9e4eadbb0d87edbc026fc719858a3@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_012048_583668_03F9D566 
X-CRM114-Status: UNSURE (   8.61  )
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

On Fri, 2021-08-27 at 16:18 +0800, Wen Gong wrote:
> 
> then should I use "struct ieee802_11_elems elems = {0}" or "struct 
> ieee802_11_elems *elems = kzalloc(sizeof(*elems))"
> in the parsing patch?

Yeah, it's a good question ...

We keep adding stuff here, so it'll be safer to alloc it.

I get a fair number of stack size warnings on the build now (possibly
due to the addition of the TPE fields?), and while they're probably fine
for now (we get there from nl80211, so no deep stack), it's only going
to increase - we have EHT patches already now, for example.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
