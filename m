Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39EEC61DFD
	for <ath11k@archiver.kernel.org>; Mon, 31 Aug 2026 20:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4mXV3EO3vioncRCnbhvBa71PgQUXVNsl5KiuAmXZr4=; b=VwlOaClKf6HHXCrpRmKbOux1wd
	6rCIgq0sUC5bn0a+qSFJJwxTm+FjH3sn/wBnXJ2xkgaWxAIqUwyyyABn9j2i1XfotlJDchwGdVcmS
	RgQ0QBR+Tm+Y3TAkuVyZuRt8sJlvR8mBhFHBTGHSX2791tCgM5kSgNzPx7yKeqhYcrYMu+0TEdnue
	6PQF4y6HtWPnmakA+lqGOxYZi5j6Lx0OGzsxrgbv3mki5EJNpt5wBl/Wxj6rgGR5FXru6cTC1EfsA
	vKIG3HZo238BEtegHsQz0nlxzYZ8YBswTl2HAqtnLN7sJVSZjsjKKqzqGI1BGFxV1iS6LrnoJEM6U
	amwkqtbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18Vo-0000000ARR6-3Mzl;
	Mon, 31 Aug 2026 20:21:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18Vn-0000000ARQS-3QXe
	for ath11k@lists.infradead.org;
	Mon, 31 Aug 2026 20:21:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A094400E4;
	Mon, 31 Aug 2026 20:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2A51F00ACA;
	Mon, 31 Aug 2026 20:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207707;
	bh=i4mXV3EO3vioncRCnbhvBa71PgQUXVNsl5KiuAmXZr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DrRF98Jo3vsRDvXpFD7+P8lC1rFverf+ywAb5KCIa5S3Fd1RU5APK/MKG/PoNT0og
	 AfsxSB6tphmud9l6t3NQXy6Lx0ymx+Zufw1Rp3Y2XIa+fPrfRbYN7PKrLjay7ChlXX
	 C7fTl7sBprBAtJa9D7V+ND3ovxeJaihkdiGPy63S3fIs2kLFPbVoxNSyVz/D/+peio
	 rttll2tvoQq0Vv5Wi0iC9pn8fq6IDfvxH16BTUVhWDrqMook9DOMB2scgf+KRqXt2r
	 Odtfn53oa1nf7I+boZ52ZJwMBYcOKs2VHQXXmj5RuTe48fSy89K3sncy6RQp42PpCF
	 GndBKeC5Ij4IQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Koskovich <AKoskovich@pm.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/7] Enable Bluetooth and WiFi on Fairphone (Gen. 6)
Date: Mon, 31 Aug 2026 15:21:23 -0500
Message-ID: <178820768635.1699313.4119708799289566517.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
> Add the required bits to enable Bluetooth and WiFi on the Milos
> SoC-based Fairphone (Gen. 6) smartphone.
> 
> 

Applied, thanks!

[3/7] dt-bindings: net: wireless: ath11k: Document WCN6755 WiFi
      commit: e506d34e57236c41cebacc43e50f35f5b52dc675

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

