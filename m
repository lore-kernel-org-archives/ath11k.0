Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EF1C433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 17:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBGdD1DI/AF9wjuhyw/gSGvZPbr6HNoBPr4n48W526M=; b=3lGV/z6gZiSEwK
	zL1qSJcrx7OwMrre+KVHa7hKOgIiYmOYdPsD/VMJzFTEL9Wi8g1ct6YdAJopg3lbWm3l2FoXRwsUl
	g/gSdPnn39v2Vhy5wrwzLsYNsOYhIXylG5bIkYsxOmHE437OWM1Qx+auXJVEnZn4ps1N3SROr8azO
	3O7rW2Su5m2MQLM2GbvaunE9Fz3lOz1tccPWqHyVJkAeTJoM+o/ePfROSSN4OYxI8wKhoQTrU5U/o
	aEMygvku5cTR9/eV1USjtpVqUSoSpi/1wP/owWfr4ZY8OhE6HFhrEoErFtIha4qHe/yl8zzKKxk0F
	L9F8TdCHiV4oDhDJic/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvNRb-00H1wL-RJ; Thu, 09 Dec 2021 17:42:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvNPd-00H1Dr-RR
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 17:41:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D79A0CE2788;
 Thu,  9 Dec 2021 17:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0A4C341C3;
 Thu,  9 Dec 2021 17:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639071654;
 bh=IuFXyW0UIszz7IRa4DgXSvKvJgL6hujh2kGssNlUOZ8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ndfjZbeeTrThS7qGYe49kVoLULhSc8kcoEz6roxQM4/gMfkBIVi/xcQQAbORyGwB+
 jnnmwmwikfnHrF6rQGbbevrst4zWdMC4GtwQvPdLX4NzvCdMvmKWVfDYB0kihf6ElA
 f1Ca/nPJnZQV2FXE0/4CXMFP1nnEZOkbuUJXWGhbKI9HO8ZMtBYs6wMkFz5JjQc9Xl
 A+RdOoM7QwAad1ipUVKHBW10n+5lhkcdeK58Ng9mmgeJaX9AracXBj0eISy4WIaYS+
 45uy3NOd6uY3DSikmZvbHzbI0gpdrQZ8RagI0gCebNuG/O+5kdtohjHUovxuOGdIFz
 4sn6pIIXUphwg==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 14/15] ath11k: add handler for WMI_VDEV_SET_TPC_POWER_CMDID
References: <20211026111913.7346-1-quic_wgong@quicinc.com>
 <20211026111913.7346-15-quic_wgong@quicinc.com>
Date: Thu, 09 Dec 2021 19:40:51 +0200
In-Reply-To: <20211026111913.7346-15-quic_wgong@quicinc.com> (Wen Gong's
 message of "Tue, 26 Oct 2021 07:19:12 -0400")
Message-ID: <87pmq5vfq4.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_094058_338294_EDBC63AB 
X-CRM114-Status: GOOD (  16.23  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> Add the handler for WMI_VDEV_SET_TPC_POWER_CMDID, it is for 6 GHz band.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/wmi.c | 63 +++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/wmi.h | 61 ++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index 985035fab744..603a4373af57 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -2225,6 +2225,69 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
>  	return ret;
>  }
>  
> +int ath11k_wmi_send_vdev_set_tpc_power(struct ath11k *ar,
> +				       u32 vdev_id,
> +				       struct ath11k_reg_tpc_power_info *param)
> +{
> +	struct ath11k_pdev_wmi *wmi = ar->wmi;
> +	struct wmi_vdev_set_tpc_power_cmd *cmd;
> +	struct wmi_vdev_ch_power_info *ch;
> +	struct sk_buff *skb;
> +	struct wmi_tlv *tlv;
> +	u8 *ptr;
> +	int i, ret, len;
> +
> +	len = sizeof(*cmd) + TLV_HDR_SIZE;
> +	len += (sizeof(struct wmi_vdev_ch_power_info) * param->num_pwr_levels);
> +
> +	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	ptr = skb->data;
> +
> +	cmd = (struct wmi_vdev_set_tpc_power_cmd *)ptr;
> +	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_SET_TPC_POWER_CMD) |
> +			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
> +	cmd->vdev_id = vdev_id;
> +	cmd->psd_power = param->is_psd_power;
> +	cmd->eirp_power = param->eirp_power;
> +	cmd->power_type_6ghz = param->power_type_6g;
> +	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
> +		   "wmi TPC vdev_id: %d is_psd_power: %d eirp_power: %d power_type_6g: %d\n",
> +		   vdev_id, param->is_psd_power, param->eirp_power, param->power_type_6g);

"wmi tpc vdev_id %d is_psd_power %d eirp_power %d power_type_6g %d\n"

> +
> +	ptr += sizeof(*cmd);
> +	tlv = (struct wmi_tlv *)ptr;
> +	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
> +		      FIELD_PREP(WMI_TLV_LEN, param->num_pwr_levels * sizeof(*ch));
> +
> +	ptr += TLV_HDR_SIZE;
> +	ch = (struct wmi_vdev_ch_power_info *)ptr;
> +
> +	for (i = 0; i < param->num_pwr_levels; i++, ch++) {
> +		ch->tlv_header = FIELD_PREP(WMI_TLV_TAG,
> +					    WMI_TAG_VDEV_CH_POWER_INFO) |
> +				FIELD_PREP(WMI_TLV_LEN,
> +					   sizeof(*ch) - TLV_HDR_SIZE);
> +
> +		ch->chan_cfreq = param->chan_power_info[i].chan_cfreq;
> +		ch->tx_power = param->chan_power_info[i].tx_power;
> +
> +		ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
> +			   "wmi TPC chan_cfreq: %d , tx_power: %d\n",
> +			   ch->chan_cfreq, ch->tx_power);

"wmi tpc chan_cfreq %d tx_power %d\n"

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
