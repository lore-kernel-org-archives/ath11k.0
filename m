Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5266C433FE
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 07:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYczoEZ6uEl1wPRe6bSBgyEzeU1e06Xhw5QSnCAaMWY=; b=CEJnm3CEQ9pQZc
	RNxHiSP+2U6mcgr9lHS9EfW/7zV7tMjHQvJ5DjRHbKSEcBnVU+yIJ3jb8OGam6UBmyWt19S4wdDR5
	CL3cpuBnh3vhtAE23jdShp0dbpSaJKSeN5OAamlz7bCkcv0IlCATR1qMrtuaOdg9/gtK0lshsNmUo
	0g/S6Ao00A/wQbquqltUXVTofeGuWYle9CQs1TMFPa/Q35xIhKMjacxE30vBtYx98GTcwcgLQ3N8Y
	RnCkR48knEPB4xrLki9SI06d3jxvoWGryiy61FFy1Ba/pxIf+N1/mbgKvcN6SmOn7V0KJf6zoRJjL
	wtmBBcHtgB9nN8T0TkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njc6A-000GSd-B4; Wed, 27 Apr 2022 07:28:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njc67-000GPR-1a
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 07:28:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F34F61A8A;
 Wed, 27 Apr 2022 07:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12800C385A7;
 Wed, 27 Apr 2022 07:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651044506;
 bh=kXHzBg/iTHGXGr9gIb2+0tGXBw6gYM+j0fsfvgN8s5c=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=BWS633cDSAVUo42/bMEyN+8q60+Wd1SvjlexMfEA0+CMQgwqpu1Wna/YSlSJp81rM
 nCYFVhvd6D7PuJW6QDtChaW4+qnyd883zF9A3BTdsUvbZOuveTz4j2F1loBOQpjZL9
 d5T6fOWGEtlU+X6Dm6cDXFblqAroNwrAqDmOKqZpjPdFkMGUUsAEeooeFWhNQyeE6K
 l+hzOQFal0Hp8Ic1ZhHnWdV0iPtPmx2rHT1zkl25saZvp5gfofsozPvBnYMn9PCGUu
 Gs2q7go+gWhtDWtQDdZH5gjhiZ3FOOTkk3+QDQsCLdHFkYhhxqaqGLJ0gWkMdi8BUe
 0817nYZqG6SxA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add read country code from SMBIOS for
 WCN6855/QCA6390
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220421023501.32167-1-quic_wgong@quicinc.com>
References: <20220421023501.32167-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165104450322.30072.25044330550359945.kvalo@kernel.org>
Date: Wed, 27 Apr 2022 07:28:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_002827_158923_F9BD312C 
X-CRM114-Status: UNSURE (   8.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> wrote:

> This read the country code from SMBIOS and send the country code
> to firmware, firmware will indicate the regulatory domain info of the
> country code and then ath11k will use the info.
> 
> dmesg:
> [ 1242.637173] ath11k_pci 0000:02:00.0: chip_id 0x2 chip_family 0xb board_id 0xff soc_id 0x400c0200
> [ 1242.637176] ath11k_pci 0000:02:00.0: fw_version 0x110b09e5 fw_build_timestamp 2021-06-22 09:32 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-02533-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> [ 1242.637253] ath11k_pci 0000:02:00.0: worldwide regdomain setting from SMBIOS
> [ 1242.637259] ath11k_pci 0000:02:00.0: bdf variant name not found.
> [ 1242.637261] ath11k_pci 0000:02:00.0: SMBIOS bdf variant name not set.
> [ 1242.637263] ath11k_pci 0000:02:00.0: DT bdf variant name not set.
> [ 1242.927543] ath11k_pci 0000:02:00.0: set current country pdev id 0 alpha2 00
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

66721bb4bbf2 ath11k: read country code from SMBIOS for WCN6855/QCA6390

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220421023501.32167-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
