Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8102C41535
	for <ath11k@archiver.kernel.org>; Tue, 19 Dec 2023 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Pi88xyH8kQC4tA2hOL285xZ0b9GiOwnryVmWuCpvYU=; b=lyUuF84P3Sd68saGs/tgNKNpBb
	3Ep5qVU2664VaCkoS8w1rw1YdQGHpQU6RXwkI3X+HrkmzarhNtmoBXVXNodZtgWdbfjTtVMsYprkI
	PbJFh/Henx5m8s/g9MwWNA6lD6nWsO8v5cbWxG/MUJZbnfG8jiGrx/4vGC1bwD72rsNNUeQsBV0M+
	+FNx7t0ha3+XL98DbvFzBfdlFuxIGnr7J5erYZhxXwqlPIXt9644sZX+gyoDJMUdcEAJZcvqDrmLe
	Qt71/LCqR9uKOzEMOmtf1HPe35GuAydNFtnLgwHcQLCDG4Vn+R6wrMN+SljYVIXzS8kH8b3nlz/Sk
	qi0Zdl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFelg-00FC1e-2h;
	Tue, 19 Dec 2023 18:24:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFele-00FC0j-0V
	for ath11k@lists.infradead.org;
	Tue, 19 Dec 2023 18:24:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EC637CE19BD;
	Tue, 19 Dec 2023 18:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46964C433C8;
	Tue, 19 Dec 2023 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703010268;
	bh=jRAZdnaaVTi2KgSnKBcf8uT0X3s4ufbNWJviPiLm2Mk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jHAmqfcsGm8ICBikWzyPbOY/YwSf1XEni0rNq9zjkvjN2cwVoLgOyr68ReLYHrcg1
	 blI51LGsqjY3DhE16X2QAUOFDwz83ckn/gG/jec58M+w+//7bd5LysOb0Y9vSQ9pSd
	 7bwHbItmkZ2T+Zz/hD4WcIX5pDQA51LvBOjjoYCssIlGG3j0gyJ83Z/AOy7Rzk+hz0
	 XDJ7QZtA/vcZY6Be5zxiFl/YayBbpihgNyM1eJmrQstwJFU3iZMgtp18iuSAGq9YEi
	 pMvs+X1EyT27MSXRyuakJvDownClPjM1KCH0D2tP86CmlhXeswGqFqJjqeBnLL/nKc
	 yBbEKDHUNqaZw==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>,  ath11k@lists.infradead.org
Subject: Re: Ath11k warnings, and eventual phy going away requiring reboot
References: <ab00ff77-23de-43a1-9eb9-6ac036ab80e3@gmail.com>
Date: Tue, 19 Dec 2023 20:24:25 +0200
In-Reply-To: <ab00ff77-23de-43a1-9eb9-6ac036ab80e3@gmail.com> (James
	Prestwood's message of "Tue, 19 Dec 2023 05:51:24 -0800")
Message-ID: <87edfiqcdi.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_102434_444291_82152374 
X-CRM114-Status: GOOD (  11.32  )
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

James Prestwood <prestwoj@gmail.com> writes:

> I noticed this after one of our devices dropped offline. The device
> had roamed 7 minutes prior so I doubt that had anything to do with it.
> But then we get this, and then tons of warnings. I'm happy to provide
> full stack traces but its quite a few, not sure which ones are
> relevant or not. After all the warnings IWD got an RTNL del link event
> and was unable to recover from that. It seems after that ath11k tried
> to power back on but failed.
>
> This is a stock 6.2 ubuntu kernel, WCN6855:

BTW I don't know how it's nowadays, but back in the day Ubuntu heavily
modified ath11k. And we can't support distro kernels anyway as we don't
know what they have changed in the kernel.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

