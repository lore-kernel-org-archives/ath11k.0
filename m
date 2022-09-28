Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA05CC32771
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 19:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUTZmDECjqBqWMqxY9T+TGywmhBHWJshHPRGnJk5wg8=; b=VamccWMNwFjMRK
	dwZE4uE14WrmCLWxzGej5rSpad2LYh/MKzRlw4EsggCEDTD4731+Za89bhN4RQJhDP/VsUP/XS7Hn
	FLHkfk+QdEOyi/0AvpKBo1qk70glQtHpwdH3f3aPoQr39RUgsDqeW+sq5XFVUlR5bYrVvb1qxBLqZ
	1U+Z63GsXBtx5tqujvZdn+a2gIlM6XCLIfJ2QQSLRdBfjoAzeGalQrJqgcg1OP3/B49kz0U+pe91v
	Eb2bH/DqPYjKb3BLIHOXdWZfof4fGxS/eF/wBEaWiLOc2vJ1rMF2xpOaw1BH/cRj3S8jtxFA1HOEI
	KQ1xoQ3EIwOpaSdukLzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odcjb-00092c-Ka; Wed, 28 Sep 2022 19:28:43 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odcjZ-00091i-8i
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 19:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=qoBk84Coaxad38euvOy8oFH7RuoWMQKYKDLnzoU/ivM=;
	t=1664393317; x=1665602917; b=RVbnepTqd3jtGz9yZH4ODMrA/bKLNK5Urb5lODa5trsjnxH
	GtaNpELvPenKZyCpYFO+nju9d3p6HnKpWndQaGYu1YCxAcCWjWza6xpeiCMBnnr24/p0H7uKNc5HZ
	NrGfLVMtItm0u/KuXyYQnbw5slZX19fBPLVs5zAUWbfnr4SAIKqZGbuFNjAaMaOi6np1Rupw3ryq4
	x4zhgAruXND21GCMZz1doAUS9nHq9gayr8X8zraRTcF+EMhvEhKxIjPjkZ+Tlkjd1MTlZO7zq77Tm
	mZzHnLp4ficebdldC0nWLosFDsQhtUqWn71R1DhvzhhBmKq9jJMCyggBOsd97SqQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1odcjP-00AVVs-2A;
	Wed, 28 Sep 2022 21:28:31 +0200
Message-ID: <f240b33d507daf898480b0a11eb27d4475e45164.camel@sipsolutions.net>
Subject: Re: parsing the multi-link element with STA profile wifi: mac80211:
 support MLO authentication/association with one link
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: ath11k@lists.infradead.org
Date: Wed, 28 Sep 2022 21:28:30 +0200
In-Reply-To: <48715509-62fd-2307-e38f-176234b482c1@quicinc.com>
References: <48715509-62fd-2307-e38f-176234b482c1@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_122841_320478_8406C693 
X-CRM114-Status: UNSURE (   8.62  )
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

On Wed, 2022-09-28 at 23:33 +0800, Wen Gong wrote:
> Hi Johannes,
> 
> May I know the status for below work which is written in the patch below?
> I think it is needed in 
> ieee80211_assoc_config_link()/ieee80211_assoc_success(), right?
> 

It passed the plugfest last week ;-)

Yes, I need to get this posted ... but now I got another urgent thing to
look at, so it'll be some time.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
