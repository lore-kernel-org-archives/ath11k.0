Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6937F46C4E
	for <ath11k@archiver.kernel.org>; Mon,  6 Apr 2026 15:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyaQcsOWY1uHlnDlYnCy5afcawsocc3R22w/Q5XTUhA=; b=psmXvYTvOgMZ/oJgKK1nH6N7gu
	dgzfQUlgUzQXK2l7dmbxtfD2KX5bkYs9vVtMcD2VLIRAutWMIthYbTjr3pURBshi5N+POcaMPEI3p
	aljWHe+GoG8cPprMCsUc/7Lj0v5W62EP7x3C70FIqLT/kr49CTBI+4G7nxgxXssPeEV99CS55HwIp
	bQPo4t/9BN55fIjMdhEm9fDUc8z0p1Ldsxw2AznpXWxbcDJlS+BYsqyHK7LUMkByujpmie1Kh0Dnh
	/wJPpe0HnrBZv4pZWipoEFiCgZ8sMazXkGFeis8VioXTW4GRghQ9Cnyn+UfAbSPQJxYDUHcW6oeDY
	dD69QcHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lmv-00000005GDq-0Vn1;
	Mon, 06 Apr 2026 15:22:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lmt-00000005GDi-08Qf
	for ath11k@lists.infradead.org;
	Mon, 06 Apr 2026 15:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FA3560123;
	Mon,  6 Apr 2026 15:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9718C4CEF7;
	Mon,  6 Apr 2026 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488969;
	bh=iC5RuUkjr4YheJjq+5kXm0uCQrLTCZePxmO0UJuDLJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vFbjQkjDICQPatHELDGaZzMGsOG7IMqZS8Nx0QZ7vwFj+aO7qSZLsXOzn/2N3Aj8P
	 GQaS+U+vr2nDy11N5l6FpMnGTPxVQCPaO44HkAA0aJr7qr1c6F5Nfjt8wEOGHEdnaG
	 uvklpS8YoFvJ8yZ4D9kHX5qNvlrRjscjnj6mvcxJIR/OHxiuHuUTfNloMmaxYvV1hs
	 p9NclkJ/ClxVwPY7sllotz/eUaHLFeDjYUhXB7y9xDxfCsmLWmVlApD9hr+Nsa2eDI
	 rE+YsIJ/4bKRYOWBWiKAMG5g4+q2szxGIIDSDYo+GQLzupJ/idfiqks9ySg9L9GvoR
	 THwzn+tommHiQ==
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
Subject: Re: (subset) [PATCH v2 0/7] Enable Bluetooth and WiFi on Fairphone
 (Gen. 6)
Message-Id: <177548144839.46304.13972601101594073712.b4-ty@b4>
Date: Mon, 06 Apr 2026 14:17:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iC5RuUkjr4YheJjq+5kXm0uCQrLTCZePxmO0UJuDLJI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp08/EHCSvABc5+hfj7LywcFO5vIyiMIyPbeR7h
 ppJ03irVwuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadPPxAAKCRAk1otyXVSH
 0KVpB/9S4D+rqQdrlGK7dDEaMH4ZQMEuGOMsBF05rICalPIeS+4HrqIdPQlTVFXQS+2FvhlW2v9
 05Q1bZHOQZs52JJs+bbrwIb+9HnsD4fm4Fcq/CwxMBFfcb3D/8Uh7op9NLC9TMkaPvIlEyMVD4V
 2eZIcjoyQ3ZyIsPzOqGIEKPo5UdI+TQyvmwOYnNcJ7Pg/Ft7ElkHEieBdQ7gR8SjyUegXQSAXNJ
 Lklhvvjd7b4qNJo6F8BDqvjelJFrUH+BSDJI63aYQTuDG5KvMSdQqyGFYjyO6PyvaEmtsmtpWY1
 OBo9Osy1m0mMXQWQCHFcbL50CpXYNDkWKuhxF3yLVZDqBqGq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Fri, 03 Apr 2026 15:52:46 +0200, Luca Weiss wrote:
> Enable Bluetooth and WiFi on Fairphone (Gen. 6)
> 
> Add the required bits to enable Bluetooth and WiFi on the Milos
> SoC-based Fairphone (Gen. 6) smartphone.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.1

Thanks!

[1/7] regulator: dt-bindings: qcom,qca6390-pmu: Document WCN6755 PMU
      https://git.kernel.org/broonie/regulator/c/b043657c35e5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


