Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C017DC4332F
	for <ath11k@archiver.kernel.org>; Wed, 12 Oct 2022 06:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cza6b11PQEyoQjgWximgWx0uTeexMhaYVLQs7muDDc=; b=ePGoIAo09NkxJY
	Z0a99aDlIAQ2u4tDNgoWQMobZ8URqGgZFtwg3IU0z0Q0VTIvaYGB9Eof5byGItbsKsrdAHe47STCO
	lP2PwD3dUg21QZXpaI9GxeWgfa7TySEUBgnPnM4ulUJWG4ieX3wjP9AGvub4XdCo5P0No2azCNLMC
	YFxf6wq1Vr9+GidgoiTPTebgX1dS+FfK20zVOhx2chRsrOtk+YaIUhZ4Ex6bqgv814nZhRS788htS
	1Fwh6LbOWyPWdoJuOKeRhUFfcFCJmMqJmnGS5xbZH8oVha8jYsq7bfMS5tmwLnQtaAuCiVfOGcymx
	uuy4Sr0HB7MK20LjaPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiVIw-0072Gd-0v; Wed, 12 Oct 2022 06:33:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiVIt-0072FY-HS
	for ath11k@lists.infradead.org; Wed, 12 Oct 2022 06:33:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66A246132C;
	Wed, 12 Oct 2022 06:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1FAC43145;
	Wed, 12 Oct 2022 06:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665556397;
	bh=a6DYOXYrMhLsjbnPgalRaFh7MVJ4CWVIZBOHcWqbeDc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=oMQ6XIDtoO1etHoHbLeBQbgYXu4MwLs5qDekMqdeMw7mzVifFbbOnX+DFj3/eamTw
	 IkVntjKxZkr2ir7zeR3Os6glEkfGmdTmPKpfgzhnTfQOJ1uJ2EN9sHlzv+SRMl9KP4
	 nsziwEnW24nFbizWcUlbyLgiRRcaPURxbcpgqVcblhpqCFfHqpq7mWabNRgmEdY2WD
	 iYzx+PvSZgFQmezbKEkics/uU6I9HvMfwOLYdVLe90ax5kN7af/xhosgNHvyMQQj8D
	 qaGjZFWsK51Y08BsQtyBBEyoXRqjZ6K8Y2/KaaktRiaW0pFSktlcHph2VIko9TBZEg
	 16HpdEFwm3emw==
From: Kalle Valo <kvalo@kernel.org>
To: Stefan Ursella <stefan.ursella@wolfvision.net>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k kernel drive p2p support
References: <366bffb7-34a7-4cd5-9c38-aaed66f66e8d.e0c24246-04d4-485f-8d5f-1cc8fbefd095.9ab7b34d-219e-4d9b-9875-0a3089c8bf4f@emailsignatures365.codetwo.com>
	<Y0ZaJrhX58uyWh9E@wolfvision.net>
Date: Wed, 12 Oct 2022 09:33:13 +0300
In-Reply-To: <Y0ZaJrhX58uyWh9E@wolfvision.net> (Stefan Ursella's message of
	"Wed, 12 Oct 2022 08:09:42 +0200")
Message-ID: <87h709o8k6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_233319_635929_A93095DF 
X-CRM114-Status: UNSURE (   8.11  )
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

Stefan Ursella <stefan.ursella@wolfvision.net> writes:

> I want to ask if you are planing to implement P2P support for the ath11k
> linux kernel driver.

Unfortunately it's not really possible to give any good answer as plans
can always change, though feature requests are very welcome and I will
read all of them. It will also help if you can provide more info like
the hardware you are interested in (QCA6390, WCN6855 etc) and why you
need it (use cases etc).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
