Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734DFC433EF
	for <ath11k@archiver.kernel.org>; Tue, 10 May 2022 16:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNMaQYfZj7EmnY7dzZZx44Mplm3713FPMRcutHWSsAE=; b=ub/vXlysMZQEzq
	pgOF88F0PFre9TrCGqKPK07vSM8tgcibK7oS5wjhShFZPldMWsaGioxX0u2noY5BzPipZ7pSGFFWM
	k7R2uAYaRq/7ci36YxlzJrks0+MeFz7UzUiksgtKPgzJsZFQPuJ7IYrirdXT/v3vuqIEWW2g831tl
	Qu7rfCZRTvjJgGGNYgS1B7c6hu5bYICP7JrqlghYpa4nUrFqCONttzyqG009eb2Wt9VABgEwxhm0V
	NSlUYx4OL1fPzc6k3e7xehL66pRIaexnK0DXEKNA9M/M/FBgHMEH7PEbE0VJM2C/HFWMZe2p02gwx
	W2mV0B4sKJ9fn+mb/SQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSkP-0035n9-O3; Tue, 10 May 2022 16:30:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSkM-0035lv-Qo
 for ath11k@lists.infradead.org; Tue, 10 May 2022 16:30:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF450617C5;
 Tue, 10 May 2022 16:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8753C385A6;
 Tue, 10 May 2022 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652200201;
 bh=JcqMRF2kIwrTJsoNWDWbv7L3FOOPJ3N11qWphHlZbvA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=hvfbW6JG8xrDLPmd2BgNXEgFRpUHkTbO9DBrw+rNAaStoXJlf6+lQ/9G7DaV++I2V
 fFRHW65kD0+hn3woRv1tE5JWbNa0Wesw7nifDV7DsMzLM1eVDVIHxIV3IarbnNTR8p
 7rtP81SYqaxpIeiNcaHs0JYLAPX3iekLegc800eBVOPhFndmuT0xoB4b2IIHDM955o
 8de4rtWgniMkWTROUiFRY5WlNRAXUdgDsbPO8SHkmJ4r3GULuksdKCUcYJB0aP9b6m
 yOf4RXTOgJTX6357z1Argdrw5To5VVNrEr5zn5oLs4KcPswhaIracqhcf7D6L6jQwo
 L2HDMi90aFMEg==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3] ath11k: Handle keepalive during WoWLAN suspend and
 resume
References: <20220506012540.1579604-1-quic_bqiang@quicinc.com>
Date: Tue, 10 May 2022 19:29:56 +0300
In-Reply-To: <20220506012540.1579604-1-quic_bqiang@quicinc.com> (Baochen
 Qiang's message of "Fri, 6 May 2022 09:25:40 +0800")
Message-ID: <87wnet73ln.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_093002_964204_86F52E87 
X-CRM114-Status: GOOD (  19.51  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> With WoWLAN enabled and after sleeping for a rather long time,
> we are seeing that with some APs, it is not able to wake up
> the STA though the correct wake up pattern has been configured.
> This is because the host doesn't send keepalive command to
> firmware, thus firmware will not send any packet to the AP and
> after a specific time the AP kicks out the STA.
>
> Fix this issue by enabling keepalive before going to suspend
> and disabling it after resume back.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

[...]

> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -5907,6 +5907,45 @@ struct wmi_pdev_set_geo_table_cmd {
>  	u32 rsvd_len;
>  } __packed;
>  
> +struct wmi_sta_keepalive_cmd {
> +	u32 tlv_header;
> +	u32 vdev_id;
> +	u32 enabled;
> +	u32 method; /* WMI_STA_KEEPALIVE_METHOD_ */
> +	u32 interval; /* in seconds */
> +	/* NOTE: following this structure is the TLV for ARP Response:
> +	 * WMI_STA_KEEPALVE_ARP_RESPONSE arp_resp; <-- ARP response
> +	 */
> +} __packed;

I cleaned up the comments a bit.

> +enum wmi_sta_keepalive_method {
> +	WMI_STA_KEEPALIVE_METHOD_NULL_FRAME = 1, /* 802.11 NULL frame */
> +	WMI_STA_KEEPALIVE_METHOD_UNSOLICITED_ARP_RESPONSE = 2, /* ARP response */
> +	WMI_STA_KEEPALIVE_METHOD_ETHERNET_LOOPBACK = 3, /* ETHERNET LOOPBACK */
> +	WMI_STA_KEEPALIVE_METHOD_GRATUITOUS_ARP_REQUEST = 4, /* gratuitous ARP req */
> +	WMI_STA_KEEPALIVE_METHOD_MGMT_VENDOR_ACTION = 5, /* vendor action frame */
> +};

The comments are not really bringing any extra value from the actual
names so I just removed them.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
