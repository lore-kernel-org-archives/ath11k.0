Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA37CFB43C
	for <ath11k@archiver.kernel.org>; Sun,  6 Oct 2024 01:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16q9Y86sg7YtLV/VdQV+wY+5IqRr33tmSw72N/NgBR4=; b=lUBRAfpTL8g0l7v12TZvdwjInI
	E8G0x+dY2XR1cLjmWg82n+Bo5Ks4wzgtmG9JPiW3fN0U5TlV/pRW6cYQfb5QTNNttRw/W4A4J59zz
	pu2obqzylJWCLmEQ7TIrYnLbxRBOLvZEJewZnjUcqQZ8gmt96HMhVa3ZmVfCSA+ZIIDRCxOol+JV7
	W/po5kvRyNklWJRhdV1D0kmc6SYF6ChJjGqOsgwkf6dGIATAoKaxG/5Ph/87ncAJt+jLtH5QhzPIO
	9BnTyjlP8nw9cVFJ+xzs9l4YMlyNp9+Ex+ZV+doCZhfBq3zlC8kkdUvBPS0NbShfcfG6MouKsCWvx
	0d67/0xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxGUr-0000000GPJk-2mTs;
	Sun, 06 Oct 2024 01:55:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxGUo-0000000GPIP-3Bz6
	for ath11k@lists.infradead.org;
	Sun, 06 Oct 2024 01:55:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 166275C4B6E;
	Sun,  6 Oct 2024 01:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7561BC4CEC2;
	Sun,  6 Oct 2024 01:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728179740;
	bh=RWOCv59/jmqYqMEm9L4v3SqGjoHGtg6ZPwB9geWYaR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UGKu6XAWHUyGDq9rdnKgYGfw4NFbGg+riDbD1agxOqhvW3grSwkIZLdDEGapsUY/j
	 MIWb/hxVp9Hy0KiKSMufyJ0Fs1MFSPfIWZE9xUq1yi2DshBKVIB/kNQtqG7K1xlCck
	 Ax1O/VyAYqmnyy0dOeehIGRf3+yZg/dr9hcAU1hpEOn2mwIMMx7pMeXXVswXaZZeGp
	 A79jqZ53UfFFrJGVIbpoywbol1+AvU5RcNcYWy5qLjERiro8mSRrzTgKFoaKj8aZiA
	 zkVqtA9pBYCu7yZMv1uMFr+A+97nW0NS4KZgISDHJHva7X7d1svpBk2jwVXNWwFkCu
	 wFALGV3t1vTKA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	cros-qcom-dts-watchers@chromium.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: qcom: qcs6490-rb3gen2: several small fixes
Date: Sat,  5 Oct 2024 20:55:32 -0500
Message-ID: <172817973328.398361.98827973777969222.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907-rb3g2-fixes-v1-0-eb9da98e9f80@linaro.org>
References: <20240907-rb3g2-fixes-v1-0-eb9da98e9f80@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_185542_870134_D967329B 
X-CRM114-Status: UNSURE (   5.91  )
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


On Sat, 07 Sep 2024 15:51:23 +0300, Dmitry Baryshkov wrote:
> - use modem.mbn instead of modem.mdt
> - make GPU disabled by default
> - specifiy ZAP blobs
> - enable WiFi devices
> 
> 

Applied, thanks!

[1/4] arm64: dts: qcom: qcs6390-rb3gen2: use modem.mbn for modem DSP
      commit: 6317aad0e1525f3e3609d9a0fea762a37799943a
[2/4] arm64: dts: qcom: sc7280: don't enable GPU on unsupported devices
      commit: 94d5ffab9d5ebc9caeab310f9d2eb36a65d7d3a9
[3/4] arm64: dts: qcom: qcm6490-idp: enable WiFi
      commit: afa11181fa506709857ebbdd17b4d76f2587e802
[4/4] arm64: dts: qcom: qcm6490-rb3gen2: enable WiFi
      commit: 0f6c6ae2e9d1cfafe62fed9ca0a07d241d3d8b79

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

