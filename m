Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACA7EE49A4
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6apVIveSjhsWBku2vcaX4b8/v3/3Ze3HL4BGUzC57t4=; b=vB5qaGwDt5KObj
	zyxcKIReGJlGr2m5WKh6kfbHymUx8OXJyyi5CNhAbG/wRFxYQvB655FtBr+fiqGTPR8DSTVm51HMt
	QTc3DjYigzqS6zm3CIQxgN3B17Aab9sGsyZLl2SYMKyNrJMGFut0akYVwzuf55bc0Lct1Z3J5niNs
	0Hcc+IoAShA22keXxf0+vXs4//mmaOm0RQhcDuYFgbxvbqNbQiEVoyd7QsVEF1dCwQNT5OjzISy63
	RClY1SK/YEgcF3n/kGev7Z3KD1qsS2r5+sqOyC2kESAIoFa3LiX+lBAoC/9E5+8pFNb2fY4Xuysww
	QUyc9270jq9ng26AKGPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQyG-00FwZO-1C;
	Tue, 22 Aug 2023 12:58:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQyC-00FwYe-2Y;
	Tue, 22 Aug 2023 12:58:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3811465632;
	Tue, 22 Aug 2023 12:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32EDC433C7;
	Tue, 22 Aug 2023 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692709131;
	bh=ouJsox1dbFodWlwTb64apxEwUqHQswiCqUxFBwL0Plg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TjQkRAk5xWRCLsWrlWRCgn/FFZnH2SGAAUBxVWjdJkfQ9zEu8ZFw28GolATRmVlPR
	 CxI40I+WDWoUpx8lyiJ1U8UdB9eFh4GwDa8SvH7kolJtzGeB3Q08hrMzCNt1SUU66N
	 KnXEZ+sVjoXyNYhqktyTCglgA59BDcFMrV2CRnapTrQCE+4/GG+VOnJ0xownMuu4mc
	 ltCMZ+DDtAukOBTowEyArTgJg3tTmt9pAPrY9vZT22xuzXut9mgkxe6+dT/H/W3Ft+
	 8P2LfPJGlkl3lNWRlAOl2RdX5ac73Y9JH1avw2+vQoBZOYNLabbPsrHQTyN9m/q+2m
	 OsoQhclu5QUGw==
From: Kalle Valo <kvalo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath10k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,
  ath11k@lists.infradead.org,  Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH net-next 1/2] wifi: ath11k: fix
 Wvoid-pointer-to-enum-cast warning
References: <20230810091224.70088-1-krzysztof.kozlowski@linaro.org>
Date: Tue, 22 Aug 2023 15:58:47 +0300
In-Reply-To: <20230810091224.70088-1-krzysztof.kozlowski@linaro.org>
	(Krzysztof Kozlowski's message of "Thu, 10 Aug 2023 11:12:23 +0200")
Message-ID: <87jztni67s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_055852_896225_BC8C41CC 
X-CRM114-Status: UNSURE (   7.10  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> 'hw_rev' is an enum, thus cast of pointer on 64-bit compile test with W=1
> causes:
>
>   h11k/ahb.c:1124:11: error: cast to smaller integer type 'enum ath11k_hw_rev' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

ath11k patches go to my ath.git tree, not net-next. But no need to
resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
