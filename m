Return-Path: <SRS0=mtRf=IH=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A09AC433E0
	for <ath11k@archiver.kernel.org>; Tue,  9 Mar 2021 10:57:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF77A6522B
	for <ath11k@archiver.kernel.org>; Tue,  9 Mar 2021 10:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF77A6522B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HSsxn/sNBuvqtlnIUaCxZJ3z0ZdS0JdzgxoV5dKJNlE=; b=jSSKGxzs/V7lDqDYGFHalixBs
	vYlWiBVkdahZZ5ZAJh4uLs1DktWCGsDhbuZmvWS2Y00kQz6cGvVzFXMOX+MAh/K4kokl0NZ1ZrgNi
	3f7P6P5ug4FdZ16TVF0L8z2042R4S8zfeJbppYI6jhRrF9HDRGqtKtp7WCZOPBJouBBylPMraUhTk
	ZXeiAIH+tRIAKbpOyuuhD+eqD+rgTUbAC7absE/KjR0kld+biem2bNNyn5/u5xyQ9qSEyO465Ed5p
	oZoU81c0b+4RaP+psyXNaaSlYGMrdJupOl/nrqlPiwt0hR+Xl0r0JDlwNLYZbf7VC9Qj99v20+7en
	OJR3gELgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJa3U-004FNQ-Fi; Tue, 09 Mar 2021 10:57:36 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJa3O-004FML-8p
 for ath11k@lists.infradead.org; Tue, 09 Mar 2021 10:57:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615287449; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=hi8Dchud9oBdFIrkBkCAoc6TTQnE4IpgjUOM0nIK/S0=;
 b=RYtkQsFLd3tZgjLfCs2OPDLTYzEd2lVT1Sl8KIzk+o5RKGEM3R+K8FabV6Vdd8F4nVZQO54I
 cZAAju4U4pQ/2qeTVTqesiKMwq4uUqRAUbxKDPtlfkxof9q7TtKzGMqlOgr3EMIWajhLreQy
 HD1KbkDuzYcWKFkcREQBan0X7cs=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60475498f842f723a9dd64c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 10:57:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0F12CC43463; Tue,  9 Mar 2021 10:57:28 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E7EEEC433C6;
 Tue,  9 Mar 2021 10:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E7EEEC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Aloka Dixit <alokad@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 John Crispin <john@phrozen.org>
Subject: Re: [PATCH V5 1/2] ath11k: add WMI calls to manually
 add/del/pause/resume TWT dialogs
References: <20210222192651.1782-1-alokad@codeaurora.org>
 <20210222192651.1782-2-alokad@codeaurora.org>
Date: Tue, 09 Mar 2021 12:57:23 +0200
In-Reply-To: <20210222192651.1782-2-alokad@codeaurora.org> (Aloka Dixit's
 message of "Mon, 22 Feb 2021 11:26:50 -0800")
Message-ID: <87sg54zjak.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_105730_570037_0BA2DC8E 
X-CRM114-Status: GOOD (  17.78  )
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

Aloka Dixit <alokad@codeaurora.org> writes:

> From: John Crispin <john@phrozen.org>
>
> These calls are used for debugging and will be required for WFA
> certification tests.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Co-developed-by: Aloka Dixit <alokad@codeaurora.org>
> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>

[...]

> +int ath11k_wmi_send_twt_add_dialog_cmd(struct ath11k *ar,
> +				       struct wmi_twt_add_dialog_params *params)
> +{
> +	struct ath11k_pdev_wmi *wmi = ar->wmi;
> +	struct ath11k_base *ab = wmi->wmi_ab->ab;
> +	struct wmi_twt_add_dialog_params_cmd *cmd;
> +	struct sk_buff *skb;
> +	int ret, len;
> +
> +	len = sizeof(*cmd);
> +
> +	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	cmd = (struct wmi_twt_add_dialog_params_cmd *)skb->data;
> +	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_TWT_ADD_DIALOG_CMD) |
> +			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
> +
> +	cmd->vdev_id = params->vdev_id;
> +	ether_addr_copy(cmd->peer_macaddr.addr, params->peer_macaddr);
> +	cmd->dialog_id = params->dialog_id;
> +	cmd->wake_intvl_us = params->wake_intvl_us;
> +	cmd->wake_intvl_mantis = params->wake_intvl_mantis;
> +	cmd->wake_dura_us = params->wake_dura_us;
> +	cmd->sp_offset_us = params->sp_offset_us;
> +	cmd->flags = params->twt_cmd;
> +	if (params->flag_bcast)
> +		cmd->flags |= WMI_TWT_ADD_DIALOG_FLAG_BCAST;
> +	if (params->flag_trigger)
> +		cmd->flags |= WMI_TWT_ADD_DIALOG_FLAG_TRIGGER;
> +	if (params->flag_flow_type)
> +		cmd->flags |= WMI_TWT_ADD_DIALOG_FLAG_FLOW_TYPE;
> +	if (params->flag_protection)
> +		cmd->flags |= WMI_TWT_ADD_DIALOG_FLAG_PROTECTION;
> +
> +	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
> +		   "WMI add TWT dialog, vdev %u, dialog id %u,\n"
> +		   "wake interval %u, mantissa %u, wake duration %u,\n"
> +		   "service period offset %u, flags 0x%x\n",

In debug messages please use all lower case, and no commas nor \n (ie.
all in one line).

> +	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_TWT_ADD_DIALOG_CMDID);
> +
> +	if (ret) {
> +		ath11k_warn(ab,
> +			    "Failed to send WMI command to add TWT dialog\n");

Warning and error messages should follow style:

"failed to send add TWT dialog WMI command: %d", ret

> +static void ath11k_wmi_twt_add_dialog_event(struct ath11k_base *ab,
> +					    struct sk_buff *skb)
> +{
> +	const char *status[] = {
> +		"OK", "TWT_NOT_ENABLED", "USED_DIALOG_ID", "INVALID_PARAM",
> +		"NOT_READY", "NO_RESOURCE", "NO_ACK", "NO_RESPONSE",
> +		"DENIED", "UNKNOWN_ERROR"
> +	};
> +	const void **tb;
> +	const struct wmi_twt_add_dialog_event *ev;
> +	int ret;
> +
> +	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
> +	if (IS_ERR(tb)) {
> +		ret = PTR_ERR(tb);
> +		ath11k_warn(ab,
> +			    "failed to parse TWT add dialog status event tlv: %d\n", ret);
> +		return;
> +	}
> +
> +	ev = tb[WMI_TAG_TWT_ADD_DIALOG_COMPLETE_EVENT];
> +	if (!ev) {
> +		ath11k_warn(ab, "failed to fetch TWT add dialog event\n");
> +		goto exit;
> +	}
> +
> +	ath11k_dbg(ab, ATH11K_DBG_WMI,
> +		   "TWT Add Dialog Event - vdev: %d, dialog id: %d, status: %s\n",
> +		   ev->vdev_id, ev->dialog_id, status[ev->status]);

You are not checking that status array is not used out of bounds. I
would just remove the string conversion to keep things simple, but if
you want to print in strings please add a helper function to do the
conversion and add status values as enum to wmi.h.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
