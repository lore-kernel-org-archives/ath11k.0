Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBEBC61DD6
	for <ath11k@archiver.kernel.org>; Tue,  1 Sep 2026 07:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMuwU4uDb7rEj6/4JiiTKDPJ13YLZj7n0SxKldQGwJw=; b=Xmuby3OnrFoTgnynFKANHylZNc
	I/8XURA8bwhxBC34pwOtM9kFN9d0oWB4aixpQ5CLGPkDXuytgIULQnFCitGtiowSaZ5v075978vhf
	8l12m9PBl39NGMygGimL3Kpgg+oNDAuScGRozd9VwxoUWBChkdMxxOcrvkbCbr0IDXv91eegpswMt
	sG1crTWMwsC0bqlc3dIgsIOXghgK/oQh4FU9cowTfOIx/hNROlgfAEuEZYqNcqboxoVE+Ui9NKzoI
	ljtR+FmGz/CXh2Dw4GdwVeerFbGxNyJOeGOhuIDJbS9PPB06x9zw8E0N+87icf1o/lyGH5MO6eqol
	/+BSXMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JAZ-0000000B9ZY-3dqr;
	Tue, 01 Sep 2026 07:44:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JAY-0000000B9ZQ-30uX
	for ath11k@lists.infradead.org;
	Tue, 01 Sep 2026 07:44:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F93340C1F;
	Tue,  1 Sep 2026 07:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA251F000E9;
	Tue,  1 Sep 2026 07:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788248674;
	bh=PMuwU4uDb7rEj6/4JiiTKDPJ13YLZj7n0SxKldQGwJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RWtHfyjjVOYK+ltbUdjcxvqx66SMK8QaTv02Krtz/G+/g3novQpAJgHJ7LZ5rJIxr
	 U7/OWl7XtSv2d6fazO+wgH8UOcJxvZVufzxYOip8bv7gQ1t7ZRQQsBLhYZW/aLMhY1
	 xQzqL12pRxaUozutOeyitjihac27TrgAhsRe3mcrWAnUvDuLDbhGMFTrFXcuEaiqzM
	 fyUCkDXtxA5JvUZrLlKnBA4UjxLj7nE3tkBq+cZqVHDKonvYdQRXx1OUeh6Al+OpD2
	 ojFlhDmrDBkVgTXL2anNj23x6c5oKdcW5sb3Qi6BXmCTXpaesB9e+gWqlHFspFlJlo
	 HUoYiAHZvGP0Q==
Date: Tue, 1 Sep 2026 09:44:20 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com
Subject: Re: [PATCH v5 2/6] PCI: Export pci_set_target_speed()
Message-ID: <hm23ew6au75saw6dtm5rdkf3k4x3sgpf4gnudqmms23rlppuhn@l3pmu3qh4q4s>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-2-6dea79786b37@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260819-bwscale-v5-2-6dea79786b37@oss.qualcomm.com>
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

On Wed, Aug 19, 2026 at 06:55:53PM +0530, Krishna Chaitanya Chundru wrote:
> Export pci_set_target_speed() so that other kernel drivers can use it
> to change the PCIe data rate.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

