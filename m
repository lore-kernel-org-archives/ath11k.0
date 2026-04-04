Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D13FE88D8B
	for <ath11k@archiver.kernel.org>; Sat,  4 Apr 2026 10:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMvGws667OPRKSGaB/XzvIU7LRy9koFfCqL2tQLl+kM=; b=vgG8R3IJSKjg/Jzl0paHrSK/ek
	xa0vIiMWOdbb2Ch2qqewu7R1hZzaMZY0rxqvxX0nit06yIBNqmj8yWBr7AnkeniFDpZHeoFWyE5VO
	5OMQxHwB/j+ymiSGxZDqUuYdEVJcsvSMtbt58DSX3PqVt2oLemSWtuSJ9xYjMdrtEpbfRnXrD2c9m
	fqdP4Ys3N8zhL6XB4D38z0VMhKD2tJENgpkYbYgl6CL1fMq8PlAn0xQ+adbCg5k8ndT5N/pivzehG
	INBh71TRpdwm3Ux/JWun0wNXlrKB06SP6Om/whagJ+YmkN/O1gExd6NK3E045mFm20EQ4Cj5IUP4g
	0qC3AOYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yhG-00000003OwX-2V0e;
	Sat, 04 Apr 2026 10:57:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yhE-00000003OwC-1cTh
	for ath11k@lists.infradead.org;
	Sat, 04 Apr 2026 10:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9655F43F3A;
	Sat,  4 Apr 2026 10:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A9AC19421;
	Sat,  4 Apr 2026 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775300263;
	bh=hbrkyKzyYh2RUSekpQ2Vk/cdjhZ/Anu7DtnZZOV6zrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPcy+9Lc3ZxOGyiROZnJsx0Qj9fT7tDtdhPAFXny6/OP9RNQrouARYmiKFmbp4IGg
	 LapD6ojiXaKj/cW6v1aQ1/okwZT8fEwwSMXzbISvER5R5ws6Rz/H0hvmgCBXXKYv0S
	 qkxP/UIq2hqBjy6KZXLzoevfMl19QGvcRcsOnLfIGjJPK/OM+CfvzqoA1PTZ2G38sP
	 g+2VoUlljpELj1RAt62FVWtXdTVW6+mAJzWWCYZ+LyXXKQ1fWJwnxn6Ks8X84e6Cpe
	 XBiXb9wirS0awPsBsy3cBoXOdeovYDmWDiZStwBYanQ9DWbVQUXaHIjRzii7swuvd6
	 LSJ5dIqDP4KCw==
Date: Sat, 4 Apr 2026 12:57:41 +0200
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
Subject: Re: [PATCH v2 1/7] regulator: dt-bindings: qcom,qca6390-pmu:
 Document WCN6755 PMU
Message-ID: <20260404-lynx-of-extreme-chaos-1aa3f5@quoll>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-1-393322b27c5f@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-1-393322b27c5f@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_035744_467342_4C480C11 
X-CRM114-Status: UNSURE (   9.83  )
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

On Fri, Apr 03, 2026 at 03:52:47PM +0200, Luca Weiss wrote:
> Document the WCN6755 PMU using a fallback to WCN6750 since the two chips
> seem to be completely pin and software compatible. In fact the original
> downstream kernel just pretends the WCN6755 is a WCN6750.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../devicetree/bindings/regulator/qcom,qca6390-pmu.yaml  | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


