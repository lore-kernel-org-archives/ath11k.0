Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAB7C433EF
	for <ath11k@archiver.kernel.org>; Mon, 10 Jan 2022 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIIewAV9f4n+OPbujmOMcYRavUx8FVt6yKJSrffG5XE=; b=vkYGLqN5/6AjMa
	uW/0twKGQxFCdVi2XuC6GIrOn/wcFoO2OP2NwkMzupuRwQmvMPaEk9FU72frm6muvpRg/swDXyWOy
	nrUgkoZhSk3Bz3iZYQuDwFe/ikcCpuKz/ygzi5zWAgtQ5wUlN1LTUCRL2S+8PGEW5cw59uAVNOp9v
	UcRLkK1pJilsQeHbFS14Nny/QmZxllMtHIlthkDILvaSHRaFlH0fOUb5TV6Bz4kEr7rBRf+zIL4IL
	B8iD/fg1iuJtuL8m3EY8SVIm7/uIZ3LJJj6GQP0coHKDHuYd2L63N254DDJEhWcDSH8gxds2ewD+8
	xdZAxJCgp83TTY/emeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wXs-00C3DG-Fb; Mon, 10 Jan 2022 15:25:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wXp-00C3CE-9I
 for ath11k@lists.infradead.org; Mon, 10 Jan 2022 15:25:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9B41612F4;
 Mon, 10 Jan 2022 15:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4AAC36AE3;
 Mon, 10 Jan 2022 15:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641828312;
 bh=/VJ0Cw9FTAg5mzrYqiIHk7lGMB7zDTv+ZFsf5A3LoBw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=GtH46hOCSkqYrTbrRYK6dH6CPvcVosVpYg5OBmSi6F6nDB+iitmXMuA899Kr2bZZc
 0k+fQ6/X/ctfp2G2Zt2NAKTUHi2vPxKl3OD2Pp2SFrMNBZh2SBli0RIfDD5bSc4Ykl
 4ekSfu3K6D6BdonnZl9TyTu8CKLzbKkWxgov7qPl8c/qu15xJ+IGPHfs6CU61DxaXY
 qhWzelmC7qGwVouNwR6fwSRz0U2gRNH0r+5IfnjOTCIW51cmu52sF5bBZ5mk/dBE8x
 FjPNSKonsFyytiw2bHN+a7KXEWTEPRRc4uvPqxK01BoqqRb8/Rx5iSjUZTLyBgN02w
 1ROTxPlFzbBRw==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 00/15] ath11k: add support for 6 GHz station for
 various modes : LPI, SP and VLP
References: <20211224085236.9064-1-quic_wgong@quicinc.com>
Date: Mon, 10 Jan 2022 17:25:09 +0200
In-Reply-To: <20211224085236.9064-1-quic_wgong@quicinc.com> (Wen Gong's
 message of "Fri, 24 Dec 2021 03:52:21 -0500")
Message-ID: <87h7abvciy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_072513_399377_5886F6A0 
X-CRM114-Status: UNSURE (   9.69  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> v2: 
>    1. change some minor comments by Kalle.
>    2. rebased to ath.git ath-202112220603
>
> Depends on one patch:
> [v5] cfg80211: save power spectral density(psd) of regulatory rule
> https://patchwork.kernel.org/project/linux-wireless/patch/20210928085211.26186-1-wgong@codeaurora.org/

Please resubmit the patchset once the dependency is applied, I cannot do
anything before. Dropping the patchset.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
