Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D09C433F5
	for <ath11k@archiver.kernel.org>; Tue, 12 Apr 2022 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nEtdV2BKs2yOik0pibE1YaOTD61i7ap5XKSFIatJ1Q=; b=xOfWULQO7XP5xV
	DchkMQZv036oRwVYpEiZFFmx+S9htQeEbxe6anT43AAWnKAdUuh0L4O7lhtMffpQrWtOnup8Gkv/7
	5D7J/ehuWlwyHvjezAjStDqQvlz11KIQ084WU5+hJ8AsXqhOtyIzkzMMrqBYXynlF9M3+RsSXBDEc
	zMPvbN9ZY3MOBIgcFx3AneJUfLHqzrbR7FLKYwc2tZCTMiNLoVBikG7SeTzugpfQFbtBhGyw5o13M
	kDv2oQ/1RWo1yAmpGHf7jL13sFMP8M24VX9rMkfXj4l8NxERD8R59T0cz+oYxEDdUCBws3URaCnMC
	pgNP+bMNiM/8FStxR2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDye-00DNWj-Dz; Tue, 12 Apr 2022 10:42:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDwW-00DMPc-MC
 for ath11k@lists.infradead.org; Tue, 12 Apr 2022 10:40:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2C8ACB81C9E;
 Tue, 12 Apr 2022 10:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33452C385A1;
 Tue, 12 Apr 2022 10:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649760014;
 bh=9pk3pVVU+tzTaBuH4UHl5rYkdZrqMTBhJJtEpCzTfyo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=eahZ62fOXAYpMrYgfr9ydE51IMiVoUgBsXQph+GuZSgcqRrtunDqIhC2jLGvvXcnA
 ouOr1dnxr4uX2dK+0HJFnAZZUVhv1A8WnxN3jR1Atx8s868HhTy2roiTmytWKO+rJa
 OAMxcepuKuCGfcBD+hN5vNcKJNQXs5KHPNgHGFfa4gS+rr+8deqC2nfE1tlQRIxBk1
 Rt2BGnLctZoGv17phoi/Xk7pb1d2WnPe3inqxPXMmxtLtLBR+7dqk6ZLhd5v0u+hJk
 1AXGRVBPtu3Cs+iBii4FtUCaPFZhoXcc8XR6ssyMJSFkVwUkpfdaf8cJLht+dxstMn
 RJ1e1OdttNz+g==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Prasad Malisetty <quic_pmaliset@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lorenzo.pieralisi@arm.com, robh@kernel.org,
 kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 rajatja@google.com, refactormyself@gmail.com, quic_vbadigan@quicinc.com,
 quic_ramkri@quicinc.com, swboyd@chromium.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org
Subject: Re: [PATCH v4] PCI: qcom: Add system PM support
References: <1646679306-4768-1-git-send-email-quic_pmaliset@quicinc.com>
 <20220412060144.GA41348@thinkpad>
Date: Tue, 12 Apr 2022 13:40:08 +0300
In-Reply-To: <20220412060144.GA41348@thinkpad> (Manivannan Sadhasivam's
 message of "Tue, 12 Apr 2022 11:31:44 +0530")
Message-ID: <87k0buoa9j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_034016_936717_927267C0 
X-CRM114-Status: GOOD (  11.97  )
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

+ ath11k

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> +Kalle, linux-wireless
>
> On Tue, Mar 08, 2022 at 12:25:06AM +0530, Prasad Malisetty wrote:
>> Add suspend_noirq and resume_noirq callbacks to handle
>> system suspend and resume in dwc PCIe controller driver.
>> 
>> When system suspends, send PME turnoff message to enter
>> link into L2 state. Along with powerdown the PHY, disable
>> pipe clock, switch gcc_pcie_1_pipe_clk_src to XO if mux is
>> supported and disable the pcie clocks, regulators.
>> 
>
> Kalle, is this behaviour appropriate for WLAN devices as well? The devices
> will be put into poweroff state (assuming no Vaux provided in D3cold) during
> system suspend.

ath11k leaves the firmware running during suspend. I don't fully
understand what the patch is doing, but if it cuts the power from the
WLAN chip during suspend that will break ath11k.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
