Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B2DE88D80
	for <ath11k@archiver.kernel.org>; Sat,  4 Apr 2026 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrAUUNBFgaRx0Iu2dTJhL0HRfbtKyfOr95K7hdH6zxM=; b=jLmVHhhPkMFyjCXetZrsZThh6T
	ho12qkiTGzZtxcPnVD1mrg6fOAnb+J6+/BSRvARUirYqR9JIovDLXX6nSUCngI5h/tHXo0y2h7Lu1
	H8rw4jcGGLojK5DFU06b3f5IREm54PMsp9Z70Khxk8+e8Y4YG9v36cFzylErb5vzRd2atj6f5Lyqy
	mQhoEzLQVLmPXKPa0nODHIgsbvVNoiw/gAZGOOOMwTfmrXhpMTuVUNDK9DrkEPkcmyKEEX0LM3RFB
	NXQdkioETua05Zp76mr0rnWaEG4eqbgRd5mdPA4Zt7Z1MhAFpVkP0ku2SOshr7JEOdhxjruJjMtDB
	7qvNP3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yhk-00000003P2s-0Wzd;
	Sat, 04 Apr 2026 10:58:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yhh-00000003P27-1e5W
	for ath11k@lists.infradead.org;
	Sat, 04 Apr 2026 10:58:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0803C41B5F;
	Sat,  4 Apr 2026 10:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D50C19421;
	Sat,  4 Apr 2026 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775300292;
	bh=M4uUFGPWTsMW+aVafwNZZdbKqmdCp3+dk9lic6nmNNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LbKRr43CdKESFgLQcOwsc8jDyHxZwuDAJyyaikSR4VXxIvxH1Q/ZD9kzYoS/Ineyg
	 EuaWKdeewgkVDuNFIbGw0quKVMOr/JLtbktLQ09PdXQoNxG2CPgEenW7umeDa1uTGm
	 HutqWDM2071LI97/hL1Byljj9A7+c6RMnID0liNCwo9LbQF6xVhA5Rt/CoeKbZxWTs
	 nXVK73PobEhcy96b61kGoWUj4WdH/12SKrLHXOFg/Zrz+5bS+nck71nAIm9Sw9t1Vg
	 bnTti7hhiWoay9lTi5JfMBWVEsAl3UO+iVVEcC0AY7XLmljmq/u0Jxi3Q0ICr0LPTP
	 r6+iZfPeme2tg==
Date: Sat, 4 Apr 2026 12:58:10 +0200
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
Subject: Re: [PATCH v2 2/7] dt-bindings: bluetooth: qcom,wcn6750-bt: Document
 WCN6755 Bluetooth
Message-ID: <20260404-fast-quaint-agama-8afbfe@quoll>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_035813_467064_82154BB0 
X-CRM114-Status: UNSURE (   9.74  )
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

On Fri, Apr 03, 2026 at 03:52:48PM +0200, Luca Weiss wrote:
> Document the WCN6755 Bluetooth using a fallback to WCN6750 since the two
> chips seem to be completely pin and software compatible. In fact the
> original downstream kernel just pretends the WCN6755 is a WCN6750.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml     | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


