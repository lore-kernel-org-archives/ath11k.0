Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DD7C433F5
	for <ath11k@archiver.kernel.org>; Tue,  1 Feb 2022 10:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zqSFodo3aCY+6/22AGGho5JV/tDCQ8WnKOCTQQqyIo=; b=S8Mde5BjQqPOb7
	T6awmgJmATueaBouLChcXVH/jFfuUJxDfZMH3rPB0siob06dUn+CeuenC7b4bx7pxwF2WFTfamsyU
	1iwD3lzgG9aawWr7cT6zhotcQjTC7kiYCN2mOZKz0tgqJ8Epv1judmTYji57laCF4tyFGtCW1tCh2
	RwCwVHfl+feEyvxZQ1LA/+1V/3s+B6oJrDBjDNsK4vVEvX8o+MGi/TYs8pnV0JiA1o3U0+zjNJNp1
	/v7auTC0S49iXN+ckCoBrxSm6j54h6i/xRKBa/dgiOw4T1IbspYNOU1b+ewakYNhySQKkmfxXFy7B
	z873Dj+y7zk0fMgCTVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEqpy-00Bn6g-L0; Tue, 01 Feb 2022 10:56:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEqpv-00Bn6E-0y
 for ath11k@lists.infradead.org; Tue, 01 Feb 2022 10:56:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED3B1614F0;
 Tue,  1 Feb 2022 10:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204F6C340EB;
 Tue,  1 Feb 2022 10:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643712988;
 bh=SpC38fS8iFbLq0u6UuKQwO4knvRRZ3wf4OOgc0c9GdA=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=bsWh8gGu1VOy5fdcgyyjMVKwQpOhwzjGPFAC0fH6C7oho5EKzP4+cLdZMjxpNPcc6
 TtxMBuGWDVIzBJuvgP4Hfryeoo/ptXSdTgAHhWtOc3EUsl2v/WK5B+COr5TH30Ap5z
 g5ohi4ni46ZQ5suMM9kRb2IJ4NNoAl4B1ZsRs24LWvw/0UFv6Qdv0U6ZHT50+qY82f
 ywK0IOp3C/EGX+B3TUn3wo77shBs1ABqvQrEtUfnO7HSD2r68wJuqWVrXJK5A7CWlo
 WWCMSLFx36FhPOjduG0ViUsWZ0Ut1ByafixB78a+KciROCoAGbPgEOkm+ZZXmVXLJd
 OtZAKrneLpEOg==
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath11k: Add debugfs interface to configure firmware
 debug log level
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1642405103-32302-1-git-send-email-quic_seevalam@quicinc.com>
References: <1642405103-32302-1-git-send-email-quic_seevalam@quicinc.com>
To: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164371298346.12561.4258328175713727016.kvalo@kernel.org>
Date: Tue,  1 Feb 2022 10:56:26 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_025635_205083_C009BFC0 
X-CRM114-Status: GOOD (  10.74  )
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

Seevalamuthu Mariappan <quic_seevalam@quicinc.com> wrote:

> Add debugfs interface "fw_dbglog_config" to configure firmware log level.
> Configuration is done via WMI command WMI_DBGLOG_CFG_CMDID.
> 
> Command to configure,
> echo "<dbglog_param> <values>" >
> /sys/kernel/debug/ath11k/<hw>/macX/fw_dbglog_config
> 
> where dbglog_param can be,
>   1) WMI_DEBUG_LOG_PARAM_LOG_LEVEL - configure log level for a given module
>      here, <values> = <0xaaaa00bb>, 'aaaa' - module id and 'bb' - loglevel
>   2) WMI_DEBUG_LOG_PARAM_VDEV_ENABLE - enable debug log for a given vdev
>      here, <values> = vdev_id
>   3) WMI_DEBUG_LOG_PARAM_VDEV_DISABLE - disable debug log for a given vdev
>      except ERROR logs
>      here, <values> = vdev_id
>   4) WMI_DEBUG_LOG_PARAM_VDEV_ENABLE_BITMAP - set vdev enable bitmap
>        here, <values> = vdev_enable_bitmap
>   5) WMI_DEBUG_LOG_PARAM_MOD_ENABLE_BITMAP - set a given log level to all the
>      modules specified in the module bitmap. Command to configure for this log param,
> 
>      $ echo "5 <values> <module_id_index> <is_end>" >
>          /sys/kernel/debug/ath11k/<hw>/macX/fw_dbglog_config
>      here,
>                 <values> = <0xaaaaaaaa000000bb>, 'aaaaaaaa' - module bitmap and
>                           'bb' - loglevel
>                 <module_id_index> = index of module bitmap. Max module id is 512.
>                                     So, module_id_index is 0-15.
>                 <is_end> = to indicate if more configuration to follow.
> 
>   6) WMI_DEBUG_LOG_PARAM_WOW_MOD_ENABLE_BITMAP - Wow mode specific logging enable.
>      Command to configure for this log param,
> 
>       $ echo "6 <values> <module_id_index> <is_end>" >
>           /sys/kernel/debug/ath11k/<hw>/macX/fw_dbglog_config
>       here,
>                  <values> = <0xaaaaaaaa000000bb>, 'aaaaaaaa' - module bitmap and
>                               'bb' - loglevel
>                  <module_id_index> = index of module bitmap. Max module id is 512.
>                                      So, module_id_index is 0-15.
>                  <is_end> = to indicate if more configuration to follow.
> 
> Sample command usage,
> 
> To enable module WLAN_MODULE_WMI and log level ATH11K_FW_DBGLOG_VERBOSE,
> echo "1 0x10001" > /sys/kernel/debug/ath11k/<hw>/macX/fw_dbglog_config
> 
> To enable module bit map from 32 to 63 and log level ATH11K_FW_DBGLOG_VERBOSE,
> echo "5 0xffffffff00000001 1 1" > /sys/kernel/debug/ath11k/<hw>/macX/fw_dbglog_config
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

f295ad912910 ath11k: Add debugfs interface to configure firmware debug log level

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1642405103-32302-1-git-send-email-quic_seevalam@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
