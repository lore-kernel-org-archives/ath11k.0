Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC283C19776
	for <ath11k@archiver.kernel.org>; Fri, 28 Feb 2025 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSLc4lu0t+h43AbmJsPUEgMhV24At7mlM/Q3o63YMFc=; b=jzJWLFdd7oxKXUEo5KxmIKRCiN
	h49kVsHdFsOjYxDD2ti4au5fWTA66dCA7HWVnEfhSsWzhcb7FquRd5ZVLGZHy4ozR2S8ku43nK4XM
	rlB6PMQSnY+dvPgHRh/OyHeEY3WxOkybzQyiitWnhYRcnvTmSWUrcsDW4KZTsVQnFsUMlgmAX66ug
	Hm/OkPHstwDJfTA+hg/wyRkURyavXUzt79daVHUxwKE6RynO22pG9OJaHg6sQL7Gv7ckTwIgQqft4
	6T+kh2iPyn2x/08Qo2VkgBTo0V6+c7kd0tHvnw0NWfseMr59LInrkbsprXPOlIQjFxrJy+ip89yQZ
	MtrCQX6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzTp-0000000AuW8-2ca6;
	Fri, 28 Feb 2025 12:28:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzTf-0000000AuSB-2VO5
	for ath11k@lists.infradead.org;
	Fri, 28 Feb 2025 12:28:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7CBFF5C0C7F
	for <ath11k@lists.infradead.org>; Fri, 28 Feb 2025 12:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D28C4CEE7;
	Fri, 28 Feb 2025 12:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740745706;
	bh=1KhkYt4yF0gE6rueJYBwI3PIyKx9a9jUDZzdIh9Onzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRpXfb9tr3J8U6boxisV61tke6CkDG3i6rUPt5Tof0k4JkaHI++Cjq/5H0Z9Aek9c
	 VQpkXfAqta5TXdY9vSf4tq762cGsy+X1+1a3raUa13h3tU091BcFlCdY30Gn4mD8jC
	 gET7u1NOdsxMw7Mn33E8EfAAwSyg8SJqDFwWUfEVyGmhNX1Ey6BFwZXWtnovRTnHG1
	 FluajsEwUsJEPJLdpH48Ljf33acFeHl+/VaTjwyOYi8rB8nMyEmBeGCB2OoEmmxvR2
	 oBTAoBTrMVdLRPj+l+zViYhni1cg0MmSlDv/YgydtUJIb0zp+oLOoc5pEvMYRW7tUg
	 otViz9fKAaHIw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tnzTs-000000004ys-0xFE;
	Fri, 28 Feb 2025 13:28:40 +0100
Date: Fri, 28 Feb 2025 13:28:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
Subject: Re: ath11k: WCN6855: possible ring buffer corruption
Message-ID: <Z8Gr-IMD-UZTU-X5@hovoldconsulting.com>
References: <Zh6b-38tGGXo-ee7@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zh6b-38tGGXo-ee7@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_042827_747249_5648FE64 
X-CRM114-Status: GOOD (  21.62  )
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

Hi Jeff,

The ath11k ring-buffer corruption issue is hurting some users of the
Lenovo ThinkPad X13s quite bad so I promised to try to escalate this
with you and Qualcomm.

The chance of hitting the bug seems to depend on the AP/network, and it
also seems my hypothesis that enabling the GIC ITS, which increases
parallelism by spreading interrupt handling over all cores, do indeed
make it easier to hit this.

The latter could indicate a driver bug, even this could very well be a
firmware issue.

Have you had a chance to look into this yet? Can you tell from the logs
and reported symptoms whether this is a firmware bug or not?

On Tue, Apr 16, 2024 at 05:40:43PM +0200, Johan Hovold wrote:

> Over the past year I've received occasional reports from users of the
> Lenovo ThinkPad X13s (aarch64) that the wifi sometimes stops working.
> When this happens the kernel log is filled with errors like:
> 
> [ 1164.962227] ath11k_warn: 222 callbacks suppressed
> [ 1164.962238] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
> [ 1164.962309] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> [ 1164.962994] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1476, expected 1484
> [ 1164.963405] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1488
> [ 1164.963701] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1480, expected 1484
> [ 1164.963852] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1468, expected 1480
> [ 1164.964491] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
> [ 1164.964733] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
> [ 1165.198329] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1488
> [ 1165.198470] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1476
> [ 1166.266513] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 2699 at byte 348 (1132 bytes left, 64788 expected)
> [ 1166.542803] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 4270 at byte 348 (1128 bytes left, 63772 expected)
> [ 1166.768238] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 0 at byte 376 (1112 bytes left, 11730 expected)
> [ 1166.900152] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 3 at byte 790 (694 bytes left, 16256 expected)
> [ 1168.499073] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 1 at byte 62 (1426 bytes left, 3089 expected)
> [ 1168.818086] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 63063 at byte 1466 (10 bytes left, 50467 expected)
> [ 1169.032885] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 0 at byte 364 (1120 bytes left, 12483 expected)
> [ 1169.308546] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 3092 at byte 348 (1128 bytes left, 64780 expected)
> [ 1169.563928] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 1 at byte 348 (1124 bytes left, 44062 expected)
> 
> which after a quick look at the driver seems to suggest that we may be
> hitting some kind of ring buffer corruption.
> 
> Rebinding the driver supposedly sometimes make things work again, but
> not always.
> 
> The issue has been confirmed with the 6.8 kernel and the latest firmware
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37.
> 
> I've triggered this issue twice myself with 6.6 and .23 firmware, but
> the reports date back to at least 6.2 and likely when using even older
> firmware.
> 
> An unconfirmed hypothesis is that we may be hitting this more often when
> enabling the GIC ITS so that the interrupt processing is spread out over
> all cores (unlike when using the DWC controller's internal MSI
> implementation). This change is now merged for 6.10.
> 
> Do you have any immediate theories about what could be causing this?
> Does it look like a firmware or driver issue to you, for example? Is it
> something you've seen before?
> 
> Note that I've previously reported this here:
> 
> 	https://bugzilla.kernel.org/show_bug.cgi?id=218623
 
Johan

