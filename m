Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D04C3601F
	for <ath11k@archiver.kernel.org>; Wed,  2 Apr 2025 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUyO+AdNALOZiR87iVw0fr3v1s4HrxxmsTig2DZV2J4=; b=aTpfaYvjPv80R73pZAxjl5I//k
	440FvyRkbRbMipwqmHWbY4j0nibmR+IJnFtBqxDlxzPxoTyIagtsbIe37zjieRvHB+T4dIfjBTiMc
	0v6ust+MOc3reon448LA5ccFporCJOgMJlljQ+a3sbLLL6z8yBUPsyCXFtHEaGZBVrqCs0/AFPEqt
	dBkPec72+BXb6GiMLpcXskceHwtrxnpxQQklDMit+fKS7qoAh6IqrYxdqvn1kKm/dPb1hpli5ZA9w
	gRYxXgY7/sdl6KGsho6a4Pt7jAxwAh8Y2s9/hwtR5EjydaxukeQUB+mk+RQFl8x4Hbx5CuUO9unit
	fDZU2rIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyI1-00000006Grz-1tjC;
	Wed, 02 Apr 2025 13:37:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyCG-00000006FUE-3z2T;
	Wed, 02 Apr 2025 13:32:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10522A44049;
	Wed,  2 Apr 2025 13:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1B5C4CEDD;
	Wed,  2 Apr 2025 13:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743600719;
	bh=HXCreqJAX63x8U6Bhy46j1MYoKRw9NtzzLwUQO7Jr/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cCSiD+8TO/9SSfFvvMRxONjUAicpsAZKDVmz3Nxbc9P3DDZApmtdBpT5j87ZtGF9b
	 FNzJoCPvHXlh4U1lP5LwkIYziGScXZ/+0l2Y6yPdqmfCYqYS0c8Q+XikVnXVhtd8PB
	 9xwHVYBJdOGzuDBYlqoBs9gfiYVrbNENPvRH4Wq3/wsG+clWHoPW4QzVSxcTt5/Pox
	 JbqTHlhgUhCCjQyIAQEqRMGGakc9D7G9wBGrm0+473hpawBgk/HzYZFYaP5vDox7rR
	 aF0QefjpfSZSa7riQ+PiqvM0Kn10EWo2iTxUN5MWzDUvJFb02jaz45ieblqVS+uU2i
	 3see8FW1HgK0w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tzyCK-000000004q3-3BYa;
	Wed, 02 Apr 2025 15:32:04 +0200
Date: Wed, 2 Apr 2025 15:32:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jonas Gorski <jonas.gorski@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: Kconfig: switch to HAVE_PWRCTRL
Message-ID: <Z-08VFPfepvJPV33@hovoldconsulting.com>
References: <20250402132634.18065-1-johan+linaro@kernel.org>
 <20250402132634.18065-5-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402132634.18065-5-johan+linaro@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_063201_051292_26187E8C 
X-CRM114-Status: UNSURE (   8.50  )
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

On Wed, Apr 02, 2025 at 03:26:34PM +0200, Johan Hovold wrote:
> The HAVE_PWRCTRL symbol has been renamed to reflect the pwrctrl
> framework name. Switch to the non-deprecated symbol.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

I forgot to add Mani's and Bartosz's acks here:

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Johan

