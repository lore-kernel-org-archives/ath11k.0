Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE14FC76195
	for <ath11k@archiver.kernel.org>; Fri, 24 Mar 2023 18:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgUTq2+x0jAHWmV9GOoDKs0OTd02zPMXgWSC3TSVIvM=; b=1gA11atD/gLGDr
	Jrqi2keXEUBHilH+4GoDK6NHepGAyQ6KYMmmdGUnHLa8Ev45wcFV7bUqv4P/f5q0hkVy2tzDm3Y6o
	7e/n6lwYXGNO1RFpNB7IFi1ozXgp63TiERt7H9ijX0yJPNqKRVQtXkALap9pc6ij114fJgpfUYuhl
	c0Lwt5Or0HsCjqMaLCaN3E6DlRKRE94OcbyqY7NXeIsxbW9BIkCF9GWdCdTc+mPcrYLbQmzBuzi/s
	/r7+FW9VpG96uEGhK2ROd5faUJNPuUXpD5+0g27vIOV/+ZN6imIgap/phNL6458k+ErgV4Zdv0nFT
	U3hLyt4dzm5DMZeIfX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfmCM-005KDc-37;
	Fri, 24 Mar 2023 18:31:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfmCK-005KCZ-0N
	for ath11k@lists.infradead.org;
	Fri, 24 Mar 2023 18:31:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F3668B825DF;
	Fri, 24 Mar 2023 18:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD02C433A7;
	Fri, 24 Mar 2023 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679682688;
	bh=EyfY0rlchlhdbsx6lA17xyjUo29eM3oqgBh+IZ8tAk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HyNQ3xpqWyFxqVmTf/X/1Q/x9pbfYQs36lb0l2P4yIqamq5FeV3aUI02SKz+cmZcE
	 fsdu8Cs2XEqDzMM9otoTQqpbGlUr6cNRHoLkMNTLHORkROY51/53c3hbAxyi/lMPWm
	 E/6TRP3ONxbBX3aYWMSOKLc6NIbGnxwDe5HrIEcKJP3F+XKWqXd+iVmxbjbnXhE2xF
	 T8vWKUSidnjcCKkrSVYvIIHIen5XB4mBz8zPu6CaFCBa/aUGs4Tdwpx9p8WZ7e6lXs
	 7ih0Lj/Yjp4DFG4b6QO8n5H2sjSpx2MwwMGdHJGhd3AwXet88kDp6tb4N/dR0XxZih
	 HD1f8GqiCL2tg==
From: Bjorn Andersson <andersson@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Steev Klimaszewski <steev@kali.org>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org,
	Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH v2 0/2] arm64: dts: qcom: sc8280xp-x13s: add wifi calibration variant
Date: Fri, 24 Mar 2023 11:34:28 -0700
Message-Id: <167968287203.2233401.18027204097957860016.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321094011.9759-1-johan+linaro@kernel.org>
References: <20230321094011.9759-1-johan+linaro@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_113132_317118_6561DF04 
X-CRM114-Status: GOOD (  10.80  )
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

On Tue, 21 Mar 2023 10:40:09 +0100, Johan Hovold wrote:
> This series adds the missing calibration variant devicetree property
> which is needed to load the (just released) calibration data and use the
> ath11k wifi on the Lenovo Thinkpad X13s.
> 
> Kalle, can you take the binding through your tree and then Bjorn can
> take the devicetree update through the qcom tree?
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: sc8280xp-x13s: add wifi calibration variant
      commit: 2702f54f400ad3979632cdb76553772414f4c5e3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
