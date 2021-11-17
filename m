Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B513C433FE
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:30:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3490363215
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3490363215
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFZQ0J79VoPF5laC1rcfF1MW05yr3SYGaKJDRvYRDvo=; b=2yW4QxbAXYOsku
	35fgGqA0IEtW2NySqW+8pf1S+qMctYeD6WvuZLgRpsTsKorJtYXHR01fpvWQuzLVj0oWLptoHURdH
	hoZCze+eTaISiHTBvDMNYDG0nMOIfheM+1+f5EnhCl7udGCxwhAf8Dway7a0BGFET6Fofrl12w+wK
	keMOi65wKSkK0axW9YyboP7UyydekPTOo9FeL0wZCp+ansLt3D37yB2YrO75heSp6PYiYOF2V5k4T
	kxGWbkHreejQv1ZEYkH0per0lL0cYMrIlQwSfz21gTNpWtWKPHIHbjtYrPVuAtTmvVE+m5dPro1p1
	oSABE1HNcC08tBVwZ4dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFOZ-003nyM-6F; Wed, 17 Nov 2021 07:30:15 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFOV-003nw8-7u
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 07:30:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637134210; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=SiQ6SRP+sHIIIKbcxSblqmxN1NkeZRUYfcGWgIfUKMk=;
 b=A0rsMxbi7BCcOQHRrpHjDDTaxZQ/IIPO6ZjLFZI9tOYBrtpUG3heIk1QQwPMz0pLxrxcj86n
 Cvke0BlDgBJxPMxnejnzYlDnh4q+nd6UsC6Vr7vr4CvD3wW/BBX9G+uVzPVVyBj0/G+164K3
 w3zp11Js9lJ27mwGbfFJbgcMJ9k=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6194af81f5c956d49e2358a8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 07:30:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A3D44C43616; Wed, 17 Nov 2021 07:30:09 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6036CC43460;
 Wed, 17 Nov 2021 07:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6036CC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix crash caused by uninitialized TX ring
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211026011605.58615-1-quic_bqiang@quicinc.com>
References: <20211026011605.58615-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713420664.31320.4169502829779343934.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 07:30:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_233011_379769_FF3FB0B7 
X-CRM114-Status: GOOD (  12.20  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Commit 31582373a4a8 ("ath11k: Change number of TCL rings to one for
> QCA6390") avoids initializing the other entries of dp->tx_ring cause
> the corresponding TX rings on QCA6390/WCN6855 are not used, but leaves
> those ring masks in ath11k_hw_ring_mask_qca6390.tx unchanged. Normally
> this is OK because we will only get interrupts from the first TX ring
> on these chips and thus only the first entry of dp->tx_ring is involved.
> 
> In case of one MSI vector, all DP rings share the same IRQ. For each
> interrupt, all rings have to be checked, which means the other entries
> of dp->tx_ring are involved. However since they are not initialized,
> system crashes.
> 
> Fix this issue by simply removing those ring masks.
> 
> crash stack:
> [  102.907438] BUG: kernel NULL pointer dereference, address: 0000000000000028
> [  102.907447] #PF: supervisor read access in kernel mode
> [  102.907451] #PF: error_code(0x0000) - not-present page
> [  102.907453] PGD 1081f0067 P4D 1081f0067 PUD 1081f1067 PMD 0
> [  102.907460] Oops: 0000 [#1] SMP DEBUG_PAGEALLOC NOPTI
> [  102.907465] CPU: 0 PID: 3511 Comm: apt-check Kdump: loaded Tainted: G            E     5.15.0-rc4-wt-ath+ #20
> [  102.907470] Hardware name: AMD Celadon-RN/Celadon-RN, BIOS RCD1005E 10/08/2020
> [  102.907472] RIP: 0010:ath11k_dp_tx_completion_handler+0x201/0x830 [ath11k]
> [  102.907497] Code: 3c 24 4e 8d ac 37 10 04 00 00 4a 8d bc 37 68 04 00 00 48 89 3c 24 48 63 c8 89 83 84 18 00 00 48 c1 e1 05 48 03 8b 78 18 00 00 <8b> 51 08 89 d6 83 e6 07 89 74 24 24 83 fe 03 74 04 85 f6 75 63 41
> [  102.907501] RSP: 0000:ffff9b7340003e08 EFLAGS: 00010202
> [  102.907505] RAX: 0000000000000001 RBX: ffff8e21530c0100 RCX: 0000000000000020
> [  102.907508] RDX: 0000000000000000 RSI: 00000000fffffe00 RDI: ffff8e21530c1938
> [  102.907511] RBP: ffff8e21530c0000 R08: 0000000000000001 R09: 0000000000000000
> [  102.907513] R10: ffff8e2145534c10 R11: 0000000000000001 R12: ffff8e21530c2938
> [  102.907515] R13: ffff8e21530c18e0 R14: 0000000000000100 R15: ffff8e21530c2978
> [  102.907518] FS:  00007f5d4297e740(0000) GS:ffff8e243d600000(0000) knlGS:0000000000000000
> [  102.907521] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  102.907524] CR2: 0000000000000028 CR3: 00000001034ea000 CR4: 0000000000350ef0
> [  102.907527] Call Trace:
> [  102.907531]  <IRQ>
> [  102.907537]  ath11k_dp_service_srng+0x5c/0x2f0 [ath11k]
> [  102.907556]  ath11k_pci_ext_grp_napi_poll+0x21/0x70 [ath11k_pci]
> [  102.907562]  __napi_poll+0x2c/0x160
> [  102.907570]  net_rx_action+0x251/0x310
> [  102.907576]  __do_softirq+0x107/0x2fc
> [  102.907585]  irq_exit_rcu+0x74/0x90
> [  102.907593]  common_interrupt+0x83/0xa0
> [  102.907600]  </IRQ>
> [  102.907601]  asm_common_interrupt+0x1e/0x40
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

273703ebdb01 ath11k: Fix crash caused by uninitialized TX ring

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211026011605.58615-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
