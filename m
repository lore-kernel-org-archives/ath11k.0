Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ECEC4332F
	for <ath11k@archiver.kernel.org>; Wed, 22 Dec 2021 05:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7NV9dY7p4EtZCgv39wSRKnZNje4FtQ8+mrVJaYwED8=; b=TD4l9sCti9/9NB
	gIWy+bvYazS1C0QpIH5/7q096n788rSgkmCd10hrB3ItVF6PkVXCpqs1en/9GJS3bDXYFjE4DY1ST
	7ya2z6tWQMOJWAKCga7Oe7WEPnmP/g4NjRiAMlbQymf9C1ZwW7qwBUQ0CCRpvLK7o7ciZqtG7v3c/
	Ya43ouk6CJ/oGlyHl5lYW7g7Aw3df+6j4Rj1RPxBajqWvkW0IcH0IVYoij5kv51QwC0j/ZT1jW6ZF
	ReH5nyUa4wpFY5ZkqxockOaNpHS0czbuyguEGr9+hO2dbP1ehRwiYxQK8xxd1tY9wL8d1BWKFVy3A
	rTb6B1DPsO9NMVZweb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzue4-009HsR-58; Wed, 22 Dec 2021 05:58:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzue0-009HrB-IV
 for ath11k@lists.infradead.org; Wed, 22 Dec 2021 05:58:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FB98617ED;
 Wed, 22 Dec 2021 05:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CA3C36AE5;
 Wed, 22 Dec 2021 05:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640152711;
 bh=wnlIft/x8MQVyWtEN2wWau7s4XRbDvMYu1vn3YB2FRM=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=o/SrgoS4/pTFvVm+Se4UuTH/1lbIIzvij/bYJZLa4Qy2dYpRGVcRVfjnf+5rYA5jC
 +lVzDXJ1NfgIYSxeeewAklW9oyI0NPkVBz7NVeH/aADuecgA7fzpTyEy2Xuc+snV+p
 CNQemUnHxWmq3V4Uc5Avj6SHKWET4BEFWtdhTUZ/+B7iS9XBqmZajH7iqi9A9FglKa
 bn1+9SnVzX5dS4NXZHCht5E/5pFHzvETXOImFyMwuHnYkadic7ApbLmpqAHSqQt2my
 Vyt/CMwitnkp7syivA0laXQefUAK+g6u5UHg3gdcWA4sl7dmUv4Wmq/9eNv38iEL14
 yJqAsP/1w7pDg==
From: Kalle Valo <kvalo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, luciano.coelho@intel.com,
 nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, johannes.berg@intel.com,
 emmanuel.grumbach@intel.com, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] codel: remove unnecessary pkt_sched.h include
References: <20211221193941.3805147-1-kuba@kernel.org>
 <20211221193941.3805147-2-kuba@kernel.org>
Date: Wed, 22 Dec 2021 07:58:26 +0200
In-Reply-To: <20211221193941.3805147-2-kuba@kernel.org> (Jakub Kicinski's
 message of "Tue, 21 Dec 2021 11:39:41 -0800")
Message-ID: <87o8592nb1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_215832_685932_C70D3D6C 
X-CRM114-Status: GOOD (  12.68  )
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

Jakub Kicinski <kuba@kernel.org> writes:

> Commit d068ca2ae2e6 ("codel: split into multiple files") moved all
> Qdisc-related code to codel_qdisc.h, move the include of pkt_sched.h
> as well.
>
> This is similar to the previous commit, although we don't care as
> much about incremental builds after pkt_sched.h was touched itself
> it is included by net/sch_generic.h which is modified ~20 times
> a year.
>
> This decreases the incremental build size after touching pkt_sched.h
> from 1592 to 617 objects.
>
> Fix unmasked missing includes in WiFi drivers.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: kvalo@kernel.org
> CC: luciano.coelho@intel.com
> CC: nbd@nbd.name
> CC: lorenzo.bianconi83@gmail.com
> CC: ryder.lee@mediatek.com
> CC: shayne.chen@mediatek.com
> CC: sean.wang@mediatek.com
> CC: johannes.berg@intel.com
> CC: emmanuel.grumbach@intel.com
> CC: ath11k@lists.infradead.org
> CC: linux-wireless@vger.kernel.org
> ---
>  drivers/net/wireless/ath/ath11k/reg.c               | 2 ++
>  drivers/net/wireless/intel/iwlwifi/mvm/ops.c        | 1 +
>  drivers/net/wireless/intel/iwlwifi/mvm/vendor-cmd.c | 1 +
>  drivers/net/wireless/mediatek/mt76/testmode.h       | 2 ++

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
