Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D9AC77B7C
	for <ath11k@archiver.kernel.org>; Tue, 24 Jun 2025 08:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qF/2TqDtDQ1C1He5ZDDsFMx7oY/Nxq3SWripk0LkMzI=; b=zAPWbJpt64es+Yd1ZuP5JjnnCk
	ShWLM/Opv8iE4YzbmKxPBqhGcJ42yP5ucEwErCq0eYuMo2AO/5ExzZASEU/tr3FYgsj+e0pcz6aHW
	ZNVDk7dvpcqNFnQqxB8VRtfjJfFxnAq3y2dM1J9cCeO4xgp4TkvVXt1dKruF7uLAbcpc8Elmr5NNy
	wENDsKwhJS61cejfnulkponePKotys+SCNwd2ro1EYDioWcDR2kild6uP0eaRzVBf7XVxlNAsBzFR
	lm93JsosOBUHCWc/D5KKf12Obm1qWu+HigEmTtaDnCGkNfy8mr7drAiDKh623HE2aXj+MTD8xtcvW
	tFYuRhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzO9-000000055aW-3Q6k;
	Tue, 24 Jun 2025 08:52:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTz50-000000052QT-2KBR
	for ath11k@lists.infradead.org;
	Tue, 24 Jun 2025 08:32:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C1485C5E97;
	Tue, 24 Jun 2025 08:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7178BC4CEE3;
	Tue, 24 Jun 2025 08:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750753953;
	bh=qF/2TqDtDQ1C1He5ZDDsFMx7oY/Nxq3SWripk0LkMzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxafShcXQIsDd0+CRV9gM6VsU8rGAI/MN95JrKIUDu9Crz0q3c4P+bNq0Tc+XUfTc
	 WCvnMyc+LQIBFCIY+LCj4ct98GSo2KM369SFlKXGijTPJ+x+/Mqp4K9YfTcceePNG6
	 wb2GH882UcIC8SaPude3vGVZ9Y0VOAQhPwNZy7/wiNQYSitR+/HLerQ3JrPweXeg9O
	 j+tmJArYNECwYe1h01GvPaH/lxdEeI9no5pdyWNzdeAGAoEyw6jqsc7pL0eo/OhlMg
	 5ykU5yqciHmxRQ5lMnwyC17duk9jC9Frleho1mVqyuaUGCzA0SNL8NGLaQLl7vi/MP
	 08Uri3raOvA9w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uTz4w-000000005Nb-49UH;
	Tue, 24 Jun 2025 10:32:31 +0200
Date: Tue, 24 Jun 2025 10:32:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH] wifi: ath11k: fix suspend use-after-free after probe
 failure
Message-ID: <aFpingRwP3foaKJ9@hovoldconsulting.com>
References: <20250624082022.15469-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624082022.15469-1-johan+linaro@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_013234_636045_CC0FF0AB 
X-CRM114-Status: UNSURE (   8.02  )
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

On Tue, Jun 24, 2025 at 10:20:22AM +0200, Johan Hovold wrote:
> Make sure to deregister the PM notifier to avoid a use-after-free on
> suspend in case core initialisation fails (e.g. due to missing
> firmware).

Not sure it matters in this case, but forgot to include:

Tested-on: WCN6855 hw2.0 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

> Fixes: 32d93b51bc7e ("wifi: ath11k: choose default PM policy for hibernation")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com/
> Cc: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Johan

