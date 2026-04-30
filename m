Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CB4FF8873
	for <ath11k@archiver.kernel.org>; Thu, 30 Apr 2026 17:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkMkJeCvk15dSYi/y7ASOb8Uh/gzDllwNiyZtdoykdI=; b=a8IvMbRcQXOineZUX/PagKvdCi
	RLi075h2cMaNH3jF9OB7vrZObDCLG62wrKM12NHjEzWuD7R63T7wo78N6sBDl18WZwIvxXRsz6OTb
	NrZntlLZEcy1ciFOd61cK7jMyEa0wbD1JeWs0NYQC85XsylUVkSuxNq7uoNx5xWIg0fcsVgc84FbN
	DZANVuJZFg4F8qHwvU0YxJbgF5Fc+3yX3dVje9OeQ0Lri591XluDy0PR9IW4YQx0hlfkwAT8xzyXx
	xdsKp/zimYb/DwDevFbWVmdDXiTfAtc2Uhjb25r+BG4ehzJF3NNR2k4TxrfMjkJ+Q71opBlPrK+TT
	T19VfHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIVcm-00000005o2O-2H8w;
	Thu, 30 Apr 2026 17:56:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIVcj-00000005o1b-2Jzq
	for ath11k@lists.infradead.org;
	Thu, 30 Apr 2026 17:56:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4295C43E4A;
	Thu, 30 Apr 2026 17:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7F7C2BCB3;
	Thu, 30 Apr 2026 17:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777571787;
	bh=bxJhILJOj52ikSwAlpqvCXweZKZMwSWKG7xehCSproo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EnW8loyDS+MFh9w1Z8tgZUxJJgHEupnAfw00NSjwn9rJL9EmNSfwcnkp6XsHz39Rp
	 Fi7xE1lr1xiSz6Me0DCRM0xiw9owT6ttmYSQ0bs22vCtCEiUOFamgkcOUks48jVjxl
	 HMx37kydLKviLYJfKsv8L9IEmrJvopNxlWPqaWrPvdFWY7SiA12CvyGl4y9f7YHsdx
	 c5hpEnT9/LxEXfJ8lWaHSGMA0/s/usUCwOMuzCU9GtlCtviNlJopTlNxhQpjbS+3cV
	 zfGz+w5er68eozEZBXR2zV1V5ZP3UDs7EYMiS/juDxNDH95MD4C0RwR3nbthmEq3Z6
	 sE97C0G75clVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EE7380AA62;
	Thu, 30 Apr 2026 17:55:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/7] Enable Bluetooth and WiFi on Fairphone (Gen. 6)
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177757174129.3109994.12376905026107591695.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 17:55:41 +0000
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, AKoskovich@pm.me,
 lgirdwood@gmail.com, broonie@kernel.org, brgl@kernel.org,
 marcel@holtmann.org, luiz.dentz@gmail.com, quic_bgodavar@quicinc.com,
 quic_rjliao@quicinc.com, johannes@sipsolutions.net, jjohnson@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_105629_616845_1418938E 
X-CRM114-Status: UNSURE (   9.82  )
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

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Mark Brown <broonie@kernel.org>:

On Fri, 03 Apr 2026 15:52:46 +0200 you wrote:
> Add the required bits to enable Bluetooth and WiFi on the Milos
> SoC-based Fairphone (Gen. 6) smartphone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - Drop applied pd-mapper patch
> - Add compatibles for wcn6755 with fallback to wcn6750 (wifi & bt)
> - Rebase on linux-next
> - Pick up one tag (discard the rest due to addition of wcn6755
>   compatibles)
> - Link to v1: https://lore.kernel.org/r/20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com
> 
> [...]

Here is the summary with links:
  - [v2,1/7] regulator: dt-bindings: qcom,qca6390-pmu: Document WCN6755 PMU
    https://git.kernel.org/bluetooth/bluetooth-next/c/b043657c35e5
  - [v2,2/7] dt-bindings: bluetooth: qcom,wcn6750-bt: Document WCN6755 Bluetooth
    (no matching commit)
  - [v2,3/7] dt-bindings: net: wireless: ath11k: Document WCN6755 WiFi
    (no matching commit)
  - [v2,4/7] arm64: dts: qcom: milos: Split up uart11 pinctrl
    (no matching commit)
  - [v2,5/7] arm64: dts: qcom: milos: Add WCN6755 WiFi node
    (no matching commit)
  - [v2,6/7] arm64: dts: qcom: milos-fairphone-fp6: Enable Bluetooth
    (no matching commit)
  - [v2,7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



