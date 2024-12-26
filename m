Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81282E77188
	for <ath11k@archiver.kernel.org>; Thu, 26 Dec 2024 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5EVoV75IkUvB1HUP4nuL/I5CZ3S0LzNOPFFgI5Ea1s=; b=B5R9Wxd/tw8zLDp6dezK8VC20r
	ahVOw56QPIn33lcB6F3Ugcqmv5SbrdXqyN8rMKNj9LonvdlQXTbjteFr27LTTfAfIY5SGkrKDc7jo
	muuxAwpG0cXWvmTx+0gOF96B1bmDwCJNNcIX3VxEi7UkoXi2QVa5desT+wg3R+7LUrwjkfQSo7FPU
	nJ+9OEZsk+WHW0Jm454AYlZVA1etjh+C+gZUQM/5rnaW4sO+lk08Z1v0eBljUQUFO+fNoEWv8Slth
	B5IBzcuLeP1cisRoBpwg2CZ3F+Dk8kOLt5qRCpBbsazO1J8rCvTNJj8YHL/GrBlS0PHKmJ217GPs8
	nf/V5bxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQsa4-0000000GCln-40zh;
	Thu, 26 Dec 2024 18:27:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQsa2-0000000GCkr-47K6
	for ath11k@lists.infradead.org;
	Thu, 26 Dec 2024 18:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 573515C60DD;
	Thu, 26 Dec 2024 18:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BA5C4CEDE;
	Thu, 26 Dec 2024 18:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237649;
	bh=93mqOe0JB42YZvJDC+jXPRbp/QekRho4fXl3FDDBODM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LAx9DVSwNbfNaCgKDp4s13vW/9JlRmRRG5ky9fETSn/U/j5Ns1DSUyVr2pb6/tjq4
	 J2+mvYIVaJWKHRez0VePkPwD/FSqg1IZmgrW+sZyrmZbWU5bikdYjKN3vorC7bOpu8
	 Lge56knJq9KI56M8eMHEavtKJd4KbN1Xlkmf9uk0RZQjkI0R2nEAsY2v8vTCXhSuGT
	 gmD4+YOOw+s5xQ0TmGffa3zMe0nlSQb4MLUQL3L0vsq9F3puBs6lZI1YrPJ7nGXYUS
	 YxxjaN5ipTbxHe2I+m+gq2zRhVWR3iGsLdTUEY9EQ/ECqD504qqreSZTTgKVeHIhsy
	 cwr9w6gOeyzBA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jianhua Lu <lujianhua000@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
Date: Thu, 26 Dec 2024 12:26:47 -0600
Message-ID: <173523761395.1412574.10662186854294667989.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241201135716.141691-1-lujianhua000@gmail.com>
References: <20241201135716.141691-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_102731_066301_66BD059F 
X-CRM114-Status: UNSURE (   5.21  )
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


On Sun, 01 Dec 2024 21:57:14 +0800, Jianhua Lu wrote:
> Add qca6390-pmu node, which is used to manage power supply sequence for wifi and
> bluetooth on sm8250 soc based devices.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
      commit: 6e4ec5f6940d8ae38ffe23c7f2f7da9de57d0cc1
[2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
      commit: 1993f0255347c98b133d90e4150a4ce5f32646c4
[3/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add bluetooth node
      commit: 8b14c0648673439fb736b68096804314b934653b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

