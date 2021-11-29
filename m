Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00305C433F5
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gVyKXQJbnwyw18WqUWr+1NgdEGcM/U8MRUPrx/oZcg=; b=ksgbw/NYGXBj+6
	FWhfmulQB0U5tpnpBFrjc9STCIbkXvGhXWSWFwEeUOeBXBBkSo55szsfMsmdUJrotLHVhKAbXZ4CR
	3Le6sEAG0yBqJzIFt0meK0o6B9GxkHqtiSoDeGJQ+tkApFhOa7VCmycv8I/s0+O3TUhUfxKvT9+E0
	zQAp4umU14ybfbwN7g2y/hdbIaE1980xn8OpS7bYYhePGQD79Vq8dUALHAZvImd44bDpVAYWk9rZZ
	76MfNBaj0urOKnjVPYosVr/T0vdUiYQSrbMm0vcYJ6Oh4krWecV7bsmbfn6dGl1fY9EwR8PUIkuEJ
	//uK6wxUkAJrdYdNAFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrkJe-001ZxT-Cy; Mon, 29 Nov 2021 17:19:46 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrkJb-001ZwP-HR
 for ath11k@lists.infradead.org; Mon, 29 Nov 2021 17:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1638206382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjh+7gQcjvRHk/gEg18M3Wu+t2CuN3mXNFh1e4sXosI=;
 b=L8i4/DWad/Wmfx5IjzQqAQUlCuMQdoQqqp8bB6rzFSQgzV/enzbG1shkoNv6V0C2f59Gtn
 kcvueD11ueSzRqB6gGVE7kqrZWp8OJcCZQc48U1Vu+Vu0/ZAtuCr7ok4qrZTKu3j0chOEM
 Ulz5PbKwyed6yeiyhWXAUhR9BG7jxX8=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Subject: Re: ath11k: QCN9074: Incompatible board-2.bin for 6GHz
Date: Mon, 29 Nov 2021 18:19:39 +0100
Message-ID: <2340060.uFBqQg8s0L@ripper>
In-Reply-To: <2091899.pNsEtq2SQc@ripper>
References: <2091899.pNsEtq2SQc@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_091943_736868_3BDF12F1 
X-CRM114-Status: GOOD (  11.99  )
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

On Friday, 26 November 2021 11:52:42 CET Sven Eckelmann wrote:
> I found out that this is actually caused by the BDF. If I've extracted the 
> board.bin from the TIP board-2.bin [3] (which seems to come from the QCA 
> ATH.11.4 CS release). With this version, it seems to work fine. I haven't yet 
> found out what the relevant change is - but if someone has hints then this 
> would could be interesting for other devices which should be added to things 
> like OpenWrt.

I had are look at that for another board. And I found out that they changed 
the size of various sections in the BDF and moved stuff accordingly. And the 
one in Kalle's ath11k-firmware repository is even using different IDs. This 
caused the ABI breakage which John described in the other reply.

No idea how the firmware is supposed to handle this. At the moment it is only 
clear that it didn't handle it :(

Kind regards,
	Sven




-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
