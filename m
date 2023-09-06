Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B37EE14A3
	for <ath11k@archiver.kernel.org>; Wed,  6 Sep 2023 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHvjoQP7e9sMYYWQ73OylHrdf32pOp0wgb8+amyuODk=; b=ldNOnWCxij5zqJ
	lBzfBwrtBB23NhjhEaztwbagR/Do9L9nYgKqglVQ0tAEGAUEdJ5YGKPO4RC2Ie6oO7W8G33tEFFQ+
	ODCo/FnezaHwLkvXpU9Mt0Tih1zJMnMA0px0/XHH4giv/POD/X4FUtTSxMP/wDyA1YP5jziPnfnfb
	PV1s9l7MusiQ8AQGqRm65peVkVcUY/Alv4SbqAXWYDVulnBmhClS7s12Cu6vM00iULCqGXhZHhgjx
	58SV9rTM2lo51LIS+/yiGCRIVDpi7cPZW1IsELr7syN4KO8vvquLSwaI8Tp4dLqI/F34Ud987gfkM
	8nmu0UONvwG1pbuxKDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdtw6-00AKkE-2E;
	Wed, 06 Sep 2023 14:55:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdtw3-00AKjX-1K
	for ath11k@lists.infradead.org;
	Wed, 06 Sep 2023 14:55:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DBC65610A3;
	Wed,  6 Sep 2023 14:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B91C433C9;
	Wed,  6 Sep 2023 14:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694012114;
	bh=xjtzvFZoW+qCCsOn7bYqsTOWwU4z1z6KK7muQqsOpUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MwNNxv1w8uIGGsGF/KBV1qD7Ol4exXc8QjOL7cTlbs4Z+Fjig6tO9qTz2Le6crDYr
	 qW23pic/fga6dsKpdcizgQMkw/4SRJ9u+DRGsigBKrB7xUATFaPpldZ6BGHHkAbMHo
	 Kmj59RT2J+gAEzJp2zixQBZnr8eMiF/sBW62cOS8VqCvQlP4q/KvX0nO20w29UwgDn
	 6bFjtF1Wt4NUq5SwkI7jR9u5N06pQw3tKmkgpc/JA8HGG0WyuApPIcwLA/RIeb7BGU
	 9IaznvqXRGeGkBT17QZsd4extfBJVzzT9KY6PXoGNPDSQqHgC7Zs8u31bfG23p7McA
	 SKrUZnOv5TqVw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qdtwS-0004cy-1S;
	Wed, 06 Sep 2023 16:55:40 +0200
Date: Wed, 6 Sep 2023 16:55:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Alex R <alex@ironrobin.net>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: WCN6855: Request: Support ThinkPad X13s 21BY-S03Y00
Message-ID: <ZPiS7EJe7teOpOyw@hovoldconsulting.com>
References: <mYl9fKKm9_Kn1aqjsnk6yx9YxhhFShCQeF2qptjjWlKDJ-XpxsO038Eag4A9S4EABiWbhiJ8polAtrOwVGIZeZ1yYTSwNYldBBDeZXMmtxI=@ironrobin.net>
 <87jzt3ellx.fsf@kernel.org>
 <ZPhCq32KlaZteCzG@hovoldconsulting.com>
 <d191d35f-f006-45e6-bf69-3d4d251a892b@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d191d35f-f006-45e6-bf69-3d4d251a892b@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_075515_496228_66769778 
X-CRM114-Status: UNSURE (   9.05  )
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

On Wed, Sep 06, 2023 at 07:47:17AM -0700, Jeff Johnson wrote:
> On 9/6/2023 2:13 AM, Johan Hovold wrote:

> > I've asked for some more details from Alex over IRC, but it's currently
> > not clear why there are problems with this particular machine.

> Is this using the single MSI interrupt feature? If so, try:
> "[PATCH] wifi: ath11k: fix boot failure with one MSI vector"
> 
> <https://lore.kernel.org/ath11k/20230601033840.2997-1-quic_bqiang@quicinc.com/T/>

No, it's not:

	[    2.195919] ath11k_pci 0006:01:00.0: MSI vectors: 32

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
