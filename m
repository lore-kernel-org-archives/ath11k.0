Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ho4lo-0007GS-Ss
 for ath11k@lists.infradead.org; Thu, 18 Jul 2019 11:40:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] ath11k: ignore event 0x6017
References: <20190718054910.362-1-john@phrozen.org>
Date: Thu, 18 Jul 2019 14:40:16 +0300
In-Reply-To: <20190718054910.362-1-john@phrozen.org> (John Crispin's message
 of "Thu, 18 Jul 2019 07:49:09 +0200")
Message-ID: <877e8f371b.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

John Crispin <john@phrozen.org> writes:

> Everytime a new peer gets associated, we see the following message in the log
> - ath11k c000000.wifi1: Unknown eventid: 0x6017
> Ignore this event for now. We probably need to handle the event properly when
> we add OMI support.
>
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/net/wireless/ath/ath11k/wmi.c |  1 +
>  drivers/net/wireless/ath/ath11k/wmi.h | 13 ++++++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index cba9f3a9ebfd..4ec6f5d50459 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -5591,6 +5591,7 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
>  	/* add Unsupported events here */
>  	case WMI_TBTTOFFSET_EXT_UPDATE_EVENTID:
>  	case WMI_VDEV_DELETE_RESP_EVENTID:
> +	case WMI_PEER_OPER_MODE_CHANGE_EVENTID:
>  		ath11k_dbg(ab, ATH11K_DBG_WMI,
>  			   "ignoring unsupported event 0x%x\n", id);
>  		break;
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
> index 7d933eafd3cd..364b44080493 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -288,7 +288,6 @@ enum wmi_tlv_cmd_id {
>  	WMI_PEER_REORDER_QUEUE_REMOVE_CMDID,
>  	WMI_PEER_SET_RX_BLOCKSIZE_CMDID,
>  	WMI_PEER_ANTDIV_INFO_REQ_CMDID,
> -	WMI_PEER_OPER_MODE_CHANGE_EVENTID,
>  	WMI_BCN_TX_CMDID = WMI_TLV_CMD(WMI_GRP_MGMT),
>  	WMI_PDEV_SEND_BCN_CMDID,
>  	WMI_BCN_TMPL_CMDID,
> @@ -586,6 +585,18 @@ enum wmi_tlv_event_id {
>  	WMI_WDS_PEER_EVENTID,
>  	WMI_PEER_STA_PS_STATECHG_EVENTID,
>  	WMI_PEER_ANTDIV_INFO_EVENTID,
> +	WMI_PEER_RESERVED0_EVENTID,
> +	WMI_PEER_RESERVED1_EVENTID,
> +	WMI_PEER_RESERVED2_EVENTID,
> +	WMI_PEER_RESERVED3_EVENTID,
> +	WMI_PEER_RESERVED4_EVENTID,
> +	WMI_PEER_RESERVED5_EVENTID,
> +	WMI_PEER_RESERVED6_EVENTID,
> +	WMI_PEER_RESERVED7_EVENTID,
> +	WMI_PEER_RESERVED8_EVENTID,
> +	WMI_PEER_RESERVED9_EVENTID,
> +	WMI_PEER_RESERVED10_EVENTID,
> +	WMI_PEER_OPER_MODE_CHANGE_EVENTID,

Why all these reserved ids, is it like that also in official WMI header
definitions? Can someone from Qualcomm check this and add proper names
for the ids?

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
