Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA96C6FA82
	for <ath11k@archiver.kernel.org>; Sat, 10 Sep 2022 06:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ie78adn6cwwIJqzPFf7f0gH4/q6ypo/rp/FwsmqrJQU=; b=GxFqltPASR5uEu
	4kA875TzsvvWM6ojhQCeYUUAgVl+85P7EuI1qLNTa/eGLTY2tcsjxRN6CyHH8kwmu6qWTe7/A5rH1
	sU7WDBJbnHUZR1+ePVuNvVNdnGBK4OO1PsKOdvwXKFdcvIiXpk09UEYXq80v3zQKgwhoTnOPa4G3i
	x0jq+X+t+6oxTT2HDvqGGhjz4Dm44DrBvnmlJ+90mdXKQMffeViqtUu3mepms2+xrbOPISZGOsnTC
	VTUr2WeAQ2eQm0s1lFBBqPU4QZM/ziUgPFJvKMDPwm80zthAm9m6788RlWvtDhWJCxwBMg10mfCMG
	4S6L2oNSC/gI2bMnmRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWtwt-006j1o-Fj; Sat, 10 Sep 2022 06:26:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWtwq-006j0q-JL
	for ath11k@lists.infradead.org; Sat, 10 Sep 2022 06:26:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B3C1DB8070E;
	Sat, 10 Sep 2022 06:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4701C433D6;
	Sat, 10 Sep 2022 06:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662791191;
	bh=yTVjIXVv9rN3IP/QkL7FC0AQ63K4AO/o3t0aBFJq0Qs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kNXw8FMmIPmDZUfLQkHTNmdxCYkLrL7TVELkjQj1eKiwgP5SIM624Gafm1cfXVwj+
	 Ls+y1K0FcEGgBP7gUn2IuiS2vqaGSYLRHHrr2FnOVCeZOqBTILMqu/iMoAMYU6BZvm
	 iy/8A5X/MfkcTJKfJYmAQ9TaGTgjyJxe/VLpyf3QOAcu5NgngEHzmMuWXM6IGQg/sG
	 s68my0Hlu2Trub4ph17bf75NK4yFhIcFlPgkvtY7Q0H+8Dn5FYopO1RiHeU6fM5hCu
	 2TI/XoDzEG2nu04FT8Uxjra8fUyhB8CyRpMJV0ImOq2YcHOZ094bqrWH1zNR/Ol6Ue
	 EPGZja/wvPgnw==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] wifi: ath11k: Split PCI write/read functions
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220802075533.1744-2-quic_bqiang@quicinc.com>
References: <20220802075533.1744-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166279118836.2050.14810899093948746429.kvalo@kernel.org>
Date: Sat, 10 Sep 2022 06:26:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_232636_836289_C1BFBE81 
X-CRM114-Status: GOOD (  10.27  )
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

> ath11k_pcic_write32/read32 tries to do wake up before doing actual
> write/read work, which means each time a u32 is written/read, wake
> up is performed. This is not necessary in case where we do a
> large amount of write/read, because only one time of wake up is needed.
> So split each one into two parts, the first part does wake up and
> release, and the second one does actual write/read work.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

90aad48eb56f wifi: ath11k: Split PCI write/read functions
876eb84882a8 wifi: ath11k: implement SRAM dump debugfs interface

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220802075533.1744-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
