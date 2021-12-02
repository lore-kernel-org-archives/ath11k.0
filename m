Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BA9C433F5
	for <ath11k@archiver.kernel.org>; Thu,  2 Dec 2021 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JO750yjmnKfsNn8F64RNZur0WBHzIh26SAzpp18b7M=; b=fQVKHaIt5b5flL
	YSmNS1UMZn4EsN7Vl74SPBDnN9I29nmASH2RF3MHT1fnoDX2BFqjyI2Ri5dR8D5lz9qazZbroT9mz
	OvKwVCRpRsqlG2wwPl/+9/WJqGtvduDrHN32qp5vMONY++kaNXF98ofELDvTgIX1r4G6s21bmY0Kt
	FXm7qm6E20a5LMDiY6Pd2VdlmjHoFsBjv1+yDVK+xNXghtp8dSAoimwQSlFuT8KUnlCX92bwFvO+S
	wWESkG0IuE15do4mxM80t0iJM3Dy9+uz/OZgD9lnrQaIQsYS9kNJnoqmIVIOyL6Rscy1tWg63rim0
	kibhQeS/EttRFj2SHicw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msnIy-00CcAU-By; Thu, 02 Dec 2021 14:43:24 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msnIl-00Cc5f-I3
 for ath11k@lists.infradead.org; Thu, 02 Dec 2021 14:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1638456186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LUT7ChpLHr4+4yI9EmMSvNvg4fd1GnziTLzfhcjP4bQ=;
 b=Qk+ZoOCtFGBqhia3wZZaK09ebAFimD1gq+NYnoFPglHkmuws3QPB5gaRYeG7k8wGhfjBwk
 vcRBpM+ELS+dW7pTdoBkvCN9fxoIk+nehWV6IDic3n9y0AkLcTHeRUtN8uIuWJJSDISAs0
 ZhmXdLCnCujfxjojJBadRXZcljNM9YA=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Subject: Re: ath11k: incorrect board_id retrieval
Date: Thu, 02 Dec 2021 15:43:03 +0100
Message-ID: <3014977.PoT5AKhg5k@ripper>
In-Reply-To: <1734146.k9CKHTOI9D@ripper>
References: <1734146.k9CKHTOI9D@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_064311_952249_0F6EE454 
X-CRM114-Status: UNSURE (   9.64  )
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

On Friday, 26 November 2021 15:48:17 CET Sven Eckelmann wrote:
> I've noticed that manufacturers of cards gave me various information what 
> board_id they expected a device (QCN9074) is detected as. But ath11k only 
> retrieves the board id as 0xff - thus the ath11k driver is always loading the 
> wrong BDF. Commercially available boards with a problem like this are:
>
> * 8devices Pineapple
>   - 2GHz: 160 (0xa0)
>   - 5GHz: 161 (0xa1)
>   - 6GHz: 162 (0xa2)
> * Compex WLE3000H5
> * (maybe there is not a single one which works?)

Just retrieved the next card (EmWicon WMX7205 - could be the same as jjPlus 
WMX7205) and it has exactly the same problem:

    ath11k_pci 0000:05:00.0: failed to fetch board data for bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255 from ath11k/WCN6855/hw2.0/board-2.bin
    ath11k_pci 0000:05:00.0: failed to fetch board-2.bin or board.bin from WCN6855/hw2.

Of course, the only provided keys (all with board_id != 255) are:

* bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=262
* bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=266
* bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=18,qmi-board-id=266

So until now, I could not find a single card for which ath11k returned a 
board-id != 255 (unless it was overwritten via the devicetree).

> So my question would be: Is the ath11k based board_id retrieval just broken? 
> Or are these cards broken?

Kind regards,
	Sven



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
