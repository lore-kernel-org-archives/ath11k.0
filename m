Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93416C433EF
	for <ath11k@archiver.kernel.org>; Wed, 23 Mar 2022 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdUR1QTYA//Jd4x3W7LYPtBCJg5q9Xd/+QcNufP59no=; b=odl6xjQtqJXEbm
	4TVOO0+bkpGbHxvDbsQyfoJljl8B5UCbNlZWc9BVdhr1MQyG0WIWov5yKYcfoV5DuID35CCGgt6rj
	8QJClxHiHk9rOvXQNOknnT34oRYHpAMztBe4rBADYV4ZyL01EwJ2jDvApnuTdCQEXFNZDU5c/teaP
	FNlrekuD3c2gAcsNUH0A5dwDj/SCEkqEJh642TCtDgTrSf/oxDnTYD+e+PXgdg4EFv14KrpP/Nk18
	DrcV8MJowcfUgO14moBs212U6n9BwxOAYafdbcEvcFkm4pzxcuTX8F/gt3xNgXCm+Pg9Ow+LlvLTV
	v0jytCfMk3NOFJycGcOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWwet-00D8xl-J9; Wed, 23 Mar 2022 08:47:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWwem-00D8vg-Jj
 for ath11k@lists.infradead.org; Wed, 23 Mar 2022 08:47:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92651616ED;
 Wed, 23 Mar 2022 08:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40822C340E8;
 Wed, 23 Mar 2022 08:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648025271;
 bh=OtboGfQ4nln/SD/C9db5T8Det9nN39lKrrfx+rNmNiw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=NbOOo/RTSmGtqNlh/1grhsnQ3nXB5UxpSF0P3pyQ2jUt2JjmJs/SsXQbZhLSME/ZK
 3nbUZBWk6Qlhz/CdNbyGfYgVw9PN81xSNJLnfeYH8QnRiyfFS9opIgmgrxE93ldf6w
 jJBBEGGVpod6AGs7iXK+9h0lrP08TkGLB3bRMFlkGnKxlXkt9fctbtBWkUT8/ImnjJ
 YoKaazr1FIOvclckDXAv78kG3Cd0pHneL1unYvE2mybW8BDSYQb1VVqHcv6B9RA5r8
 bgiDZSy0EZpVVbJNH4qr4IGz72YgGTJmToKP+PstTHP8drlKtD5SvlwJcrNEgVjpUv
 7M5moA9GO9ZRg==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] ath11k: add read variant from SMBIOS for download
 board data
References: <20220315104721.26649-1-quic_wgong@quicinc.com>
 <20220315104721.26649-3-quic_wgong@quicinc.com>
Date: Wed, 23 Mar 2022 10:47:46 +0200
In-Reply-To: <20220315104721.26649-3-quic_wgong@quicinc.com> (Wen Gong's
 message of "Tue, 15 Mar 2022 06:47:21 -0400")
Message-ID: <87r16tkqbx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_014752_723552_4FC4BC88 
X-CRM114-Status: GOOD (  10.76  )
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

> This is to read variant from SMBIOS such as read from DT, the variant
> string will be used to one part of string which used to search board
> data from board-2.bin.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

[...]

> +struct ath11k_smbios_bdf {
> +	struct dmi_header hdr;
> +	u32 padding;
> +	u8 bdf_enabled;
> +	u8 bdf_ext[1];
> +};

I was about to commit this but noticed bdf_ext[1], is there a reason for
that? Use of [1] in arrays is deprecated nowadays:

https://www.kernel.org/doc/html/v5.16/process/deprecated.html#zero-length-and-one-element-arrays

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
