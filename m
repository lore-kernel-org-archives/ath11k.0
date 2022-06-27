Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64C3C43334
	for <ath11k@archiver.kernel.org>; Mon, 27 Jun 2022 10:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mwp29SEgZ/sSq2HCgiEzxVyTZ8ot3A6hyqZ9QRnG5Do=; b=ums/zBaAcOOiTw
	QAs5UI5jVsFzglsWyGwE4Eeb0Kj/7xKDXz+2pryPHq9bfPwfskX5yTGZM+N0WxZvHjNUWot+RUNLU
	HdtsXb/2uqGfS9vppArCnWgIro2ASEdhZX2leNg1xHfmwQSJo9WW52+TvBIsJPeOZc2UNZ1BakmtP
	I7u84FWPnj2FMCAd9k7GZIfYLkOePqXBXz0yREtZ6umdwY4tXuE/taIdB+F88+2BMjWiDD8T1meig
	83cDj88EIBZPHLKjLNPKJUpSFbrfxpZkPjeQfgQ+3UkBH9oiG2yKkKANM/eICsid9yav9kjcP/vLG
	T5P/SH3xvOwOR5y5b0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5lxS-0006mu-PE; Mon, 27 Jun 2022 10:27:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5lxN-0006ij-9e
	for ath11k@lists.infradead.org; Mon, 27 Jun 2022 10:27:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3C0B611E6;
	Mon, 27 Jun 2022 10:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F80C3411D;
	Mon, 27 Jun 2022 10:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656325619;
	bh=vjTgWiHh+robp6L83MZ74F5DMaJm4hX3GEkyX/9p/ss=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZwSP23aHPP1I3leRTLNvLo1GAOJZqOl1HOcixTm7IAeczV1M8txQaKNuf1cpTwfEy
	 pU95hRPpxaOFsMjvaBeQa7JsYUJKSSJslYDfZGIJ1E7fz0IrA5lZSxzgIpyyFFbVfN
	 aLOtpAcaAI4f7x7R4hoEIM3XO47OCOYhGdy7N5lBvqOZhtbvHN5bXyCs2lK2udCb12
	 /rBSUfw8JVEH8hDyOdxM3b0UGCDtbDJFWzIaP0oFSVXSTOtcuiU8hL18FKjSsPiRV5
	 f+b6bJ1oOflDlSF4ttcRODc8KaHTcpcD9fI1fIrhMHc25ri4RQBXHdOdpQVhaYJnd8
	 kti9DU8aPeLyA==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,  pabeni@redhat.com,  robh+dt@kernel.org,  krzysztof.kozlowski+dt@linaro.org,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath11k: add new DT entry for board ID
In-Reply-To: <20220621135339.1269409-1-robimarko@gmail.com> (Robert Marko's
	message of "Tue, 21 Jun 2022 15:53:38 +0200")
References: <20220621135339.1269409-1-robimarko@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Mon, 27 Jun 2022 13:26:51 +0300
Message-ID: <87o7yeo104.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_032701_435850_C96E8BFD 
X-CRM114-Status: GOOD (  11.96  )
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

Robert Marko <robimarko@gmail.com> writes:

> bus + qmi-chip-id + qmi-board-id and optionally the variant are currently
> used for identifying the correct board data file.
>
> This however is sometimes not enough as all of the IPQ8074 boards that I
> have access to dont have the qmi-board-id properly fused and simply return
> the default value of 0xFF.
>
> So, to provide the correct qmi-board-id add a new DT property that allows
> the qmi-board-id to be overridden from DTS in cases where its not set.
> This is what vendors have been doing in the stock firmwares that were
> shipped on boards I have.

What's wrong with using 0xff? Ie. something like this:

bus=ahb,qmi-chip-id=0,qmi-board-id=255,variant=foo

Or maybe even just skip qmi-board-id entirely if it's not supported? So
that the board file string would be something like:

bus=ahb,qmi-chip-id=0,variant=foo

I really would like to avoid adding more DT properties unless it's
absolutely critical.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
