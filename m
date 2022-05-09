Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC47C433F5
	for <ath11k@archiver.kernel.org>; Mon,  9 May 2022 11:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4wI4qivbi0x66Dx71d+iJDd8W/ehBkDb4+Vkk4ROZg=; b=L3j1v2ANFRAjYx
	YcDg1XnEKsz46TD9TmjmcbnrEk3VuL8gE2He5gjlNcKRV6nouVjxz1rmb9ykx6qpZpKcA1HVOyMmQ
	cMhDXXZKXZMI7a30PGEBLBPqwxXmfQ3AZOacYTO/LuNSpMHAAxEUy9cu4KQSGDQHQgXbLb8hh8UMq
	swwmVhiXB4vrzHCsuccHo/Tsh2VTX86a5SvHZIiiKYJnZJgXbXoIxsEsCKMzru2ojN4PiBikEF3zc
	9rPZRuU47zcfdPuGZ23xQ9JWh07k0q8+Er/6C6OfQpyyMapQVxEBjOf9bfbfI2K0TX2VMBDWJIJIm
	hvdRMe5r2z755/Fi0hqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no1yV-00ECnB-SB; Mon, 09 May 2022 11:54:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no1yS-00EClQ-RX
 for ath11k@lists.infradead.org; Mon, 09 May 2022 11:54:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78F62B811CF;
 Mon,  9 May 2022 11:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBD2C385AB;
 Mon,  9 May 2022 11:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652097285;
 bh=jQjOOtNpxpDFq6PzmcAd+quJ3sSW0LUC1b7oMv0wFNs=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=iMGQrT1YNlPViSNCEGS7KBymcWcEP+4d7YL+07FMAS2F5dMvXYdMtLUryLzMJQFTr
 jgBS7etNr3a2raw9I8JSDVj5pIK0QT42lZzF+Vyx5wrWi5DuSoSDyr/MeG5g1EcFu5
 4YjqKI6ycMyRN9FZ/PuZzPemxiJf/hByQYm+xtS3vL+b0g4SPz5O3Pos2UzLppRERY
 Siubk4Qp+jE7CssroJ7EsFX8Z/at7sZ987VcY7dJnck5J1u63aEbumkrsgk4Ghapr6
 M711cPJKb2rqnKLZ0DVmYAThmjRZSqL9obTRkC68CGBKsADC0hFsLILrLaY7il4CQr
 W+ikIAutQDpcg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: reset 11d state in process of recovery
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220505034636.29582-1-quic_wgong@quicinc.com>
References: <20220505034636.29582-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165209728067.20365.11713036278436650363.kvalo@kernel.org>
Date: Mon,  9 May 2022 11:54:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_045449_085333_6A8E3B61 
X-CRM114-Status: GOOD (  16.08  )
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

> When doing simulate_fw_crash operation periodically with a short interval
> time such as 10 seconds, it is easy happened WMI command timed out for
> WMI_SCAN_CHAN_LIST_CMDID in ath11k_reg_update_chan_list().
> 
> log:
> [42287.610053] ath11k_pci 0000:01:00.0: wmi command 12291 timeout
> [42287.610064] ath11k_pci 0000:01:00.0: failed to send WMI_SCAN_CHAN_LIST cmd
> [42287.610073] ath11k_pci 0000:01:00.0: failed to perform regd update : -11
> 
> Note that this issue does not occur with a longer interval such as 20 seconds.
> 
> The reason the issue occurs with a shorter interval is the following steps:
> 1) Upon initial boot, or after device recovery, the initial hw scan plus
> the 11d scan will run, and when 6 GHz support is present, these scans
> can take up to 12 seconds to complete, so ath11k_reg_update_chan_list()
> is still waiting the completion of ar->completed_11d_scan.
> 2) If a simulate_fw_crash operation is received during this time, those
> scans do not complete, and ath11k_core_pre_reconfigure_recovery()
> complete the ar->completed_11d_scan, then ath11k_reg_update_chan_list()
> wakeup and start to send WMI_SCAN_CHAN_LIST_CMDID, but firmware is crashed
> at this moment, so wmi timed out occur.
> 
> To address this issue, reset the 11d state during device recovery so that
> WMI_SCAN_CHAN_LIST_CMDID does not timed out for short interval time such
> as 10 seconds.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Fixes: 1f682dc9fb37 ("ath11k: reduce the wait time of 11d scan and hw scan while add interface")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9497b7880ffd ath11k: reset 11d state in process of recovery

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220505034636.29582-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
