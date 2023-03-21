Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DCAC74A5B
	for <ath11k@archiver.kernel.org>; Tue, 21 Mar 2023 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jw8gmImdURkCg4NQ9WSdYYr7EebwneTvKMqMqDpxFk0=; b=HcihDWr2GoxPhM
	X8UAcqhULBexs+1yHhUOCyJV8OdlQYSxaDUdAPNwB6uG2ZX1LBvslBE6pctq4VStjCWs0vOD+Faev
	AixG0JQo5osJ4m6fpAR2ttg8j2KNuhn3remb05+Ru2h4wlIf86mQQe4tVs5ec8ubk8VyyAz6rizM5
	8QPaYNtrRH/NPiUID9GqhuTUA7HgyXdlAtwKW4ZtLN6KQUzqfOqhzcmdMEOyKFH/5viiWAkwVms8x
	lCRZ+MgMYuvb8lZzQ1r6OC/cTAyfp6cisTzBt1Xn+72KyFMr7S4UUESdUYlBZ2ZygjAXC0Zqt+FC9
	xCfYVqrJrHZ5NJ3nvHtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peYSY-00BuLg-04;
	Tue, 21 Mar 2023 09:39:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peYSV-00BuKN-2n
	for ath11k@lists.infradead.org;
	Tue, 21 Mar 2023 09:39:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 204DBB80A25;
	Tue, 21 Mar 2023 09:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06C0C433EF;
	Tue, 21 Mar 2023 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679391548;
	bh=V6kdOKfFIbHI/ykoqHBq8eQrNQHaxHZhhUL4P5DUTFY=;
	h=From:To:Cc:Subject:Date:From;
	b=j2AKqO47VVWmdswohU3B1RKEjSLYMkMWntcy9Ry2AahnAgp27+zOoUIMUgxrene5F
	 JrlfHDyK+jOifH3JfbSLWZzBJxfOCGMyZdcUyPjxXzyev/FzZg3/XtBwkzPgolN5gl
	 prdlH669lMSNT2gw55uBfdWivYtkKdaIEK7S8F9KgXrErOvJywdZp/eQum3sBG1wsU
	 jI6ZcNWsol5VGD8jPVAwRizLojwDFmC+y8AYumopQUJ3cCDZjOfHrePHsks57/XtIt
	 SpOLheIp3gz68lW/CBu36sNpbg/jcWEBIPJZkXqJvGWfIGDULJE7wTlRBbHlxieeMu
	 llSkuKOO7e6CQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1peYTo-0002Xw-6q; Tue, 21 Mar 2023 10:40:32 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Steev Klimaszewski <steev@kali.org>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sc8280xp-x13s: add wifi calibration variant
Date: Tue, 21 Mar 2023 10:40:09 +0100
Message-Id: <20230321094011.9759-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_023912_056251_9F05E344 
X-CRM114-Status: GOOD (  10.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This series adds the missing calibration variant devicetree property
which is needed to load the (just released) calibration data and use the
ath11k wifi on the Lenovo Thinkpad X13s.

Kalle, can you take the binding through your tree and then Bjorn can
take the devicetree update through the qcom tree?

Johan


Changes in v2
 - rename DT schema file
 - fix model name typo in binding comment
 - amend calibration variant description
 - drop the corresponding change for the sc8280xp-crd which will need
   its own set of calibration data


Johan Hovold (2):
  dt-bindings: wireless: add ath11k pcie bindings
  arm64: dts: qcom: sc8280xp-x13s: add wifi calibration variant

 .../net/wireless/qcom,ath11k-pci.yaml         | 58 +++++++++++++++++++
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 17 ++++++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml

-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
