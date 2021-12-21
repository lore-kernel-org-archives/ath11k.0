Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA163C433F5
	for <ath11k@archiver.kernel.org>; Tue, 21 Dec 2021 07:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOY9YIAzRkfNrfGJL45D3Xnzqlw6ZBfD/2S1dofI9HY=; b=og0ipSs4PGSgOe
	95Le72JxbYy0j4nOR6Lk6g1/hhlsZOMYVwHzP6soDl+9puaIlnCDKQiwhpVhCJmv4Qg1853NxP5gg
	OLpcL5aHoSHUjMxGP99jRPYjgHQQbf7QIR1NGiPJfTBe77UAxC8VHRkn1O+TAZZwncgYutO6YNPdu
	V08Zt/wntEZEwio83Oy35dQFS91Sn6g5QranxVyMn0drKGHmuLqlYS1sncP3baCvo5rxLSpS3Wvdb
	nZbdt7nCh80JFa88S55zN3/nxs2shwm6IIAsWL7HHb86NkqqY38Fc5Fz/QEoAFp+9oPmyVIBaUDTT
	ytBl5dlVNm3vAprLxKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzZlr-005oHh-0c; Tue, 21 Dec 2021 07:41:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzZln-005oGu-LQ
 for ath11k@lists.infradead.org; Tue, 21 Dec 2021 07:41:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3121161154;
 Tue, 21 Dec 2021 07:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0580C36AE7;
 Tue, 21 Dec 2021 07:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640072470;
 bh=PVFg5S1sgvZBxDIrRUWz0zd6gmwybBdxsRBeZJTS/8M=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=HbCiI8qisADsk55WS6qrrdZb5ZUemazeI3OwigEr7OyWlAf0uBwc11o8vbKJuZXcf
 QllifbiG5jKyzvXMEoKnZwReM2xlzrx7r7SaPudtleZV2ptH2GlmTaHuajX+mlgaVK
 laeM5NuE+5DyCC1orLB3cbhXnj+Oue9xoUAIKomysLFoy0TvP3RYJlMocklZZCwuVV
 ZsTafZlY+JtLfNKhL6dTh4pdyzdw99abS/lMCv2zNfsoC0D734BKcfim/om3KAeaxG
 1LPEMhoARy9UTBBOtlQT3YEBhDSbQOjpc5Eej4/rEHD/7ygKAUxb8CUhHVwTzO72e3
 7JdJTOSJgEm2w==
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: add regdb.bin download for regdb offload
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211220062355.17021-1-quic_wgong@quicinc.com>
References: <20211220062355.17021-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164007246520.16882.10676980430691629338.kvalo@kernel.org>
Date: Tue, 21 Dec 2021 07:41:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_234111_816632_304D524C 
X-CRM114-Status: GOOD (  16.12  )
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

> The regdomain is self-managed type for ath11k, the regdomain info is
> reported from firmware, it is not from wireless regdb. Firmware fetch
> the regdomain info from board data file before. Currently most of the
> regdomain info has moved to another file regdb.bin from board data
> file for some chips such as QCA6390 and WCN6855, so the regdomain info
> left in board data file is not enough to support the feature which need
> more regdomain info.
> 
> After download regdb.bin, firmware will fetch the regdomain info from
> regdb.bin instead of board data file and report to ath11k. If it does
> not have the file regdb.bin, it also can initialize wlan success and
> firmware then fetch regdomain info from board data file.
> 
> Add download the regdb.bin before download board data for some specific
> chip which support supports_regdb in hardware parameters.
> 
> download regdb.bin log:
> [430082.334162] ath11k_pci 0000:05:00.0: chip_id 0x2 chip_family 0xb board_id 0x106 soc_id 0x400c0200
> [430082.334169] ath11k_pci 0000:05:00.0: fw_version 0x110c8b4c fw_build_timestamp 2021-10-25 07:41 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-02892-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> [430082.334414] ath11k_pci 0000:05:00.0: boot firmware request ath11k/WCN6855/hw2.0/regdb.bin size 24310
> 
> output of "iw reg get"
> global
> country US: DFS-FCC
>         (2402 - 2472 @ 40), (N/A, 30), (N/A)
>         (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>         (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
>         (5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
>         (5735 - 5835 @ 80), (N/A, 30), (N/A)
>         (57240 - 63720 @ 2160), (N/A, 40), (N/A)
> 
> phy#0 (self-managed)
> country US: DFS-FCC
>         (2402 - 2472 @ 40), (6, 30), (N/A)
>         (5170 - 5250 @ 80), (N/A, 24), (N/A), AUTO-BW
>         (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
>         (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS, AUTO-BW
>         (5735 - 5895 @ 160), (N/A, 30), (N/A), AUTO-BW
>         (5945 - 7125 @ 160), (N/A, 24), (N/A), NO-OUTDOOR, AUTO-BW
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

01417e57939f ath11k: add regdb.bin download for regdb offload

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211220062355.17021-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
