Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4604DC61DD6
	for <ath11k@archiver.kernel.org>; Tue,  1 Sep 2026 08:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ohpib62LZWXUeibRpn+IOxerCltjttaZcpi6tQkXmGA=; b=vt3/Kzox4K1A0sQaFs376XplFJ
	1hinG0aehVLVOXOT5VCI43XAXmzaUoIlpfOiC+t1Ae1Wx/lL/kNzXQ3taS3Fs/x1KZztxDY3qbPYH
	fxmW/oJCgpNcjZXAcTSx95b64uP2GK12LC/vro42Ws9cRX+z0iVRHUNY9jZWbh+DgEvRCv9i4L/yB
	ZAq8r4a2Awr+BeN9v092UmzztFJh1/e0x6CZLcibobjhuyMuyVO89p+Am6nRoz6XRzmKl6LQeEiPK
	/kPgQpKt9AZUqQPibh7sYuMZPyFZPdbdMEIShs47Bm3WU3D09XC7qn0rx8N4k2995sRqGBIsTnAv1
	L+ST9svw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JY1-0000000BCVp-3EUQ;
	Tue, 01 Sep 2026 08:08:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JY1-0000000BCVj-1wMr
	for ath11k@lists.infradead.org;
	Tue, 01 Sep 2026 08:08:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C6DD41476;
	Tue,  1 Sep 2026 08:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7583B1F000E9;
	Tue,  1 Sep 2026 08:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250129;
	bh=Ohpib62LZWXUeibRpn+IOxerCltjttaZcpi6tQkXmGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kWklQy1LpvHETxUBsg/vGzo+L3C+obYX0PKYmcM6G/9yl6jaG5VV+LLJXQtxrfib6
	 3qo5Eb6fv814iG/12mc3ZXrQGC+L9R87cv04xtLVl0cyW2TEiuZhJy0Q8WaYdx7j1Y
	 IORN/J7Y4IBQJMXpHQEu7bkB4Zj5U9wQmcaRpObCVf+T3sDJ4XzFPjIEAMf+/VnMAi
	 g5lVVDxqzbFFrzaj5+no73rD0uuj97wxAWeeCz3HUikiMI1udf9JxTMwmoH6+hBzY5
	 dE0SttwOhDpDa+U/nhL8KXAs8XsL3ZZbsCXcRdMBgHnPPtjobZYjtaqz06ZU7DJ7Kd
	 LoCDJjOj7kbSQ==
Date: Tue, 1 Sep 2026 10:08:30 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com, 
	Krishna Chaitanya Chundru <krishnac@codeaurora.org>
Subject: Re: [PATCH v5 6/6] PCI: qcom: Enable ASPM disabling during link
 retraining
Message-ID: <jdch2j3vcjsr2f4u7jhiazuotwqu6pon4xlvhzuhrzpzjhmkkb@7zzy2autzbmo>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-6-6dea79786b37@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260819-bwscale-v5-6-6dea79786b37@oss.qualcomm.com>
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

On Wed, Aug 19, 2026 at 06:55:57PM +0530, Krishna Chaitanya Chundru wrote:
> Set the disable_aspm_for_retrain flag in qcom_pcie_host_init() to ensure
> ASPM is disabled during link retraining operations. This prevents potential
> issues with link state transitions during bandwidth scaling on Qualcomm
> PCIe controllers.
> 

Is it really a controller requirement or a device quirk?

> Signed-off-by: Krishna Chaitanya Chundru <krishnac@codeaurora.org>

You need to use OSS email.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

