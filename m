Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A260BC433FE
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6rYWz2154hWdgdSH67FuPZ8dSGPpONVG6KuZ2x5txk=; b=zYblCpMLfQ+hOo
	pAjX+ubLdrVXRDCOlflqrLC40GCzOIWuTgO0JzdGB+Rw1B8kv34ZDE9lwp2AZiBHp5E7ey3w8IJG2
	9SmHg8alG6ePidt6EmEMZeS8RE7GfEKMgZtBG51/x38RylY+UcCTuHZ91RqaysdPlDB5Xo5dmwBox
	L0tckwglwPKWIYWB8nR2hIQjASg/xaz6KxOQlfLH/6oxHqJZM3Ai2mbqtkxrDdhiWcvqkT5KgWD4q
	CDR+NzFFQ7vNoiaTefe0lMYnfNXxtLOxWoAgh94xogE1bQISS5eM/R7Xinhlu8w2YPjombW21Ff56
	p1FLY0IVPUcxb6Wdw8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiA8b-003e3x-Po; Tue, 11 Oct 2022 07:57:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiA8Z-003e28-06
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 07:57:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6FF58B811F3;
	Tue, 11 Oct 2022 07:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876D0C433C1;
	Tue, 11 Oct 2022 07:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665475032;
	bh=KT5sq3edcE/o2GjfJ7gxMv7B9arG+ekXXZ7R6H/5Ptc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=b8Jas4Xi+AXVNVSekezJpIzYe793eAgmkjHl926oRDPUExsDupvIsVjYQED9yvzQY
	 ObxJ4D7VbdctWznWCS+h8Cq1mrAdasAACwriVQyK4s0odmmeYZGH8CwQR05nN5PzNL
	 k1sw+Z0cBqEpDRy5W/rg+6xdLdGAT6E6xY5bah68kMH6NsvxHXLEvsKPbs9AyDwKlb
	 rn4AsLDRDpsfK26tOZX7+6OzKrBNoFxC3GQ9DV671DImCgLpKTsKih3xsZE+8cNXgH
	 CJ2loFHye13Rss5VPmAL9AuHePQyiDOdwKK27Ip3Y8LS+ueDGt0f5V/B6512wM2p4M
	 FLNwCQdDwVXJA==
From: Kalle Valo <kvalo@kernel.org>
To: jloretto70 <jloretto70@proton.me>
Cc: "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: Question about WCN6855 firmware versions
References: <ozkZDmxXw0zoF9CbOu2CoxEILU4fpAb8udwK4yw-Jgwc1z7zvIZD91zIK0rxq-8vri3WDPztrozKOgZvm4-SLnBvOJoVmg_qr3s47YeckL4=@proton.me>
Date: Tue, 11 Oct 2022 10:57:09 +0300
In-Reply-To: <ozkZDmxXw0zoF9CbOu2CoxEILU4fpAb8udwK4yw-Jgwc1z7zvIZD91zIK0rxq-8vri3WDPztrozKOgZvm4-SLnBvOJoVmg_qr3s47YeckL4=@proton.me>
	(jloretto's message of "Tue, 04 Oct 2022 17:06:56 +0000")
Message-ID: <87y1tmokru.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_005715_206562_F271200A 
X-CRM114-Status: GOOD (  13.00  )
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

jloretto70 <jloretto70@proton.me> writes:

> I have a WCN6855 (hw2.1) card and am currently using the latest
> firmware files from the kernel.org repo which are labeled 3.6510.9 in
> the commit message. I see that there is a more recent set of files
> labeled 3.6510.16 in the GitHub repo for this card. Are these firmware
> files safe to use or is the best practice to wait until they land in
> the official kernel.org repo?

For the end users I recommend using the ath11k firmware files from the
official linux-firmware unless you have a specific reason to update
(reporting a bug etc). That way there's more testing by the developers
before you get access to it.

I try update latest ath11k-firmware releases to linux-firmware roughly
every three months, so it really comes down to if you want run bleeding
edge or not.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
