Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A377D41C39
	for <ath11k@archiver.kernel.org>; Wed, 13 Nov 2024 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXYUTCE+a81zl9Ta7UDNjNr5PZ7H4oH4uNTRpRWHxws=; b=oPBxgP4s+3lhMuugbTUsa+JY2P
	KxY//OHN2r/BYCmDid8OO2MH+p3iRUStyR0rDG8RM0Sv8y+FlnFlVCvQYmHFW2vOKcXaYu2BtCKNp
	yG2wezkL07zvbL7vObNXYZjE2sx5ti8mRbs0ZbovwL7gEDIj+tQzOzjCL/kVnMDnICH37g4MxN5cQ
	nmpedMRmG/KQcvGRM7ul1WIB+grCPLxpifnQUc6WrnJ90Gw1OxjWI1kD4p4HKuf4idsYp9cYXI8AJ
	ufoB1YrRcGqkHmM+yO48DE9WQpui3szlm2vv7GBNFBMs5McyoDrxxgtRdmZ99rYBwExw3lt3OuVao
	htaZauzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBLZ-00000006Yu6-2u9h;
	Wed, 13 Nov 2024 11:15:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBIj-00000006YK0-1B67
	for ath11k@lists.infradead.org;
	Wed, 13 Nov 2024 11:12:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 090755C5438;
	Wed, 13 Nov 2024 11:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49629C4CECD;
	Wed, 13 Nov 2024 11:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731496364;
	bh=mIGdVzGsC4Nk+b93weI7HLWPEXwroJOOnErhV0tcHrY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=A+Y/T4Dkar86c5J2gKa6jC48JAiRut7QMWQ7m0RBpXvd8maYY6xEX8xiIBFUFMC9+
	 +Ks29tuWTOdx/HUSI3rt1mALI2uMU0tvPpdGirD0R2ONKVSz38aQI3+jJs5dPMoypQ
	 NZ7nL0eiIEG6szQhh8hQA2nGSIBmRjGtC9Lre/4GMIp/tp6yhrk6j4RQDcsXREZBrl
	 /mMDjMYHnjMar3bSI5zAGb65JZqv126sGtqO3YKMtZyKxuAu/vG5cvDyf3sO1jzTHt
	 lszd6fjsNONG0xg9egQ84NV4KXalXyfBV6X1Fyhq+zzmPfmQxPSzHmAz3EvS+R9V9G
	 IFEPtEMkM3kAA==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/6] wifi: ath11k: avoid burning CPU in
 ath11k_debugfs_fw_stats_request()
References: <20241113015631.3105-1-quic_bqiang@quicinc.com>
	<20241113015631.3105-2-quic_bqiang@quicinc.com>
Date: Wed, 13 Nov 2024 13:12:41 +0200
In-Reply-To: <20241113015631.3105-2-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Wed, 13 Nov 2024 09:56:26 +0800")
Message-ID: <877c972xqu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_031245_430499_4F07C586 
X-CRM114-Status: GOOD (  16.66  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> We get report [1] that CPU is running a hot loop in
> ath11k_debugfs_fw_stats_request():
>
> 94.60%     0.00%  i3status         [kernel.kallsyms]                 [k] do_syscall_64
>         |
>          --94.60%--do_syscall_64
>                    |
>                     --94.55%--__sys_sendmsg
>                               ___sys_sendmsg
>                               ____sys_sendmsg
>                               netlink_sendmsg
>                               netlink_unicast
>                               genl_rcv
>                               netlink_rcv_skb
>                               genl_rcv_msg
>                               |
>                                --94.55%--genl_family_rcv_msg_dumpit
>                                          __netlink_dump_start
>                                          netlink_dump
>                                          genl_dumpit
>                                          nl80211_dump_station
>                                          |
>                                           --94.55%--ieee80211_dump_station
>                                                     sta_set_sinfo
>                                                     |
>                                                      --94.55%--ath11k_mac_op_sta_statistics
>                                                                ath11k_debugfs_get_fw_stats
>                                                                |
>                                                                 --94.55%--ath11k_debugfs_fw_stats_request
>                                                                           |
>                                                                           |--41.73%--_raw_spin_lock_bh
>                                                                           |
>                                                                           |--22.74%--__local_bh_enable_ip
>                                                                           |
>                                                                           |--9.22%--_raw_spin_unlock_bh
>                                                                           |
>                                                                            --6.66%--srso_alias_safe_ret
>
> This is because, if for whatever reason ar->fw_stats_done is not set by
> ath11k_update_stats_event(), ath11k_debugfs_fw_stats_request() won't yield
> CPU before an up to 3s timeout.
>
> Add 100ms sleep to avoid CPU burning.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
>
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Reported-by: Yury Vostrikov <mon@unformed.ru>
> Closes: https://lore.kernel.org/all/7324ac7a-8b7a-42a5-aa19-de52138ff638@app.fastmail.com/ # [1]
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/debugfs.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
> index 57281a135dd7..a5e0f2092da5 100644
> --- a/drivers/net/wireless/ath/ath11k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath11k/debugfs.c
> @@ -207,6 +207,9 @@ static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
>  			break;
>  		}
>  		spin_unlock_bh(&ar->data_lock);
> +
> +		/* 100ms is empirical, change if required */
> +		msleep(100);
>  	}
>  	return 0;
>  }

Please don't reinvent the wheel. Why not just use completion instead of
this ugly spinning hack?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

