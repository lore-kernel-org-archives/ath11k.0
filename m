Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A2BC433F5
	for <ath11k@archiver.kernel.org>; Mon,  4 Apr 2022 17:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyTTCfY9gg7Wzc/yy0nmmk5SqwfHzkK0HT39RAMD6z4=; b=aGPIedXIv/upcx
	RQadtPMqnNfFB5xN82+aYWhLfKuoVJ2DBVFNOzjqEWATM6lRqTL1tVPpprcDG3AZeNLEKRhXsDik2
	/EJi0y3qlYE+mfDMu2bwakZsnKmqKvWnjN3Yd1iKYrvv0oiFzBmyayKfgudt2No0JrA0DH32X2sAY
	zAKQMLuAK36uh3iF1P8GZMkzzuo3VxFDouGQr/3nyQgzY6eFrXsggau1RmJQiJNZhY9qUlzKf/lO8
	ZQPCYz5CjfrDNPEAqtD/gmbCCrJ0RlET3NNn54Hxv53BZdG/GMZ6b6O+UbLl8RLTEti89CuU5vCA0
	QIXtBsUW1E8mogepskqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbQFf-00Fx92-F3; Mon, 04 Apr 2022 17:12:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbQFa-00Fx7F-KX
 for ath11k@lists.infradead.org; Mon, 04 Apr 2022 17:12:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 804AE60DC4;
 Mon,  4 Apr 2022 17:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14BFC2BBE4;
 Mon,  4 Apr 2022 17:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649092340;
 bh=VArUYLLgUbosde1+81GiVTwWc2kxPtVmhn7384CbKIY=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=VIzpKoFY/i/nbeXs9YhlVf117iFOTzYgc6Q73hIvYRBT6KSMrtjrPr+R37PBKL9s5
 9qRGGReabDxOr+4IVbkBAfqafSlHD3Nczo1HIqW/y6dulu1boIzsbi14IbH7ZxIzDH
 ZqVKlkJF3MY7mDne3SkmDTaJEh/Vs3Z/bCNn1s3CLfbkZgnfO4CQQisrCRnsiTRm8r
 yxNnQqMzAR8V54mvXvGRqNeYe0fp69XKdrAQpWr85m196Qr6KPIegj11NRBFPJNtU1
 n60n68Slj/ZLTXWO6Zv6X+pC+hb8GOqO7WMuVpKrrPm1Qm1iFWN36tils7xKMiPOjA
 B1BLrmyOt5vYQ==
MIME-Version: 1.0
Subject: Re: [v5.18] Revert "ath11k: mesh: add support for 256 bitmap in
 blockack frames in 11ax"
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1648701477-16367-1-git-send-email-quic_akolli@quicinc.com>
References: <1648701477-16367-1-git-send-email-quic_akolli@quicinc.com>
To: Anilkumar Kolli <quic_akolli@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Anilkumar Kolli <quic_akolli@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164909233481.29714.6659230438745116028.kvalo@kernel.org>
Date: Mon,  4 Apr 2022 17:12:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_101222_799104_FCC18A0E 
X-CRM114-Status: UNSURE (   7.75  )
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

Anilkumar Kolli <quic_akolli@quicinc.com> wrote:

> This reverts commit 743b9065fe6348a5f8f5ce04869ce2d701e5e1bc.
> 
> The original commit breaks the 256 bitmap in blockack frames in AP
> mode. After reverting the commit the feature works again in both AP and
> mesh modes
> 
> Tested-on: IPQ8074 hw2.0 PCI WLAN.HK.2.6.0.1-00786-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 743b9065fe63 ("ath11k: mesh: add support for 256 bitmap in blockack frames in 11ax")
> Signed-off-by: Anilkumar Kolli <quic_akolli@quicinc.com>

Patch applied to wireless.git, thanks.

10cb21f4ff3f Revert "ath11k: mesh: add support for 256 bitmap in blockack frames in 11ax"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1648701477-16367-1-git-send-email-quic_akolli@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
