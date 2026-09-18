Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D61BC982D2
	for <ath11k@archiver.kernel.org>; Fri, 18 Sep 2026 01:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKMAf9Vzg9bU9tgovjaQo6jPTYOiFpv712sI9S5dxvM=; b=u3P1Pds9fO7mhSnpu4UMHl4VeF
	T55DKqyfKjVuRiSQpzMk/YEPshj0MLv40vRTlmBoUhPj5zSGp5u2vKnhJzMAXL+X0jOvK8QXVfX8d
	Cb82VhGKH8lQ7SQ0mtkYRrxEmb2juZ+Ul23BqikAfZ7d0VFRB7NEfJ1GA1LjbverkT/8U56FPv7Gc
	fXx9NiirobyI9hKDfOPQdktbc0PgbnkGYLiluJzsayzm1JNepo2ZUTCVuVQBBabBdnP1Bi7inXQrh
	Oq2v+NWUWniXqOb0xmNn1KGeyic5+2xw7YAubQVQHmFTP7pa2PpBX1zxJXl+y37ZmTZ5fBLonv9ti
	jOXXRDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Njn-0000000DCx8-41DL;
	Fri, 18 Sep 2026 01:50:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Njn-0000000DCwU-0jlJ
	for ath11k@lists.infradead.org;
	Fri, 18 Sep 2026 01:50:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96BC4601EF;
	Fri, 18 Sep 2026 01:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DB41F0089B;
	Fri, 18 Sep 2026 01:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789696201;
	bh=EKMAf9Vzg9bU9tgovjaQo6jPTYOiFpv712sI9S5dxvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X1f4kL/8mWyqI7hOJLKnCIh8valDE4NZiwrIugZGtn2eW4dqA49tiNj+WCxhbHGJo
	 F6SoEDcC6VlPILrAkLl9uPJJMU1U3sdljM6S/vqsgvo55tW3zvIvTXUMfOvZCK9JDC
	 5ft526LVfDNtX+TxQvmJ5mGdyKOay/5LSXhYYYg0DiSdZE4R0BGFwQovOMFJ+Br/Gt
	 gzTbWxVwhyZ0/j8aqsfnufJ0/hpvsKJhizERIjuRQZ8yqbd+Xp5Pdbp4s1wkd9JVdd
	 q6eA/gkNHxtORF/Xh3i7LMypzX6QQk2Ry68xlEBrTmQJr0zqAvFTxhMZHic4vd7atR
	 jaatjgCRW6bZQ==
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
Date: Thu, 17 Sep 2026 20:49:49 -0500
Message-ID: <178969618819.1582337.9485761608259229279.b4-ty@kernel.org>
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

[2/7] dt-bindings: bluetooth: qcom,wcn6750-bt: Document WCN6755 Bluetooth
      commit: 15e9f90a4d86c9537e14901898ea1ab88a048169

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

