Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05688C7115C
	for <ath11k@archiver.kernel.org>; Wed, 25 Jun 2025 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mj1bzi5+vNrOunUZIizFCsYEhOVaji0/pCt2aMyTGtU=; b=083ZGqC7iUDEVZdb/J505DyfPu
	AbFZsadbR3mYgMFyZ42k7BUDY4aVC3bCzHotcFCIhvzY1wMXKemVBWi4Ld/pddUc17x6YCQ7ncjBs
	vsQU9tTifl5/Scrx1UvLiktX/WmdRr4YjD0lfKv5j9bng9wOcT57HwWzZcO2w19BzSll1X2BQLTT4
	SbP/NRaTToVrgbU9CcQ/ZjuhBCxQbBNm14TesF4I3prSKSkU+7SlhMtIkW5rFMMadrDFNCheMfRI7
	kCgOoHoIz8OFVjUcOCYJfQZGN01Mbajer2sdQBa/k9DzReDexMjCLFo0uYOcEthueApKdFG0j4orB
	5AJ1uwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNl7-00000008NOr-2Crr;
	Wed, 25 Jun 2025 10:53:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMRH-000000088Ap-3meQ
	for ath11k@lists.infradead.org;
	Wed, 25 Jun 2025 09:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8400443D8;
	Wed, 25 Jun 2025 09:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0874C4CEEA;
	Wed, 25 Jun 2025 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750843746;
	bh=JHAZJ7i24XKSeFxU11UiSJ0cVdDGHBUB4umXE3veDNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDNoeCrKYs6P1frIQrIaw1DHvp73obIyVhZO6GIG/aJ+M9eJMve/gYznFcbOBnB8G
	 qkKNiCcZZ4TBK3QA4G13mq/0nwVssj+ObTTVPK0GHWiyUsZRdnMFn60SlYmaIbiSvg
	 i/nx2l5YL5eMUw+Qa60oF4acgMQzsH0C0B16q61LJjp/gqip69kgcGTq+o+856WoHr
	 bd2n4un2vNRoNovRLLww5bzQ+r0GIx1klgb3rF0LcSTtYjkD13ho9/ySjsm3vww1/Q
	 O5j2YqfXro+Ku6PtODi4Fqg6zktf5nsp9Bd1F5g9qJB5+eDSOp8AoT4LRA+STYH3tx
	 tSgNx0RtMjhsw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uUMRF-000000000GC-0Sqv;
	Wed, 25 Jun 2025 11:29:05 +0200
Date: Wed, 25 Jun 2025 11:29:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH] wifi: ath11k: fix suspend use-after-free after probe
 failure
Message-ID: <aFvBYaTf2SVooUrx@hovoldconsulting.com>
References: <20250624082022.15469-1-johan+linaro@kernel.org>
 <aFpingRwP3foaKJ9@hovoldconsulting.com>
 <43b978a5-c1c3-450d-8340-dc1a6dddc884@oss.qualcomm.com>
 <377affe8-fa88-4ade-9cf8-aaeaaabee679@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <377affe8-fa88-4ade-9cf8-aaeaaabee679@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_022907_959876_BD1C1457 
X-CRM114-Status: GOOD (  15.11  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, Jun 24, 2025 at 09:15:51AM -0700, Jeff Johnson wrote:
> On 6/24/2025 8:11 AM, Jeff Johnson wrote:
> > On 6/24/2025 1:32 AM, Johan Hovold wrote:
> >> On Tue, Jun 24, 2025 at 10:20:22AM +0200, Johan Hovold wrote:
> >>> Make sure to deregister the PM notifier to avoid a use-after-free on
> >>> suspend in case core initialisation fails (e.g. due to missing
> >>> firmware).
> >>
> >> Not sure it matters in this case, but forgot to include:
> >>
> >> Tested-on: WCN6855 hw2.0 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> > 
> > I'll add that.
> > I'll also change the Link: to Closes: per checkpatch:
> > 
> > WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report

Checkpatch is just a tool and it's output should not be treated as
something that you must follow.

Linus reluctantly allowed Closes: to be used as an *alternative* to
Link: [1], but then there was mission creep and now checkpatch has
started warning about a perfectly valid Link: tag after Reported-by:
without that even being made clear in the commit message [2].

I'll stick with Link: (like Linus still do most of the time), but I
don't mind if you want to change this to Closes: for ath11k.

> Please check pending patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=2418079880408c5ae0b2a93f72af044eaff18cb6

Looks good, thanks.

Johan

[1] https://lore.kernel.org/lkml/CAHk-=wh0v1EeDV3v8TzK81nDC40=XuTdY2MCr0xy3m3FiBV3+Q@mail.gmail.com/
[2] https://lore.kernel.org/lkml/20230314-doc-checkpatch-closes-tag-v4-4-d26d1fa66f9f@tessares.net/

