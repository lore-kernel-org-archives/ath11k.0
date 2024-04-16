Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C95DC4345F
	for <ath11k@archiver.kernel.org>; Tue, 16 Apr 2024 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GyG8rAq6ewzeKsPt0mHsZyNL0Ljo1ec+uNO4v4NZv7Y=; b=0TOkcGoh3Rb0fvz3QTAFGCAcU9
	li2WYaztTL3FaIhCOXUI4BLJ2PJpreXL1yEfMiuNSGeSXQ8StfKN21jRYJ17JnWTdCRPfgZGmx+yL
	hdbtpWaz+OLPvF0sbZvXywCIZrNbnxRHdPtOpMO3OQmv610fVQPI02ajEG63KpXUsdSfMN/ghbPP6
	ps3JQq0Dig+yOwfYnqaCCZDo1ihKSRYG7VTGTkM6BDdogHuqNhq+F+EQGZKeblvF7k3o5WtQpUi7n
	bKXcjfHXFY9StKKKwxZH1tQUcO4tRC7EBgwSFPEkVp/N1iFI11FDCUWRsvjn7iUI+RY8voL+P61aP
	WQPMzqmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkvR-0000000Co2S-41M6;
	Tue, 16 Apr 2024 15:40:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkvP-0000000Co1M-0yT7
	for ath11k@lists.infradead.org;
	Tue, 16 Apr 2024 15:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 114ADCE01F3
	for <ath11k@lists.infradead.org>; Tue, 16 Apr 2024 15:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565EFC113CE;
	Tue, 16 Apr 2024 15:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713282043;
	bh=M8oXFOXC9510L1sS9yrQwCiqB9isOtApcFXKR6Um07A=;
	h=Date:From:To:Cc:Subject:From;
	b=gSHYndLgQ56O76u3RNiEF/RQ7gBGKZxI/UgP8M0MOMUZchr73UqFrltTx1Jaky37E
	 2PDm6pZUSLadw3UTIQP6/kmZqgB2xo6Cs59UhIR5pc+Whxv2wKsc5sdxU7LBfRUgkk
	 /de0az0CjUS1nwJTflxergcCYLsZ7ThrkvCkGGEMqmVkyTeOVNsf+LT+zmiCuRi6+/
	 n2UhOXE8XK2MWY+jWNPueo3zeu9IWC6rwmSTjq0OLWCnXVu8Rh/4bLW2DIBKw0r3iW
	 XcDfBGWrT08PV3LlFv0oeQ5c5V2rzeeJ/dhyGwUAwEkfyFaPHA7b8nvCo+I0jlMk2B
	 yeRmPWg/pZ3iA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rwkvL-000000005yE-0UE6;
	Tue, 16 Apr 2024 17:40:43 +0200
Date: Tue, 16 Apr 2024 17:40:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: ath11k: WCN6855: possible ring buffer corruption
Message-ID: <Zh6b-38tGGXo-ee7@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_084047_664484_183AFDFB 
X-CRM114-Status: GOOD (  10.15  )
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

Hi Kalle and Jeff,

Over the past year I've received occasional reports from users of the
Lenovo ThinkPad X13s (aarch64) that the wifi sometimes stops working.
When this happens the kernel log is filled with errors like:

[ 1164.962227] ath11k_warn: 222 callbacks suppressed
[ 1164.962238] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
[ 1164.962309] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
[ 1164.962994] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1476, expected 1484
[ 1164.963405] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1488
[ 1164.963701] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1480, expected 1484
[ 1164.963852] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1468, expected 1480
[ 1164.964491] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
[ 1164.964733] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
[ 1165.198329] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1488
[ 1165.198470] ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1476
[ 1166.266513] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 2699 at byte 348 (1132 bytes left, 64788 expected)
[ 1166.542803] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 4270 at byte 348 (1128 bytes left, 63772 expected)
[ 1166.768238] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 0 at byte 376 (1112 bytes left, 11730 expected)
[ 1166.900152] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 3 at byte 790 (694 bytes left, 16256 expected)
[ 1168.499073] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 1 at byte 62 (1426 bytes left, 3089 expected)
[ 1168.818086] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 63063 at byte 1466 (10 bytes left, 50467 expected)
[ 1169.032885] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 0 at byte 364 (1120 bytes left, 12483 expected)
[ 1169.308546] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 3092 at byte 348 (1128 bytes left, 64780 expected)
[ 1169.563928] ath11k_pci 0006:01:00.0: wmi tlv parse failure of tag 1 at byte 348 (1124 bytes left, 44062 expected)

which after a quick look at the driver seems to suggest that we may be
hitting some kind of ring buffer corruption.

Rebinding the driver supposedly sometimes make things work again, but
not always.

The issue has been confirmed with the 6.8 kernel and the latest firmware
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37.

I've triggered this issue twice myself with 6.6 and .23 firmware, but
the reports date back to at least 6.2 and likely when using even older
firmware.

An unconfirmed hypothesis is that we may be hitting this more often when
enabling the GIC ITS so that the interrupt processing is spread out over
all cores (unlike when using the DWC controller's internal MSI
implementation). This change is now merged for 6.10.

Do you have any immediate theories about what could be causing this?
Does it look like a firmware or driver issue to you, for example? Is it
something you've seen before?

Note that I've previously reported this here:

	https://bugzilla.kernel.org/show_bug.cgi?id=218623

Johan

