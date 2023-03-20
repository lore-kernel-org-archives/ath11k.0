Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A59C6FD1D
	for <ath11k@archiver.kernel.org>; Mon, 20 Mar 2023 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ap58Q5y/VWOQq/AMWniaZorPF0E9IzQHEFdBZ8Q83dM=; b=ZNhGKO9eKOTcSt
	SxxZ3LpkH4XGl8kInd8qBwJAwK9u9QVlTSN+REJi2TX8XcD2DJxUQ0K4Q2Hnt/Y+NyFP23+FOzVOE
	SOCq3hOv48ANcENH5dJkVmyLBQl83cNgfiR+vYcPUJ71QE9qMzrCjwIlEsKo1rwZ8bGFISo0pWIAm
	EOSbq2Fuwuq6wA4IL3eCeRWtMeAP0+Sm97ZuFix5oYTcVrS81W4ZDVvdK/xHvzAB0LPHQXpdbYGKR
	jiQrTJwaq2RuHxZB/RnNl9GCcCm9335d3JjhXTPkhKsluznYR2m3yJCVTcLxV1D7yum5SsIe3Jamd
	mxAM8RLzLBCRs4ZqKfYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIwW-009vO8-1a;
	Mon, 20 Mar 2023 17:05:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIwT-009vLL-1a
	for ath11k@lists.infradead.org;
	Mon, 20 Mar 2023 17:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=f18Jj1X5RBDBxDmYG5gdBT4DNpSY1VTIA46He4j4jkE=;
	t=1679331902; x=1680541502; b=F+uZ4K+9GQ9Ksryal+VnomycPGHbKMrnMfDcMzI5hTbJJeM
	JRNos9hE7wgmz4Do2nLZwUoiALWFWTLc6SySBVzL3dtANOWIZh0EBxOXOniPk5Q9FLbCyKE8RsB1X
	GvUMqZHZsz8+7d3oetyuuOT9BGj7U9AyCkurmwtDoQGR0vIoVT43M7xMyWXiKGlQwCN30UczU77Sq
	u0TeE3HaS6AMggj5p/2IKEdh3b4bFi1UvObF2U2cedjKriTGUQ2GAr5prkauqynbT5gKr5Y6A64Y0
	skrY26Kwr+U/oBLtzw54naP7OryeVOcGxKcIjsDMi29UHcgXGKmrK7k/2Z8CFm6g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1peIwM-0094EH-20;
	Mon, 20 Mar 2023 18:04:58 +0100
Message-ID: <5e4ebc0244dfaafe8fe640458130a4527f43c728.camel@sipsolutions.net>
Subject: Re: [PATCH v2 0/4] Add AP power save support
From: Johannes Berg <johannes@sipsolutions.net>
To: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, 
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Mon, 20 Mar 2023 18:04:57 +0100
In-Reply-To: <20230320164334.3325886-1-quic_mkenna@quicinc.com>
References: <20230320164334.3325886-1-quic_mkenna@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_100505_796124_38E30BBF 
X-CRM114-Status: GOOD (  10.80  )
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

On Mon, 2023-03-20 at 22:13 +0530, Maharaja Kennadyrajan wrote:
> AP power save feature is enabled when the driver and hardware
> supports. If the driver suppots this feature then driver will
> advertise this flag SUPPORTS_AP_PS to enable the AP power save
> in mac80211.
> 
> AP goes into the power save mode, if no stations are connected
> and it will come out of power save as and when any of the station
> associate to it. Also, during the power save tx chain mask is
> reduced to 1x1 until the any station connects with more than
> 1x1 chain mask.
> 

All of that seems entirely transparent, similar to how mac80211 today
reduces bandwidth of the AP interface (min_def in a chandef) - what's
the point of doing all this infrastructure to make it configurable then?
Why not always have it, and perhaps make some debugfs to turn it off for
debugging/experiments?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
