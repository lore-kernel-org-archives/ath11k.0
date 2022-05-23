Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6352C433EF
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 19:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlaiaeV55FCtpFYAllXZe6ycSTxwTqyToc244WLGv9o=; b=qeCQ8nL7lvOlsl
	gAgffazCY2JCKW1WfU896x6PqeGCQC00LI7KDW+obZCj1QDnrUppIaDaMlBiNdxzpz1wpYLCTEpb4
	fe58nm104HA8Zm7yWMFygLLwMx0VyzuJ2hNGAqfstQofCVrwQZxg+chMH4TGnTtDH6NbEFKgmEqEb
	zvYCBsWR0UF6tdohh176DwnbaUBha/v5P4z5hN0WjxK3X/reKU+e2SB/7gsmv79CCN0W7/I39RRC7
	2CNvlljcVjA09ah2HNcoqxwqK7ElIc19/7lvm2Om6XhEdJPebEFDSHELg6uO93xvIbB+tPUL4kK06
	gN+P2Vuzed1yAuht8m+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntDOB-005eSE-A7; Mon, 23 May 2022 19:06:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntDO8-005eRh-DK
 for ath11k@lists.infradead.org; Mon, 23 May 2022 19:06:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94F0961261;
 Mon, 23 May 2022 19:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5411C385A9;
 Mon, 23 May 2022 19:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653332803;
 bh=AumV0nZ46LzfW6RXeTCbFojukMPLFQlCkqhJHUS2YwU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=GLJxwzi9LxJhx45hJBXTRHgfOZVf/HA3FeAK4t+rf+pSo58j1gvuNgjCX/pxLTJ1q
 LOT/S28vgbFIiXPvpWfc0rTLET+gNuvk6iC/mOFLCtqCbvNIu1ZSO3FryOLeu/lvYr
 46vEtDK9eOULBQdJjJrp2yk4rFhfF8eSNRWsLF22orHlVqZAP/58dLEw9XMW1kQOhE
 o6/CFcQp+BOyn6oQnCg/lahg60zUi1ioc6vYhn6DRNCYVCH6Ft4UKoKHKB46jdNTL5
 2TM+q9C4IGBtBHx66hfo2u2KwMYOU2GTKY+FiMwQKJYaOUvGNLijdQ/00e0BSTZPI3
 miC8EwPOquALA==
From: Kalle Valo <kvalo@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] ath11k: fix netdev open race
References: <20220517103436.15867-1-johan+linaro@kernel.org>
 <YouezMIwm3PYxOKY@hovoldconsulting.com>
Date: Mon, 23 May 2022 22:06:37 +0300
In-Reply-To: <YouezMIwm3PYxOKY@hovoldconsulting.com> (Johan Hovold's message
 of "Mon, 23 May 2022 16:48:44 +0200")
Message-ID: <875ylwysoy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_120644_527238_13E21113 
X-CRM114-Status: GOOD (  13.30  )
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

Johan Hovold <johan@kernel.org> writes:

> On Tue, May 17, 2022 at 12:34:36PM +0200, Johan Hovold wrote:
>> Make sure to allocate resources needed before registering the device.
>> 
>> This specifically avoids having a racing open() trigger a BUG_ON() in
>> mod_timer() when ath11k_mac_op_start() is called before the
>> mon_reap_timer as been set up.
>> 
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>> Fixes: 840c36fa727a ("ath11k: dp: stop rx pktlog before suspend")
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>> ---
>
> For completeness:
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Thanks, added in the pending branch.

You submitted this as RFC but do you mind if I apply this anyway? The
patch looks good and passes my tests. But I do wonder why I haven't seen
the crash...

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
