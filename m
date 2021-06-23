Return-Path: <SRS0=F7Ac=LR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFDBC4743C
	for <ath11k@archiver.kernel.org>; Wed, 23 Jun 2021 11:16:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16C376102A
	for <ath11k@archiver.kernel.org>; Wed, 23 Jun 2021 11:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16C376102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSfifR6Alfl+hDPxrrYCizVBJmv3GW/12/8Zs4rw/IQ=; b=GHwGE2uvRImWOC
	iCdcCr6d2kQm6RWEBOTZqlaQYpwq8WlwLw6gZZ/RTIBAQMXadte01A11/BuTnGzdmcHZwRnELyk9b
	V6aTSi/MQZ6OahIK5p+H9L89gM13nxej7brR5ySwC4uXB36mrhc8jhXAHRgeSNJBCYJEg8VLXfMQe
	exqzU05h+zNXepqlLkfELSREk4+kCNTPYcCYNOpd0863WHnLWRp8TnTbWulZ9GgFJFK/+hP4QjQbZ
	vzi4qJdqGbkN96Plgenifb4r+iC7x83GVelJuH4cZeCDKVltY0kah1kjN/usaejopr1BHSxd5uov1
	rtgc6AHlMLVyEZWoYvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw0sC-00AQFI-Ij; Wed, 23 Jun 2021 11:16:48 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw0s9-00AQEc-RT
 for ath11k@lists.infradead.org; Wed, 23 Jun 2021 11:16:47 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1lw0s5-00AXaj-0H; Wed, 23 Jun 2021 13:16:41 +0200
Message-ID: <f14e6e6b81978ace4580774981a7e032b4001182.camel@sipsolutions.net>
Subject: Re: [PATCH v4 1/3] nl80211: Add support for beacon tx mode
From: Johannes Berg <johannes@sipsolutions.net>
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>,
 ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Date: Wed, 23 Jun 2021 13:16:40 +0200
In-Reply-To: <1623164855-15910-2-git-send-email-mkenna@codeaurora.org>
 (sfid-20210608_171052_201356_8AEA5406)
References: <1623164855-15910-1-git-send-email-mkenna@codeaurora.org>
 <1623164855-15910-2-git-send-email-mkenna@codeaurora.org>
 (sfid-20210608_171052_201356_8AEA5406)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_041645_937605_ACE8ED8A 
X-CRM114-Status: GOOD (  11.02  )
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

First, I'd like to see some input from other vendors - is this useful?

I have no objections to it and it comes with an in-kernel driver, so I'm
inclined to accept it, but maybe we should have other modes, etc.?


> + * @NL80211_ATTR_BEACON_TX_MODE: used to configure the beacon tx mode as
> + *      staggered mode = 1 or burst mode = 2 in %NL80211_CMD_START_AP or
> + *      %NL80211_CMD_JOIN_MESH from user-space.


This should refer to the enum, not the hard-coded constants.
> 
> +/**
> + * enum nl80211_beacon_tx_mode - Beacon Tx Mode enum.
> + *      Used to configure beacon staggered mode or beacon burst mode.
> + */
> +enum nl80211_beacon_tx_mode {


That's missing kernel-doc, and you also don't specify what default
means. Why is it even here?

> +	[NL80211_ATTR_BEACON_TX_MODE] = NLA_POLICY_RANGE(NLA_U32, 1,
2),

That really also needs to use the enum, not hard-coded constants...

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
