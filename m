Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AAAC04FF8
	for <ath11k@archiver.kernel.org>; Thu, 18 Apr 2024 15:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mAEURmz4d1+sLaWuNAi4xBgWo+xPNax3CENc+IBRLk=; b=gmIipi1Ym5sUIW/CVnD3l/Nn0c
	YNXTgCHX0Y3CAtsorBHadzBP0EUOGSZdJ+mPyO7gCz42MFYoBBv7e2Zb3zJugCtttV6x7SsWqwiXb
	x8VzoQ4tIbY6aNIv/8CBh8olU7w4ExiZmz93zyWLuF6DUThPzE0LQJ0vB41ASz4ShWDFuOjS7qd/J
	TtnmMmIP5PBVpJ86j43DO5yND6dRqbExbEye3JMd7TP4uo9vUh9601iu0QuMOk+3TzYymW1tQgVv/
	bmkCwLEtIzWtZagNTPUUxy5ChTqgTVz2f4BEDEKnHer8NKFjWL8dTnRhGZocrVKfEbGPz5aqAaOPx
	Jm6b6JQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTXw-00000002lTu-0agF;
	Thu, 18 Apr 2024 15:19:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTXs-00000002lTN-1Vos
	for ath11k@lists.infradead.org;
	Thu, 18 Apr 2024 15:19:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55B9A61788;
	Thu, 18 Apr 2024 15:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FB0C113CC;
	Thu, 18 Apr 2024 15:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713453566;
	bh=/m88cFY+sszGDVxvUiNXiACTSqHBNqQZiJLjJ0y5k2k=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=K0sWNa9Bk2ceR6Kb7RYjPXgvqXWm0UkYxC8L7sOtDEIbREpV2Gp7RLlGsRV5k9RaC
	 ++QOO3xj4aXywwtMx5mu7wQy+JBG15VC5r7/EXeiEHrt7YobDffBtkJN6FZ6pxI4Ii
	 p6U2GJEDTw2v1KsCuKiAjsaUlOiNV8IjO/zEIvtyZWlLGfV/yogBQT6MhEF3TEUp0d
	 mps7gpAj5gEH48Iyxn0L2X4JhapoSrCgIvIzVR1Ru6UPJlmkKb6F4Ek+q9qEUQLNhg
	 kSa6E5nF43ErGOzN3aeO6AWP+XWD4bo83piXoITvH81RH/irMx6oDB09brtu2UjTok
	 vnsFZGjfSXfWQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] dt-bindings: net: wireless: ath11k: add
 ieee80211-freq-limit property
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <fc606d2550d047a53b4289235dd3c0fe23d5daac.1686486468.git.chunkeey@gmail.com>
References: <fc606d2550d047a53b4289235dd3c0fe23d5daac.1686486468.git.chunkeey@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171345356303.934743.10571401233268486603.kvalo@kernel.org>
Date: Thu, 18 Apr 2024 15:19:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_081928_478901_465639F5 
X-CRM114-Status: UNSURE (   5.77  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Christian Lamparter <chunkeey@gmail.com> wrote:

> This is an existing optional property that ieee80211.yaml/cfg80211
> provides. It's useful to further restrict supported frequencies
> for a specified device through device-tree.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

30ba0022b30a dt-bindings: net: wireless: ath11k: add ieee80211-freq-limit property
43528ae9d9bf wifi: ath11k: add support DT ieee80211-freq-limit

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/fc606d2550d047a53b4289235dd3c0fe23d5daac.1686486468.git.chunkeey@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


