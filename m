Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778AEC25B76
	for <ath11k@archiver.kernel.org>; Wed,  5 Jun 2024 17:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+Jx12y5gYkqqfNSXItJpjKXbPTAwVClLiAQ6P58DyQU=; b=0g2HvEhDPVLcpT
	I++07FxAPu/djqZIUDpAeFZ96ZNW+/ALvskRs/wzYrspR9mPIksF/Cb1shbG3ZhJ5lfvl+ZhtWmzL
	WdB7BpDKfnTkZhv1rmSQVmGSLdUx2ly52HcKwbGjovPxo+UFxPVRa0rtW2vpuF3A+hXmQR+zhAoQ0
	GTw1j2DT9LQhmyU7BVBIeeIKSmMO7/aGBDXEulIOL75yLti29aZUbvbUK26isejDvYBrnLDzJYLtW
	P2HslewDvpPvGbzCB3u2CcsCB1Jy8zpDl7vpwQEwMwYp5IUWKF8DumYCxOs6J8HsxHOVU9YIc3I9i
	QKU8K3+WJcKi0PFdp1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEute-000000072cw-41q0;
	Wed, 05 Jun 2024 17:58:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEutc-000000072bo-3993;
	Wed, 05 Jun 2024 17:58:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 147AC618C1;
	Wed,  5 Jun 2024 17:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65200C32782;
	Wed,  5 Jun 2024 17:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717610279;
	bh=7651KFw0eV+sZCBg3Xgw24WdzXcHIYOFgb2Cy9igrRI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hd1mkKZUhqQqGSBxCm4GPev0yQ2EhyJ/hnZS0yvgyGtNfBS8om6Bq1RE4ifOd6gI5
	 D8VetdPBrhbibxq/5zOvS8onnXu1R6FCGyyoHUAXd3cSpnu85JqX7ckJNf2pyzbUzY
	 MjxiEshiMdJkwl+wJpE22c15NY/CKktbPbdboJBMrgBWeTJiL9h8JinLCNuaox9GSo
	 GtwR57MNbDomombf3jMBJI8juBUZct7vfnfRdKjGTgIv6mmyHFEsR4tVai8f8qe9p8
	 EV670UDpwwOhsKCdGYgA+ho+/AM5EFh1w+wIiD5pu1QB2ephfYREjVAwQiUgGBsrXl
	 G4RSCtSn6mpuA==
Date: Wed, 5 Jun 2024 12:57:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alex Elder <elder@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath12k@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel@quicinc.com, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v8 15/17] PCI/pwrctl: add PCI power control core code
Message-ID: <20240605175757.GA733809@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-pwrseq-v8-15-d354d52b763c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_105800_860252_932F18C7 
X-CRM114-Status: GOOD (  14.18  )
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

On Tue, May 28, 2024 at 09:03:23PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Some PCI devices must be powered-on before they can be detected on the
> bus. Introduce a simple framework reusing the existing PCI OF
> infrastructure.
> 
> The way this works is: a DT node representing a PCI device connected to
> the port can be matched against its power control platform driver. If
> the match succeeds, the driver is responsible for powering-up the device
> and calling pcie_pwrctl_device_set_ready() which will trigger a PCI bus

s/pcie_pwrctl_device_set_ready/pci_pwrctl_device_set_ready/

> rescan as well as subscribe to PCI bus notifications.
> 
> When the device is detected and created, we'll make it consume the same
> DT node that the platform device did. When the device is bound, we'll
> create a device link between it and the parent power control device.

