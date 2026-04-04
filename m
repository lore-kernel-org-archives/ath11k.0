Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680C4E88D66
	for <ath11k@archiver.kernel.org>; Sat,  4 Apr 2026 11:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7hRgjvn83QS036K3EDyawenYBhuwA5VXG36T79msfs=; b=STfiGeGGV9c294CIHHVk2rlDih
	Jse6JHA5XMMBUbe2ATx0AKJCNJyYgpAjaDTp3Kz+is4toZfVsQ1DvnCKuEr71VAuWhc+aH8J/zBeQ
	9FUzyPeB9RgfONagiAV/VM31y+qXF0PkQhO8N7zuBnHD6Q2tt0LwUboHlPrfshmQ21L3UwWOganNe
	fA/Lq3t8O59dIycuC4e4nceIh/xHQjjrWGvJd2eKmonR09DT+V/uaxMiLjRxIwBHsXkzU6ZqR1T1O
	3bR8kB6JwyodtYArobJzfC9yjY5nyJnheO2Rot2AkzuaW6Yh4BHSOZgAcSAwGPnAI6keILEnimOty
	xz1U3tww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yn3-00000003PM4-1nEU;
	Sat, 04 Apr 2026 11:03:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yn0-00000003PLX-1oPD
	for ath11k@lists.infradead.org;
	Sat, 04 Apr 2026 11:03:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA3CA416C7;
	Sat,  4 Apr 2026 11:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B5BC19421;
	Sat,  4 Apr 2026 11:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775300621;
	bh=6St2+FWQW6l2+yulRPhL9B9LaFWvnweTQb8aao65BJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LlNyJzEP1vCy3VsXqvb+qYWW7ZgAAcWmqH3alo3kX5XyniTbUiC/P0mDfU/ml39KV
	 0bOSX5o1nV5jSsW3IXO9FT/REUxr+KXeBtDRpTjuZkw7/77HI04blC8qRB5T2S13nJ
	 dDgveJhRGnQ/4gyG9p2PLkN0UUEON9oS/fh764MK3IL2wt6ehQsFhK6+IX7BABewy4
	 3pEl+awEVmsfviM7h3WUMU1n5tz8UK+hZMbnkQnKRUjRciQ7LL9LdfathHb+BrLkM1
	 eM467LdIvq2ZKSCC5xLOH3WalCvBVkE93O1MValbuQh+qOmgjYS315D+J1ICMy678L
	 batJXhfwJvgzw==
Date: Sat, 4 Apr 2026 13:03:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Koskovich <AKoskovich@pm.me>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 3/7] dt-bindings: net: wireless: ath11k: Document
 WCN6755 WiFi
Message-ID: <20260404-sceptical-benign-chachalaca-e13aa9@quoll>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-3-393322b27c5f@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-3-393322b27c5f@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_040342_486968_46386C0E 
X-CRM114-Status: UNSURE (   9.78  )
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

On Fri, Apr 03, 2026 at 03:52:49PM +0200, Luca Weiss wrote:
> Document the WCN6755 WiFi using a fallback to WCN6750 since the two
> chips seem to be completely pin and software compatible. In fact the
> original downstream kernel just pretends the WCN6755 is a WCN6750.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml    | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


